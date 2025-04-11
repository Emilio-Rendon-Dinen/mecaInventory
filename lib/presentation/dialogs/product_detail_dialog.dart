import 'package:flutter/material.dart';
import 'package:meca_inventory/presentation/add_product/add_product_screen.dart';
import 'package:meca_inventory/presentation/ui_models/product_ui_model.dart';

//Se utiliza una clase en lugar de una funcion debido a que incluye temas relacionados con estado, lógica o navegación.
class ProductDetailDialog extends StatefulWidget {
  final ProductUIModel product;
  const ProductDetailDialog({required this.product, super.key});

  @override
  State<ProductDetailDialog> createState() => _ProductDetailDialogState();
}

class _ProductDetailDialogState extends State<ProductDetailDialog> {
  final TextEditingController stockUsedController = TextEditingController();

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
          mainAxisSize: MainAxisSize.min,
          children: [
            product.hasImage
                ? Image.memory(product.image!, fit: BoxFit.cover)
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
            const SizedBox(height: 10),
            Row(
              children: [
                const Text("Stock inicial: "),
                Text('${product.initialQuantity}'),
              ],
            ),
            const SizedBox(height: 10),
            TextField(
              controller: stockUsedController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Stock utilizado",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const AddProductScreen(),
              ),
            );
          },
          child: const Text("Editar"),
        ),
        TextButton(
          onPressed: () {
            final usedStock = int.tryParse(stockUsedController.text);
            if (usedStock != null) {
              //final updatedStock = product.initialQuantity - usedStock;
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Ingresa un número válido")),
              );
            }
          },
          child: const Text("Actualizar"),
        ),
      ],
    );
  }
}
