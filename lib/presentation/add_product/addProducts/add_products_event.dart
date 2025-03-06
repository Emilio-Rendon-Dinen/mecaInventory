part of 'add_products_bloc.dart';

sealed class AddProductEvent {
  const AddProductEvent();
}

class AddProductLoadingEvent extends AddProductEvent {
  final String name;
  String? description;
  final int categoryId;
  final String? cost;
  final String initialQuantity;
  final AddProductUseCase useCase;

  AddProductLoadingEvent({
    required this.name,
    required this.useCase,
    required this.categoryId,
    this.cost,
    required this.initialQuantity,
    this.description,
  });
}
