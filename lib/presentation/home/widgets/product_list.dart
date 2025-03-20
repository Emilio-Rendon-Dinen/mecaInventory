import 'package:flutter/material.dart';
import 'package:meca_inventory/presentation/home/widgets/product_card.dart';
import 'package:meca_inventory/presentation/ui_models/product_ui_model.dart';

class ProductList extends StatelessWidget {
  final List<ProductUIModel> products;
  const ProductList({required this.products, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(
          product: product,
        );
      },
    );
  }
}
