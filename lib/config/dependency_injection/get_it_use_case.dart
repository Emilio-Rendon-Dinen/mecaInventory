part of 'get_it.dart';

void _setupUseCase() {
  _getIt.registerFactory<GetProductsUseCase>(() => GetProductsUseCase(
        _getIt.get<GetProductsRepository>(),
      ));
}
