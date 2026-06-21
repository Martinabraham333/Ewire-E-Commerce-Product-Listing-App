part of 'product_bloc.dart';

@freezed
class ProductEvent with _$ProductEvent {
  const factory ProductEvent.fetchProducts() = FetchProducts;
 const factory ProductEvent.fetchProductsById(
    int productId,
  ) = FetchProductsById;
}