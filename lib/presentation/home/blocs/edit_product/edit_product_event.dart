import 'package:meca_inventory/domain/use_cases/edit_product_use_case.dart';
import 'package:meca_inventory/presentation/ui_models/product_ui_model.dart';

sealed class EditProductEvent {
  const EditProductEvent();
}

final class EditProductRequestedEvent extends EditProductEvent {
  final ProductUIModel productUIModel;
  final EditProductUseCase useCase;

  const EditProductRequestedEvent({
    required this.useCase,
    required this.productUIModel,
  });
}
