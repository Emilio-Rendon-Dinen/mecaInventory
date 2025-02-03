import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_products_event.dart';
part 'add_products_state.dart';

class AddProductsBloc extends Bloc<AddProductsEvent, AddProductsState> {
  AddProductsBloc() : super(AddProductsInitial()) {
    on<AddProductsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
