import 'package:flutter/material.dart';
import 'package:meca_inventory/config/dependency_injection/get_it.dart';
import 'package:meca_inventory/domain/use_cases/get_products_use_case.dart';
import 'package:meca_inventory/presentation/add_product/add_product_screen.dart';
import 'package:meca_inventory/presentation/empty_products/empty_products_list.dart';
import 'package:meca_inventory/presentation/home/blocs/get_products/get_products_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static final List<Widget> _screens = <Widget>[
    const EmptyProductsList(),
    const AddProductScreen(),
  ];

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
          create: (context) => GetProductsBloc(useCase: getIt.get<GetProductsUseCase>())
            ..add(
              const GetProductsLoadingEvent(),
            ),
        ),
      ],
      child: BlocBuilder<GetProductsBloc, GetProductsState>(
        builder: (context, state) {
          if (state is GetProductsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetProductsSuccess) {
            if (state.products.isEmpty) {
              return const EmptyProductsList();
            } else {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Meca inventario'),
                ),
                body: _screens[_selectedIndex],
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
