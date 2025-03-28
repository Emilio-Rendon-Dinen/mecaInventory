import 'package:meca_inventory/domain/use_cases/delete_product_use_case.dart';

sealed class DeleteProductEvent {
  const DeleteProductEvent();
}

final class StartDeleteProductEvent extends DeleteProductEvent {
  final DeleteProductUseCase useCase;
  final String productId;

  const StartDeleteProductEvent(this.useCase, this.productId);
}
