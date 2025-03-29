import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meca_inventory/presentation/home/blocs/edit_product/edit_product_event.dart';
import 'package:meca_inventory/presentation/home/blocs/edit_product/edit_product_state.dart';
import 'package:meca_inventory/presentation/ui_models/product_ui_model.dart';

class EditProductBloc extends Bloc<EditProductRequestedEvent, EditProductState> {
  EditProductBloc() : super(EditProductInitial()) {
    on<EditProductRequestedEvent>(_onEditProductLoading);
  }

  Future<void> _onEditProductLoading(EditProductRequestedEvent event, Emitter<EditProductState> emit) async {
    ProductUIModel? product;
    emit(const EditProductLoading());
    try {
      emit(EditProductSuccess(product: product!));
    } catch (e) {
      emit(EditProductError(error: e));
    }
  }
}
