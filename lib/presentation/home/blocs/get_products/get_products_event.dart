part of 'get_products_bloc.dart';

sealed class GetProductsEvent {
  const GetProductsEvent();
}

final class GetProductsLoadedEvent extends GetProductsEvent {
  const GetProductsLoadedEvent();
}

final class GetProductsLoadingEvent extends GetProductsEvent {
  final GetProductsUseCase useCase;
  const GetProductsLoadingEvent({
    required this.useCase,
  });
}
