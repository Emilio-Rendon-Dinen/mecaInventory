part of 'get_it.dart';

void _setupUseCase() {
  _getIt.registerFactory<GetProductsUseCase>(() => GetProductsUseCase(
        _getIt.get<GetProductsRepository>(),
      ));
  _getIt.registerFactory<AddProductUseCase>(() => AddProductUseCase(
        _getIt.get<AddProductsRepository>(),
      ));
}
