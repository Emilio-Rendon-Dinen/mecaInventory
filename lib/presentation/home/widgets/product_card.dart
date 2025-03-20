import 'package:flutter/material.dart';
import 'package:meca_inventory/presentation/ui_models/product_ui_model.dart';

class ProductCard extends StatelessWidget {
  final ProductUIModel product;
  const ProductCard({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: product.hasImage
                    ? Image.memory(
                        product.image!,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        color: Colors.grey[300],
                        width: 100,
                        height: 100,
                        child: const Center(
                          child: Icon(
                            Icons.image,
                            color: Colors.white,
                          ),
                        ),
                      ),
              ),
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
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
