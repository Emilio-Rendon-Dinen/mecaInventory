import 'package:meca_inventory/presentation/ui_models/product_ui_model.dart';

sealed class EditProductState {
  const EditProductState();
}

final class EditProductInitial extends EditProductState {}

final class EditProductLoading extends EditProductState {
  const EditProductLoading();
}

final class EditProductSuccess extends EditProductState {
  final ProductUIModel product;
  const EditProductSuccess({
    required this.product,
  });
}

final class EditProductError extends EditProductState {
  final dynamic error;
  const EditProductError({
    this.error,
  });
}
