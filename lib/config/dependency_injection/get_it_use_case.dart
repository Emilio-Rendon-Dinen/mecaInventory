part of 'get_it.dart';

void _setupUseCase() {
  _getIt.registerFactory<GetProductsUseCase>(() => GetProductsUseCase(
        _getIt.get<GetProductsRepository>(),
      ));
  _getIt.registerFactory<AddProductUseCase>(() => AddProductUseCase(
        _getIt.get<AddProductsRepository>(),
      ));
  _getIt.registerFactory<EditProductUseCase>(() => EditProductUseCase(
        _getIt.get<EditProductRepository>(),
      ));
  _getIt.registerFactory<DeleteProductUseCase>(() => DeleteProductUseCase(
        _getIt.get<DeleteProductsRepository>(),
      ));
}
