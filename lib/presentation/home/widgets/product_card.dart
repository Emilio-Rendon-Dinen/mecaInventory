import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:meca_inventory/config/dependency_injection/get_it.dart';
import 'package:meca_inventory/domain/use_cases/delete_product_use_case.dart';
import 'package:meca_inventory/presentation/enums/stock_status.dart';
import 'package:meca_inventory/presentation/home/blocs/delete_product/delete_product_bloc.dart';
import 'package:meca_inventory/presentation/home/blocs/delete_product/delete_product_event.dart';
import 'package:meca_inventory/presentation/ui_models/product_ui_model.dart';

class ProductCard extends StatelessWidget {
  final ProductUIModel product;
  final Function(ProductUIModel product) onTap;
  const ProductCard({
    required this.product,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key('${product.id}'),
      endActionPane: ActionPane(
        // Aqui se define como se quiere ver la animacion del scroll
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) {
              context.read<DeleteProductBloc>().add(StartDeleteProductEvent(productId: product.id!, useCase: getIt.get<DeleteProductUseCase>()));
            },
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Card(
        elevation: 20,
        child: InkWell(
          onTap: () => onTap(product),
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
                          'Categoria: ${product.categoryName}',
                        ),
                        Text(
                          'Costo: ${product.cost}',
                        ),
                        Text(
                          'cantidad: ${product.currentQuantity}/${product.initialQuantity}',
                        ),
                        Text(
                          product.quantityStatus.stringValue,
                          style: TextStyle(color: product.quantityStatus.colorValue),
                        ),
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
      ),
    );
  }
}
