part of 'add_products_bloc.dart';

sealed class AddProductEvent {
  const AddProductEvent();
}

class AddProductLoadingEvent extends AddProductEvent {
  final ProductUIModel productUIModel;
  final AddProductUseCase useCase;

  AddProductLoadingEvent({
    required this.productUIModel,
    required this.useCase,
  });
}
