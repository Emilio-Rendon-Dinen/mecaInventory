import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meca_inventory/presentation/shared/blocs/edit_product/edit_product_event.dart';
import 'package:meca_inventory/presentation/shared/blocs/edit_product/edit_product_state.dart';
import 'package:meca_inventory/presentation/ui_models/product_ui_model.dart';

class EditProductBloc extends Bloc<EditProductRequestedEvent, EditProductState> {
  EditProductBloc() : super(EditProductInitial()) {
    on<EditProductRequestedEvent>(_onEditProductLoading);
  }

  Future<void> _onEditProductLoading(EditProductRequestedEvent event, Emitter<EditProductState> emit) async {
    emit(const EditProductLoading());
    try {
      final ProductUIModel productUIModel = ProductUIModel.fromDomain(await event.useCase.editProduct(
        product: event.productUIModel.toDomain(),
      ));
      emit(EditProductSuccess(product: productUIModel));
    } catch (e) {
      emit(EditProductError(error: e));
    }
  }
}
