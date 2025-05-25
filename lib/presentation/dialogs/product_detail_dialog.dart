import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meca_inventory/presentation/screens/restock_product/restock_product_screen.dart';
import 'package:meca_inventory/presentation/ui_models/product_ui_model.dart';

//Se utiliza una clase en lugar de una funcion debido a que incluye temas relacionados con estado, lógica o navegación.
class ProductDetailDialog extends StatefulWidget {
  final ProductUIModel product;
  final Function(ProductUIModel) onUpdate;
  const ProductDetailDialog({required this.product, required this.onUpdate, super.key});

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
                const Text("Stock actual: "),
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
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Ingresa la cantidad utilizada',
                  hintStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  labelText: 'Ingresa la cantidad utilizada',
                  labelStyle: TextStyle(
                    fontSize: 12,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese una cantidad';
                  }
                  final quantity = num.tryParse(value);
                  if (quantity == 0) {
                    return 'Por favor ingrese una cantidad válida';
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
          child: const Text("Reabastecer"),
        ),
        FilledButton(
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              final usedQuantity = int.tryParse(stockUsedController.text)!;
              final updatedCurrentQuantity = product.initialQuantity - usedQuantity;

              final updatedProduct = ProductUIModel(
                id: product.id,
                name: product.name,
                description: product.description,
                cost: product.cost,
                initialQuantity: product.initialQuantity,
                currentQuantity: updatedCurrentQuantity,
                categoryId: product.categoryId,
                image: product.image,
                hasImage: product.hasImage,
              );

              widget.onUpdate(updatedProduct);
              Navigator.pop(context);
            }
          },
          child: const Text("Reducir stock"),
        )
      ],
    );
  }
}
