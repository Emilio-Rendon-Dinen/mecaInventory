import 'package:meca_inventory/domain/use_cases/edit_product_use_case.dart';

sealed class EditProductEvent {
  const EditProductEvent();
}

final class EditProductRequestedEvent extends EditProductEvent {
  final int productId;
  final EditProductUseCase useCase;

  const EditProductRequestedEvent({
    required this.useCase,
    required this.productId,
  });
}
