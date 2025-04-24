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
    on<UpdateProductInListEvent>(_onUpdateProductInList);
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

  Future<void> _onUpdateProductInList(UpdateProductInListEvent event, Emitter<GetProductsState> emit) async {
    if (state case GetProductsSuccess(:final products)) {
      final updatedList = products.map((product) {
        return product.id == event.updatedProduct.id ? event.updatedProduct : product;
      }).toList();

      emit(GetProductsSuccess(products: updatedList));
    }
  }
}

//if (state case ...): Indica que quieres aplicar pattern matching sobre state.
//GetProductsSuccess(...): El patrón que quieres identificar (una instancia de GetProductsSuccess).
//:final products: Extraes la propiedad products de ese objeto y la asignas a una variable local products.

// es lo mismo que
/*
if (state is GetProductsSuccess) {
  final products = (state as GetProductsSuccess).products;
}*/
