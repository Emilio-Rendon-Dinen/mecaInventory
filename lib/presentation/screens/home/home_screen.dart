import 'package:flutter/material.dart';
import 'package:meca_inventory/config/dependency_injection/get_it.dart';
import 'package:meca_inventory/domain/use_cases/get_products_use_case.dart';
import 'package:meca_inventory/l10n/app_localizations.dart';
import 'package:meca_inventory/presentation/screens/add_product/add_product_screen.dart';
import 'package:meca_inventory/presentation/screens/empty_products/empty_products_screen.dart';
import 'package:meca_inventory/presentation/screens/home/blocs/delete_product/delete_product_bloc.dart';
import 'package:meca_inventory/presentation/screens/home/blocs/delete_product/delete_product_state.dart';
import 'package:meca_inventory/presentation/shared/blocs/edit_product/edit_product_bloc.dart';
import 'package:meca_inventory/presentation/shared/blocs/edit_product/edit_product_state.dart';
import 'package:meca_inventory/presentation/screens/home/blocs/get_products/get_products_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meca_inventory/presentation/screens/home/widgets/product_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<GetProductsBloc>(
            create: (context) => GetProductsBloc()
              ..add(
                GetProductsDataEvent(useCase: getIt.get<GetProductsUseCase>()),
              ),
          ),
          BlocProvider<EditProductBloc>(
            create: (context) => EditProductBloc(),
          ),
          BlocProvider<DeleteProductBloc>(
            create: (context) => DeleteProductBloc(),
          )
        ],
        child: MultiBlocListener(
          listeners: [
            //El listener ayuda a escuchar cambios sin reconstruir la ui y mostrar snackbars o dialogos
            //En este caso se tiene que tener un MultiBlocListener ya que escucha los cambios de estados de distintos blocs
            BlocListener<DeleteProductBloc, DeleteProductState>(
              listener: (context, state) {
                if (state is DeleteProductSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Producto eliminado correctamente')),
                  );
                  context.read<GetProductsBloc>().add(
                        GetProductsDataEvent(
                          useCase: getIt.get<GetProductsUseCase>(),
                        ),
                      );
                }
                if (state is DeleteProductError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content:
                            Text('Ocurrio un error al eliminar el producto')),
                  );
                }
              },
            ),
            BlocListener<GetProductsBloc, GetProductsState>(
              listener: (context, state) {
                if (state is GetProductsError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content:
                            Text('Ocurrio un error al obtener los productos')),
                  );
                }
              },
            ),
            BlocListener<EditProductBloc, EditProductState>(
              listener: (context, state) {
                if (state is EditProductSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Producto editado correctamente')),
                  );
                  context.read<GetProductsBloc>().add(
                        UpdateProductInListEvent(updatedProduct: state.product),
                      );
                }
                if (state is EditProductError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content:
                            Text('Ocurrio un error al editar el producto')),
                  );
                }
              },
            ),
          ],
          child: BlocBuilder<GetProductsBloc, GetProductsState>(
            builder: (context, state) {
              if (state is GetProductsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is GetProductsSuccess) {
                if (state.products.isEmpty) {
                  return const EmptyProductsScreen();
                } else {
                  return Scaffold(
                    appBar: AppBar(
                      title: Text(
                        AppLocalizations.of(context)!.appTitle,
                        style: TextStyle(
                          fontSize: 24,
                          color: Theme.of(context).colorScheme.onPrimary,
                          letterSpacing: 2.0,
                        ),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    body: _selectedIndex == 0
                        ? ProductList(products: state.products)
                        : const AddProductScreen(
                            isContent: true,
                          ),
                    bottomNavigationBar: BottomNavigationBar(
                      items: const <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          icon: Icon(Icons.list),
                          label: 'Products',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.add),
                          label: 'Add',
                        ),
                      ],
                      currentIndex: _selectedIndex,
                      onTap: _onItemTapped,
                    ),
                  );
                }
              } else if (state is GetProductsError) {
                return Text('Error: ${state.error}');
              } else {
                return const SizedBox();
              }
            },
          ),
        ));
  }
}



/*
Diferencias entre BlocBuilder y BlocConsumer
BlocBuilder:
Propósito: Se utiliza para reconstruir una parte de la UI en respuesta a un cambio de estado en el Bloc.

Uso principal: Cuando solo te interesa actualizar la UI en función del estado del bloc.

Escucha el estado: Solo se utiliza para construir la UI cuando el estado cambia. 
No permite realizar efectos secundarios (como mostrar un Snackbar o realizar una navegación).

BlocConsumer:
Propósito: Combina BlocListener (para escuchar cambios de estado y ejecutar efectos secundarios) 
y BlocBuilder (para reconstruir la UI cuando el estado cambia).

Uso principal: Cuando necesitas escuchar el estado y ejecutar algún efecto secundario 
(como mostrar un Snackbar, navegar a otra pantalla, etc.), además de reconstruir la UI.

Escucha el estado + Efectos secundarios: Permite escuchar el estado y hacer cosas como 
mostrar un Snackbar, ejecutar una animación o cambiar la navegación sin reconstruir toda la UI.
*/