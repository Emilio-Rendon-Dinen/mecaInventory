import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meca_inventory/src/presentation/screens/home/blocs/delete_product/delete_product_event.dart';
import 'package:meca_inventory/src/presentation/screens/home/blocs/delete_product/delete_product_state.dart';

class DeleteProductBloc
    extends Bloc<StartDeleteProductEvent, DeleteProductState> {
  DeleteProductBloc() : super(DeleteProductInitial()) {
    on<StartDeleteProductEvent>(_onDeleteProductLoading);
  }

  Future<void> _onDeleteProductLoading(
      StartDeleteProductEvent event, Emitter<DeleteProductState> emit) async {
    emit(const DeleteProductLoading());
    try {
      await event.useCase.deleteProduct(productId: event.productId);
      emit(const DeleteProductSuccess());
    } catch (e) {
      emit(DeleteProductError(error: e));
    }
  }
}
