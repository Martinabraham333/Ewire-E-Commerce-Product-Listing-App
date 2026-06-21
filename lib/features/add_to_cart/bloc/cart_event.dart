part of 'cart_bloc.dart';

@freezed
class CartEvent with _$CartEvent {

  /// Load cart from Hive
  const factory CartEvent.fetchCart() = FetchCart;

  /// Add product to cart
  const factory CartEvent.addToCart(
    ProductModel product,
  ) = AddToCart;

  /// Remove product from cart
  const factory CartEvent.removeFromCart(
    int productId,
  ) = RemoveFromCart;

  /// Increase quantity
  const factory CartEvent.incrementQuantity(
    int productId,
  ) = IncrementQuantity;

  /// Decrease quantity
  const factory CartEvent.decrementQuantity(
    int productId,
  ) = DecrementQuantity;

  /// Clear entire cart
  const factory CartEvent.clearCart() = ClearCart;
}