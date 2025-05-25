import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meca_inventory/presentation/screens/add_product/widgets/image_picker_button.dart';
import 'package:meca_inventory/presentation/ui_models/product_ui_model.dart';

class RestockProductScreen extends StatefulWidget {
  final ProductUIModel product;

  const RestockProductScreen({super.key, required this.product});

  @override
  State<RestockProductScreen> createState() => _RestockProductScreenState();
}

class _RestockProductScreenState extends State<RestockProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _initialQuantityController = TextEditingController();

  @override
  void dispose() {
    _initialQuantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: 'product-image-${product.id}',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: product.hasImage
                        ? Image.memory(
                            product.image!,
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.width * 0.8,
                          )
                        : ImagePickerButton(onImagePicked: (bytes) {}),
                  ),
                ),
                const SizedBox(height: 12),
                Text(product.description),
                const SizedBox(height: 12),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text('Cantidad actual: ${product.currentQuantity}'),
                      const SizedBox(height: 12),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _initialQuantityController,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: const InputDecoration(
                          labelText: 'Nueva cantidad',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese un valor';
                          }
                          final quantity = num.tryParse(value);
                          if (quantity == null || quantity <= 0) {
                            return 'Por favor ingrese un número válido';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Acción al confirmar la cantidad
                            final nuevaCantidad = int.parse(_initialQuantityController.text);
                            print('Cantidad a agregar: $nuevaCantidad');
                          }
                        },
                        child: const Text('Guardar'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
