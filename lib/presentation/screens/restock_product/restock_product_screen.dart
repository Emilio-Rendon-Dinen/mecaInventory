import 'package:flutter/material.dart';
import 'package:meca_inventory/presentation/screens/add_product/widgets/image_picker_button.dart';
import 'package:meca_inventory/presentation/ui_models/product_ui_model.dart';

class RestockProductScreen extends StatelessWidget {
  final ProductUIModel product;
  const RestockProductScreen({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meca inventario'),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Hero(
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
                      : ImagePickerButton(onImagePicked: (bytes) {})),
            )),
      ),
    );
  }
}
