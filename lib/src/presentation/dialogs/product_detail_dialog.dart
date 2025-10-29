import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meca_inventory/src/config/utils/build_context_localizations.dart';
import 'package:meca_inventory/src/presentation/screens/restock_product/restock_product_screen.dart';
import 'package:meca_inventory/src/presentation/ui_models/product_ui_model.dart';

//Se utiliza una clase en lugar de una funcion debido a que incluye temas relacionados con estado, lógica o navegación.
class ProductDetailDialog extends StatefulWidget {
  final ProductUIModel product;
  final Function(ProductUIModel) onUpdate;
  const ProductDetailDialog(
      {required this.product, required this.onUpdate, super.key});

  @override
  State<ProductDetailDialog> createState() => _ProductDetailDialogState();
}

class _ProductDetailDialogState extends State<ProductDetailDialog> {
  final TextEditingController stockUsedController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    stockUsedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return AlertDialog(
      title: Text(product.name),
      content: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Hero(
              tag: 'product-image-${product.id}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: product.hasImage
                      ? Image.memory(product.image!, fit: BoxFit.cover)
                      : Container(
                          color: Colors.grey[300],
                          child: const Icon(Icons.image, color: Colors.white),
                        ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(context.strings.currentStock),
                Text('${product.currentQuantity}'),
              ],
            ),
            const SizedBox(height: 10),
            Form(
              key: _formKey,
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: stockUsedController,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: context.strings.usedQuantity,
                  hintStyle: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  labelText: context.strings.usedQuantity,
                  labelStyle: const TextStyle(
                    fontSize: 12,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.strings.addQuantity;
                  }
                  final quantity = num.tryParse(value);
                  if (quantity == 0) {
                    return context.strings.addQuantityValidation;
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.product.description,
              style: const TextStyle(fontSize: 16),
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => RestockProductScreen(product: product),
              ),
            );
          },
          child: Text(context.strings.restock),
        ),
        FilledButton(
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              final usedQuantity = int.tryParse(stockUsedController.text)!;
              final updatedCurrentQuantity =
                  product.initialQuantity - usedQuantity;

              final updatedProduct = ProductUIModel(
                id: product.id,
                name: product.name,
                description: product.description,
                cost: product.cost,
                initialQuantity: product.initialQuantity,
                currentQuantity: updatedCurrentQuantity,
                image: product.image,
                hasImage: product.hasImage,
              );

              widget.onUpdate(updatedProduct);
              Navigator.pop(context);
            }
          },
          child: Text(context.strings.reduceStock),
        )
      ],
    );
  }
}
