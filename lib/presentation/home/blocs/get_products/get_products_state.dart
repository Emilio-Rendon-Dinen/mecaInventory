part of 'get_products_bloc.dart';

@immutable
sealed class GetProductsState {
  const GetProductsState();
}

final class GetProductsInitial extends GetProductsState {}

final class GetProductsLoading extends GetProductsState {
  const GetProductsLoading();
}

final class GetProductsSuccess extends GetProductsState {
  final List<ProductUIModel> products;
  const GetProductsSuccess({
    required this.products,
  });
}

final class GetProductsError extends GetProductsState {
  final dynamic error;
  const GetProductsError({
    this.error,
  });
}
