import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/core/constants/app_colors.dart';
import 'package:product_listing_app/features/add_to_cart/bloc/cart_bloc.dart';
import 'package:product_listing_app/features/add_to_cart/models/cart_model.dart';

String _formatPrice(num value) {
  return value % 1 == 0 ? value.toStringAsFixed(0) : value.toStringAsFixed(2);
}

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.canvas,
      appBar: const _CartAppBar(),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.cartItems.isEmpty) {
            return const _EmptyCartState();
          }

          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                  itemCount: state.cartItems.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final item = state.cartItems[index];

                    return Dismissible(
                      key: ValueKey(item.id),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        margin: const EdgeInsets.only(bottom: 0),
                        decoration: BoxDecoration(
                          color: AppColors.sale,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: const Icon(
                          Icons.delete_outline_rounded,
                          color: Colors.white,
                        ),
                      ),
                      onDismissed: (_) {
                        context.read<CartBloc>().add(
                          CartEvent.removeFromCart(item.id),
                        );
                      },
                      child: _CartItemTile(item: item),
                    );
                  },
                ),
              ),
              _CartSummaryBar(total: state.totalAmount),
            ],
          );
        },
      ),
    );
  }
}


class _CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CartAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.canvas,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      titleSpacing: 4,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 18,
          color: AppColors.ink,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      title: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          final count = state.cartItems.fold<int>(
            0,
            (sum, item) => sum + item.quantity,
          );

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'YOUR CART',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                count == 0 ? 'Cart' : '$count item${count == 1 ? '' : 's'}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: AppColors.ink,
                ),
              ),
            ],
          );
        },
      ),
      actions: [
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state.cartItems.isEmpty) return const SizedBox.shrink();

            return TextButton(
              onPressed: () => _confirmClearCart(context),
              child: const Text(
                'Clear',
                style: TextStyle(
                  color: AppColors.sale,
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
            );
          },
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  void _confirmClearCart(BuildContext context) {
    final cartBloc = context.read<CartBloc>();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Clear your cart?'),
        content: const Text('This will remove all items from your cart.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              cartBloc.add(const CartEvent.clearCart());
              Navigator.pop(dialogContext);
            },
            child: const Text(
              'Clear',
              style: TextStyle(
                color: AppColors.sale,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CartItemTile extends StatelessWidget {
  final CartModel item;

  const _CartItemTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: AppColors.ink.withOpacity(0.05),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.network(
              item.thumbnail,
              width: 78,
              height: 78,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 78,
                height: 78,
                color: AppColors.canvas,
                alignment: Alignment.center,
                child: const Icon(
                  Icons.image_not_supported_outlined,
                  color: AppColors.inkMuted,
                  size: 20,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w600,
                    color: AppColors.ink,
                    height: 1.25,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '\u20b9${_formatPrice(item.price)}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _QuantityStepper(
                      quantity: item.quantity,
                      onIncrement: () => context.read<CartBloc>().add(
                        CartEvent.incrementQuantity(item.id),
                      ),
                      onDecrement: () => context.read<CartBloc>().add(
                        CartEvent.decrementQuantity(item.id),
                      ),
                    ),
                    IconButton(
                      onPressed: () => context.read<CartBloc>().add(
                        CartEvent.removeFromCart(item.id),
                      ),
                      icon: const Icon(
                        Icons.delete_outline_rounded,
                        color: AppColors.inkMuted,
                        size: 20,
                      ),
                      visualDensity: VisualDensity.compact,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QuantityStepper extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const _QuantityStepper({
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _stepIcon(Icons.remove_rounded, onDecrement),
          SizedBox(
            width: 26,
            child: Text(
              '$quantity',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 13,
                color: AppColors.ink,
              ),
            ),
          ),
          _stepIcon(Icons.add_rounded, onIncrement),
        ],
      ),
    );
  }

  Widget _stepIcon(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 30,
        height: 30,
        child: Icon(icon, size: 15, color: AppColors.primary),
      ),
    );
  }
}

class _EmptyCartState extends StatelessWidget {
  const _EmptyCartState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 84,
              height: 84,
              decoration: BoxDecoration(
                color: AppColors.surface,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.ink.withOpacity(0.05),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: const Icon(
                Icons.shopping_bag_outlined,
                size: 36,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Your cart is empty',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: AppColors.ink,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Items you add will show up here, ready for checkout.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13.5, color: AppColors.inkMuted),
            ),
            const SizedBox(height: 22),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 13,
                ),
              ),
              child: const Text(
                'Start shopping',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CartSummaryBar extends StatelessWidget {
  final double total;

  const _CartSummaryBar({required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: AppColors.ink.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, -6),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.inkMuted,
                  ),
                ),
                Text(
                  '\u20b9${total.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: AppColors.ink,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      const SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: AppColors.ink,
                        content: Text('Checkout flow coming soon'),
                      ),
                    );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  'Checkout',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
