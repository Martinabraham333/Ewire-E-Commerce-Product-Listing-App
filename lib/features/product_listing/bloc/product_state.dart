part of 'product_bloc.dart';

enum ProductAction { none, fetchProducts,fetchProductsById }

enum ResponseStatus { initial, loading, success, failure }

@freezed
sealed class ProductState with _$ProductState {
  const factory ProductState({

    @Default(ResponseStatus.initial) ResponseStatus responseStatus,
    @Default(ProductAction.none) ProductAction productAction,
    String? msg,
    @Default([]) List<ProductModel> products,
    ProductModel? productDetails,
  }) = _ProductState;


}
