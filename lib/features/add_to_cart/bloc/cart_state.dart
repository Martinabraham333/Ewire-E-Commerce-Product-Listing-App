part of 'cart_bloc.dart';

enum CartAction {
  none,
  loadCart,
  addToCart,
  removeFromCart,
  increaseQuantity,
  decreaseQuantity,
  clearCart,
}



@freezed
sealed class CartState with _$CartState {
  const factory CartState({
    @Default(ResponseStatus.initial)
    ResponseStatus responseStatus,

    @Default(CartAction.none)
    CartAction cartAction,

    String? msg,

    @Default([])
    List<CartModel> cartItems,

    CartModel? selectedCartItem,

    @Default(0.0)
    double totalAmount,
  }) = _CartState;


}