part of 'add_products_bloc.dart';

sealed class AddProductEvent {
  const AddProductEvent();
}

class AddProductLoadingEvent extends AddProductEvent {
  final String name;
  final String description;
  final int categoryId;

  AddProductLoadingEvent({
    required this.name,
    required this.description,
    required this.categoryId,
  });
}
