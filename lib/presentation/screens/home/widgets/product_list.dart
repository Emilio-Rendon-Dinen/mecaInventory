import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meca_inventory/config/dependency_injection/get_it.dart';
import 'package:meca_inventory/domain/use_cases/edit_product_use_case.dart';
import 'package:meca_inventory/presentation/dialogs/product_detail_dialog.dart';
import 'package:meca_inventory/presentation/shared/blocs/edit_product/edit_product_bloc.dart';
import 'package:meca_inventory/presentation/shared/blocs/edit_product/edit_product_event.dart';
import 'package:meca_inventory/presentation/screens/home/widgets/product_card.dart';
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
        return Padding(
          padding: const EdgeInsets.all(2),
          child: ProductCard(
            product: product,
            onTap: (product) {
              showDialog(
                context: context,
                builder: (_) => ProductDetailDialog(
                  product: product,
                  onUpdate: (newCurrentStock) {
                    context.read<EditProductBloc>().add(
                          EditProductRequestedEvent(
                            productUIModel: newCurrentStock,
                            useCase: getIt.get<EditProductUseCase>(),
                          ),
                        );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
