
import 'package:hive/hive.dart';
import 'package:product_listing_app/features/add_to_cart/models/cart_model.dart';
import 'package:product_listing_app/features/product_listing/models/product_model.dart';

class AddToCartRepository {
 
final Box cartBox = Hive.box('cartBox');
Future<void> addToCart(
    ProductModel product,
  ) async {
    final cartItems = getCartItems();

    final index = cartItems.indexWhere(
      (e) => e.id == product.id,
    );

    if (index != -1) {
      cartItems[index].quantity++;
    } else {
      cartItems.add(
        CartModel(
          id: product.id,
          title: product.title,
          thumbnail: product.thumbnail,
          price: product.price,
        ),
      );
    }

    await _saveCart(cartItems);
  }

  List<CartModel> getCartItems() {
    final data = cartBox.get(
      'cart',
      defaultValue: [],
    );

    return (data as List)
        .map(
          (e) => CartModel.fromJson(
            Map<String, dynamic>.from(e),
          ),
        )
        .toList();
  }

  Future<void> removeFromCart(
    int productId,
  ) async {
    final cartItems = getCartItems();

    cartItems.removeWhere(
      (e) => e.id == productId,
    );

    await _saveCart(cartItems);
  }

  Future<void> clearCart() async {
    await cartBox.delete('cart');
  }

  Future<void> _saveCart(
    List<CartModel> cartItems,
  ) async {
    await cartBox.put(
      'cart',
      cartItems
          .map((e) => e.toJson())
          .toList(),
    );
  }
double calculateTotal() {
  final cartItems = getCartItems();

  return cartItems.fold<double>(
    0.0,
    (sum, item) =>
        sum + (item.price * item.quantity),
  );
}

Future<void> incrementQuantity(
  int productId,
) async {
  final cartItems = getCartItems();

  final index = cartItems.indexWhere(
    (e) => e.id == productId,
  );

  if (index != -1) {
    cartItems[index].quantity++;
    await _saveCart(cartItems);
  }
}

Future<void> decrementQuantity(
  int productId,
) async {
  final cartItems = getCartItems();

  final index = cartItems.indexWhere(
    (e) => e.id == productId,
  );

  if (index != -1) {
    if (cartItems[index].quantity > 1) {
      cartItems[index].quantity--;
    } else {
      cartItems.removeAt(index);
    }

    await _saveCart(cartItems);
  }
}

int getCartCount() {
  final cartItems = getCartItems();

  return cartItems.fold(
    0,
    (sum, item) => sum + item.quantity,
  );
}
}