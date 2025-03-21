import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:meca_inventory/presentation/ui_models/product_ui_model.dart';

class ProductCard extends StatelessWidget {
  final ProductUIModel product;
  final Function(ProductUIModel product)? onDelete;
  final Function(ProductUIModel product)? onEdit;
  const ProductCard({
    required this.product,
    this.onDelete,
    this.onEdit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key('${product.id}'),
      endActionPane: const ActionPane(
        // Aqui se define como se quiere ver la animacion del scroll
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: null,
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: null,
            backgroundColor: Colors.grey,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Editar',
          ),
        ],
      ),
      /* onDismissed: (direction) {
        product;
      },*/
      child: Card(
        elevation: 20,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        'cantidad: ${product.currentQuantity}/${product.initialQuantity}',
                      ),
                      Text(
                        'Categoria: ${product.categoryName}',
                      ),
                      Text(
                        'Costo: ${product.cost}',
                      )
                    ],
                  )
                ],
              ),
              Text(
                product.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
