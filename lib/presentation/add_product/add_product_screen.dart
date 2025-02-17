import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meca_inventory/config/dependency_injection/get_it.dart';
import 'package:meca_inventory/config/navigation/navigation.dart';
import 'package:meca_inventory/domain/use_cases/add_product_use_case.dart';
import 'package:meca_inventory/presentation/add_product/addProducts/add_products_bloc.dart';
import 'package:meca_inventory/presentation/home/home_screen.dart';

class AddProductScreen extends StatelessWidget {
  final bool? isContent;
  const AddProductScreen({
    this.isContent,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController costController = TextEditingController();
    return BlocProvider(
      create: (context) => AddProductsBloc(),
      child: BlocBuilder<AddProductsBloc, AddProductsState>(
        builder: (context, state) {
          if (state is AddProductsLoading) {
            return Container();
          } else if (state is AddProductsSuccess) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (context.mounted) {
                Navigation.pushAndRemoveUntil(
                  context: context,
                  screen: const HomeScreen(),
                );
              }
            });
            return Container();
          } else if (state is AddProductsError) {
            return Container();
          } else {
            return Scaffold(
              appBar: isContent == true
                  ? null
                  : AppBar(
                      title: const Text('Agrega tu primer producto'),
                    ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Nombre"),
                            TextFormField(
                              controller: nameController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text("Descripción"),
                            TextFormField(
                              controller: descriptionController,
                              maxLines: 5,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text("Costo de compra"),
                            TextFormField(
                              controller: costController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: FloatingActionButton.extended(
                            onPressed: () {
                              final String name = nameController.text;
                              final String description = descriptionController.text;
                              final String cost = costController.text;
                              context.read<AddProductsBloc>().add(AddProductLoadingEvent(
                                    name: name,
                                    description: description,
                                    cost: cost,
                                    categoryId: 1,
                                    useCase: getIt.get<AddProductUseCase>(),
                                  ));
                            },
                            label: const Text("Agregar"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
