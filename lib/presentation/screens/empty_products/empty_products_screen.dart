import 'package:flutter/material.dart';
import 'package:meca_inventory/config/navigation/navigation.dart';
import 'package:meca_inventory/presentation/screens/add_product/add_product_screen.dart';

class EmptyProductsScreen extends StatelessWidget {
  const EmptyProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meca inventario',
          style: TextStyle(
            fontSize: 24,
            color: Theme.of(context).colorScheme.onPrimary,
            letterSpacing: 2.0,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.precision_manufacturing_outlined,
                  size: 50,
                ),
                const Text('No hay productos'),
                const SizedBox(
                  height: 20,
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigation.push(
                      context: context,
                      screen: const AddProductScreen(),
                    );
                  },
                  child: const Text('Agregar producto'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
