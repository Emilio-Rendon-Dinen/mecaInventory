import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meca_inventory/config/dependency_injection/get_it.dart';
import 'package:meca_inventory/config/navigation/navigation.dart';
import 'package:meca_inventory/domain/use_cases/add_product_use_case.dart';
import 'package:meca_inventory/presentation/screens/add_product/blocs/add_products_bloc.dart';
import 'package:meca_inventory/presentation/screens/add_product/widgets/image_picker_button.dart';
import 'package:meca_inventory/presentation/screens/home/home_screen.dart';
import 'package:meca_inventory/presentation/ui_models/product_ui_model.dart';

class AddProductScreen extends StatefulWidget {
  final bool? isContent;
  const AddProductScreen({
    this.isContent,
    super.key,
  });

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  late final TextEditingController nameController;
  late final TextEditingController descriptionController;
  late final TextEditingController costController;
  late final TextEditingController initialQuantityController;
  Uint8List? productImage;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    descriptionController = TextEditingController();
    costController = TextEditingController();
    initialQuantityController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    costController.dispose();
    initialQuantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductsBloc(),
      child: BlocBuilder<AddProductsBloc, AddProductsState>(
        builder: (context, state) {
          if (state is AddProductsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AddProductsSuccess) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (context.mounted) {
                Navigation.pushAndRemoveUntil(
                  context: context,
                  screen: const HomeScreen(),
                );
              }
            });
            return const Center(child: Text('Producto Agregado'));
          } else if (state is AddProductsError) {
            return const Center(child: Text('Error al agregar producto'));
          } else {
            return Scaffold(
              appBar: widget.isContent == true
                  ? null
                  : AppBar(
                      title: Text(
                        'Agrega tu primer producto',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Nombre",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextFormField(
                            controller: nameController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor ingrese un nombre';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            "Descripción",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextFormField(
                            controller: descriptionController,
                            maxLines: 5,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor ingrese una descripción';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            "Costo de compra",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextFormField(
                            controller: costController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor ingrese un valor';
                              }
                              final cost = num.tryParse(value);
                              if (cost == 0) {
                                return 'Por favor ingrese un número válido';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            "Cantidad inicial",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            controller: initialQuantityController,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor ingrese un valor';
                              }
                              final quantity = num.tryParse(value);
                              if (quantity == 0) {
                                return 'Por favor ingrese un número válido';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            "Foto del producto",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ImagePickerButton(
                            onImagePicked: (Uint8List bytes) {
                              // Guardar los bytes para usarlos al guardar el producto en la base de datos
                              productImage = bytes;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              floatingActionButton: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: FloatingActionButton.extended(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      context.read<AddProductsBloc>().add(
                            AddProductLoadingEvent(
                              productUIModel: ProductUIModel(
                                name: nameController.text,
                                description: descriptionController.text,
                                cost: costController.text,
                                initialQuantity: int.tryParse(
                                        initialQuantityController.text) ??
                                    0,
                                image: productImage,
                                categoryId: 1,
                                id: null,
                                currentQuantity: null,
                              ),
                              useCase: getIt.get<AddProductUseCase>(),
                            ),
                          );
                    }
                  },
                  label: const Text("Agregar"),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
