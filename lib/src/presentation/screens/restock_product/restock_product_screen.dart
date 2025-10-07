import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meca_inventory/src/config/dependency_injection/get_it.dart';
import 'package:meca_inventory/src/config/navigation/navigation.dart';
import 'package:meca_inventory/src/config/utils/build_context_localizations.dart';
import 'package:meca_inventory/src/domain/use_cases/edit_product_use_case.dart';
import 'package:meca_inventory/src/presentation/screens/add_product/widgets/image_picker_button.dart';
import 'package:meca_inventory/src/presentation/screens/home/home_screen.dart';
import 'package:meca_inventory/src/presentation/shared/blocs/edit_product/edit_product_bloc.dart';
import 'package:meca_inventory/src/presentation/shared/blocs/edit_product/edit_product_event.dart';
import 'package:meca_inventory/src/presentation/shared/blocs/edit_product/edit_product_state.dart';
import 'package:meca_inventory/src/presentation/ui_models/product_ui_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestockProductScreen extends StatefulWidget {
  final ProductUIModel product;

  const RestockProductScreen({super.key, required this.product});

  @override
  State<RestockProductScreen> createState() => _RestockProductScreenState();
}

class _RestockProductScreenState extends State<RestockProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _initialQuantityController =
      TextEditingController();

  @override
  void dispose() {
    _initialQuantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    return BlocProvider(
      create: (context) => EditProductBloc(),
      child: BlocListener<EditProductBloc, EditProductState>(
        listener: (context, state) {
          if (state is EditProductSuccess) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (context.mounted) {
                Navigation.pushAndRemoveUntil(
                  context: context,
                  screen: const HomeScreen(),
                );
              } else if (state is EditProductError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(context.strings.editProductError),
                  ),
                );
              }
            });
          }
        },
        child: BlocBuilder<EditProductBloc, EditProductState>(
          builder: (context, state) {
            if (state is EditProductLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    product.name,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.primary,
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
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.8,
                                    )
                                  : ImagePickerButton(
                                      onImagePicked: (bytes) {}),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(product.description),
                          const SizedBox(height: 12),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Text(
                                  context.strings.currentQuantity(
                                      product.currentQuantity ?? 0),
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(height: 12),
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: _initialQuantityController,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  decoration: InputDecoration(
                                    labelText: context.strings.enterInventory,
                                    border: const OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return context.strings.validValue;
                                    }
                                    final quantity = num.tryParse(value);
                                    if (quantity == null || quantity <= 0) {
                                      return context.strings.validNumber;
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    const Spacer(),
                                    FilledButton(
                                      onPressed: () {
                                        final int newQuantity = int.parse(
                                                _initialQuantityController
                                                    .text) +
                                            (product.currentQuantity ?? 0);
                                        if (_formKey.currentState!.validate()) {
                                          final tempProduct = ProductUIModel(
                                            id: product.id,
                                            name: product.name,
                                            description: product.description,
                                            cost: product.cost,
                                            initialQuantity: (newQuantity >
                                                    product.initialQuantity)
                                                ? newQuantity
                                                : product.initialQuantity,
                                            currentQuantity: newQuantity,
                                            categoryId: product.categoryId,
                                            image: product.image,
                                            hasImage: product.hasImage,
                                          );

                                          context.read<EditProductBloc>().add(
                                                EditProductRequestedEvent(
                                                  productUIModel: tempProduct,
                                                  useCase: getIt.get<
                                                      EditProductUseCase>(),
                                                ),
                                              );
                                        }
                                      },
                                      child: Text(context.strings.save),
                                    ),
                                  ],
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
          },
        ),
      ),
    );
  }
}
