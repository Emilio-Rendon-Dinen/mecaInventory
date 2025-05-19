part of 'add_products_bloc.dart';

@immutable
sealed class AddProductsState {
  const AddProductsState();
}

final class AddProductsInitial extends AddProductsState {}

final class AddProductsLoading extends AddProductsState {
  const AddProductsLoading();
}

final class AddProductsSuccess extends AddProductsState {
  const AddProductsSuccess();
}

final class AddProductsError extends AddProductsState {
  final dynamic error;
  const AddProductsError({
    this.error,
  });
}
