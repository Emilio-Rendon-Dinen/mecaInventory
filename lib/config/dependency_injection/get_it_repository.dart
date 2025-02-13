part of 'get_it.dart';

void _setupRepository() {
  _getIt.registerFactory<GetProductsRepository>(() => GetProductsImplementation());
  _getIt.registerFactory<AddProductsRepository>(() => AddProductImplementation());
}
