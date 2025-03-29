import 'package:flutter/material.dart';
import 'package:meca_inventory/config/dependency_injection/get_it.dart';
import 'package:meca_inventory/domain/use_cases/get_products_use_case.dart';
import 'package:meca_inventory/presentation/add_product/add_product_screen.dart';
import 'package:meca_inventory/presentation/empty_products/empty_products_screen.dart';
import 'package:meca_inventory/presentation/home/blocs/delete_product/delete_product_bloc.dart';
import 'package:meca_inventory/presentation/home/blocs/edit_product/edit_product_bloc.dart';
import 'package:meca_inventory/presentation/home/blocs/get_products/get_products_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meca_inventory/presentation/home/widgets/product_list.dart';

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
                  title: const Text(
                    'Meca inventario',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2.0,
                    ),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  elevation: 4,
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
    );
  }
}
