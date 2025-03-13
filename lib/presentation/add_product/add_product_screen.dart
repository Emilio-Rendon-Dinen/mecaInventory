import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meca_inventory/config/dependency_injection/get_it.dart';
import 'package:meca_inventory/config/navigation/navigation.dart';
import 'package:meca_inventory/domain/use_cases/add_product_use_case.dart';
import 'package:meca_inventory/presentation/add_product/addProducts/add_products_bloc.dart';
import 'package:meca_inventory/presentation/home/home_screen.dart';

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
  // Al usar un GlobalKey<FormState>,
  // puedes acceder al estado del formulario y llamar a métodos como
  //  validate(), save(), o reset().
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
              appBar: widget.isContent == true
                  ? null
                  : AppBar(
                      title: const Text(
                        'Agrega tu primer producto',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 2.0,
                        ),
                      ),
                      backgroundColor: Colors.black,
                      elevation: 4,
                    ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Form(
                          key: _formKey, // Asignar la GlobalKey al Form
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
                                  if (value == null || value.isEmpty || value == 0) {
                                    return 'Por favor ingrese un valor';
                                  }
                                  final quantity = num.tryParse(value);
                                  if (quantity == 0) {
                                    return 'Por favor ingrese un número válido';
                                  }
                                  return null;
                                },
                              ),
                              const Text(
                                "Foto del producto",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: FloatingActionButton.extended(
                            onPressed: () {
                              //Si el formulario es correcto
                              if (_formKey.currentState?.validate() ?? false) {
                                context.read<AddProductsBloc>().add(
                                      AddProductLoadingEvent(
                                        name: nameController.text,
                                        description: descriptionController.text,
                                        cost: costController.text,
                                        categoryId: 1,
                                        initialQuantity: initialQuantityController.text,
                                        useCase: getIt.get<AddProductUseCase>(),
                                      ),
                                    );
                              }
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
