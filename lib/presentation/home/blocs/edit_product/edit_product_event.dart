sealed class EditProductEvent {
  const EditProductEvent();
}

final class EditProductRequestedEvent extends EditProductEvent {
  final String productId;
  //falta el use case
  const EditProductRequestedEvent(this.productId);
}
