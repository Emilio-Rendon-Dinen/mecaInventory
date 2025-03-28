part of 'get_products_bloc.dart';

sealed class GetProductsEvent {
  const GetProductsEvent();
}

final class GetProductsDataEvent extends GetProductsEvent {
  final GetProductsUseCase useCase;
  const GetProductsDataEvent({
    required this.useCase,
  });
}
