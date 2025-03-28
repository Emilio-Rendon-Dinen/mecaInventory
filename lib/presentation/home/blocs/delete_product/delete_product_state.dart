sealed class DeleteProductState {
  const DeleteProductState();
}

final class DeleteProductInitial extends DeleteProductState {}

final class DeleteProductLoading extends DeleteProductState {
  const DeleteProductLoading();
}

final class DeleteProductSuccess extends DeleteProductState {
  const DeleteProductSuccess();
}

final class DeleteProductError extends DeleteProductState {
  final dynamic error;
  const DeleteProductError({
    this.error,
  });
}
