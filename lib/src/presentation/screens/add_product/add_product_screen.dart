import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meca_inventory/src/config/dependency_injection/get_it.dart';
import 'package:meca_inventory/src/config/navigation/navigation.dart';
import 'package:meca_inventory/src/config/utils/build_context_localizations.dart';
import 'package:meca_inventory/src/domain/use_cases/add_product_use_case.dart';
import 'package:meca_inventory/src/presentation/screens/add_product/blocs/add_products_bloc.dart';
import 'package:meca_inventory/src/presentation/screens/add_product/widgets/image_picker_button.dart';
import 'package:meca_inventory/src/presentation/screens/home/home_screen.dart';
import 'package:meca_inventory/src/presentation/ui_models/product_ui_model.dart';

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
      // Se utiliza BlocListener ya que se utiliza una navegacion como efecto secundario y el blocbuilder solo genera ui
      child: BlocListener<AddProductsBloc, AddProductsState>(
        listener: (context, state) {
          if (state is AddProductsSuccess) {
            Navigation.pushAndRemoveUntil(
              context: context,
              screen: const HomeScreen(),
            );
          } else if (state is AddProductsError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(context.strings.addProductError),
              ),
            );
          }
        },
        child: BlocBuilder<AddProductsBloc, AddProductsState>(
          builder: (context, state) {
            if (state is AddProductsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Scaffold(
              appBar: widget.isContent == true
                  ? null
                  : AppBar(
                      title: Text(
                        context.strings.addFirstProduct,
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
                          Text(
                            context.strings.name,
                            style: const TextStyle(
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
                                return context.strings.addName;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          Text(
                            context.strings.description,
                            style: const TextStyle(
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
                                return context.strings.validDescription;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          Text(
                            context.strings.buyCost,
                            style: const TextStyle(
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
                                return context.strings.validValue;
                              }
                              final cost = num.tryParse(value);
                              if (cost == 0) {
                                return context.strings.validNumber;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          Text(
                            context.strings.initialQuantity,
                            style: const TextStyle(
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
                                return context.strings.validValue;
                              }
                              final quantity = num.tryParse(value);
                              if (quantity == 0) {
                                return context.strings.validNumber;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          Text(
                            context.strings.productImage,
                            style: const TextStyle(
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
                                id: null,
                                currentQuantity: null,
                              ),
                              useCase: getIt.get<AddProductUseCase>(),
                            ),
                          );
                    }
                  },
                  label: Text(context.strings.add),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
