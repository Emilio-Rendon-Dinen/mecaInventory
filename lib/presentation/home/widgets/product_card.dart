import 'package:flutter/material.dart';
import 'package:meca_inventory/domain/entities/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 50,
              height: 50,
              color: Colors.grey,
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                ),
                Text(
                  'Costo: ${product.cost}',
                ),
                Text(
                  'cantidad: ${product.currentQuantity}/${product.initialQuantity}',
                  //style: Theme.of(context).textTheme.bodyMedium,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
