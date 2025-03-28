import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meca_inventory/domain/entities/product.dart';
import 'package:meca_inventory/domain/use_cases/get_products_use_case.dart';
import 'package:meca_inventory/presentation/ui_models/product_ui_model.dart';

part 'get_products_event.dart';
part 'get_products_state.dart';

class GetProductsBloc extends Bloc<GetProductsEvent, GetProductsState> {
  GetProductsBloc() : super(GetProductsInitial()) {
    on<GetProductsDataEvent>(_onGetProductsLoading);
  }

  Future<void> _onGetProductsLoading(GetProductsDataEvent event, Emitter<GetProductsState> emit) async {
    List<ProductUIModel> products = [];
    emit(const GetProductsLoading());
    try {
      List<Product> productsFromDomain = await event.useCase.getProducts();
      for (var item in productsFromDomain) {
        products.add(ProductUIModel.fromDomain(item));
      }
      emit(GetProductsSuccess(products: products));
    } catch (e) {
      emit(GetProductsError(error: e));
    }
  }
}
