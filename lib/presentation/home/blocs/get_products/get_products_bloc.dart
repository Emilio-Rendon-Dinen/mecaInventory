import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meca_inventory/domain/entities/product.dart';
import 'package:meca_inventory/domain/use_cases/get_products_use_case.dart';

part 'get_products_event.dart';
part 'get_products_state.dart';

class GetProductsBloc extends Bloc<GetProductsEvent, GetProductsState> {
  final GetProductsUseCase _useCase;
  GetProductsBloc({
    required GetProductsUseCase useCases,
  })  : _useCase = useCases,
        super(GetProductsInitial()) {
    on<GetProductsLoadingEvent>(_onGetProductsLoading);
  }

  Future<void> _onGetProductsLoading(GetProductsLoadingEvent event, Emitter<GetProductsState> emit) async {
    List<Product> products = [];
    emit(const GetProductsLoading());
    try {
      products = await _useCase.getProducts();
      emit(GetProductsSuccess(products: products));
    } catch (e) {
      emit(GetProductsError(error: e));
    }
  }
}
