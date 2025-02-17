import 'package:bloc/bloc.dart';
import 'package:meca_inventory/domain/use_cases/add_product_use_case.dart';
import 'package:meta/meta.dart';

part 'add_products_event.dart';
part 'add_products_state.dart';

class AddProductsBloc extends Bloc<AddProductEvent, AddProductsState> {
  AddProductsBloc() : super(AddProductsInitial()) {
    on<AddProductLoadingEvent>(_onAddProductEvent);
  }

  Future<void> _onAddProductEvent(AddProductLoadingEvent event, Emitter<AddProductsState> emit) async {
    emit(const AddProductsLoading());

    try {
      await event.useCase.addProduct(
        name: event.name,
        description: event.description,
        categoryId: event.categoryId,
        cost: event.cost,
      );
      emit(const AddProductsSuccess());
    } catch (e) {
      emit(AddProductsError(error: e));
    }
  }
}
