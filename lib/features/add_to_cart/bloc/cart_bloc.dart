import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:product_listing_app/features/add_to_cart/models/cart_model.dart';
import 'package:product_listing_app/features/add_to_cart/repositories/add_to_cart_repository.dart';
import 'package:product_listing_app/features/product_listing/bloc/product_bloc.dart';
import 'package:product_listing_app/features/product_listing/models/product_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final AddToCartRepository repository;

  CartBloc({
    required this.repository,
  }) : super(_CartState()) {
    on<FetchCart>(_fetchCart);
    on<AddToCart>(_addToCart);
    on<RemoveFromCart>(_removeFromCart);
    on<IncrementQuantity>(_incrementQuantity);
    on<DecrementQuantity>(_decrementQuantity);
    on<ClearCart>(_clearCart);
  }

  Future<void> _fetchCart(
    FetchCart event,
    Emitter<CartState> emit,
  ) async {
    final cartItems =
        repository.getCartItems();

    emit(
      state.copyWith(
        responseStatus:
            ResponseStatus.success,
        cartAction: CartAction.loadCart,
        cartItems: cartItems,
        totalAmount:
            repository.calculateTotal(),
      ),
    );
  }

  Future<void> _addToCart(
    AddToCart event,
    Emitter<CartState> emit,
  ) async {
    await repository.addToCart(
      event.product,
    );

    final cartItems =
        repository.getCartItems();

    emit(
      state.copyWith(
        responseStatus:
            ResponseStatus.success,
        cartAction: CartAction.addToCart,
        cartItems: cartItems,
        totalAmount:
            repository.calculateTotal(),
      ),
    );
  }

  Future<void> _removeFromCart(
    RemoveFromCart event,
    Emitter<CartState> emit,
  ) async {
    await repository.removeFromCart(
      event.productId,
    );

    final cartItems =
        repository.getCartItems();

    emit(
      state.copyWith(
        responseStatus:
            ResponseStatus.success,
        cartAction:
            CartAction.removeFromCart,
        cartItems: cartItems,
        totalAmount:
            repository.calculateTotal(),
      ),
    );
  }

  Future<void> _incrementQuantity(
    IncrementQuantity event,
    Emitter<CartState> emit,
  ) async {
    await repository.incrementQuantity(
      event.productId,
    );

    add(
      const CartEvent.fetchCart(),
    );
  }

  Future<void> _decrementQuantity(
    DecrementQuantity event,
    Emitter<CartState> emit,
  ) async {
    await repository.decrementQuantity(
      event.productId,
    );

    add(
      const CartEvent.fetchCart(),
    );
  }

  Future<void> _clearCart(
    ClearCart event,
    Emitter<CartState> emit,
  ) async {
    await repository.clearCart();

    emit(
      state.copyWith(
        cartItems: [],
        totalAmount: 0,
        cartAction:
            CartAction.clearCart,
        responseStatus:
            ResponseStatus.success,
      ),
    );
  }
}