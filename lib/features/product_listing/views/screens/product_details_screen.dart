import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/core/constants/app_colors.dart';
import 'package:product_listing_app/features/add_to_cart/bloc/cart_bloc.dart';
import 'package:product_listing_app/features/add_to_cart/views/screens/add_to_cart_screen.dart';
import 'package:product_listing_app/features/product_listing/models/product_model.dart';


String _formatPrice(num value) {
  return value % 1 == 0 ? value.toStringAsFixed(0) : value.toStringAsFixed(2);
}

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel product;

  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool _isWishlisted = false;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final isOutOfStock = product.stock <= 0;
    final isLowStock = !isOutOfStock && product.stock <= 5;

    return Scaffold(
      backgroundColor: AppColors.canvas,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            stretch: true,
            backgroundColor: AppColors.surface,
            elevation: 0,
            expandedHeight: 360,
            leading: Padding(
              padding: const EdgeInsets.only(left: 16, top: 6),
              child: _CircleIconButton(
                icon: Icons.arrow_back_ios_new_rounded,
                onTap: () => Navigator.pop(context),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16, top: 6),
                child: _CircleIconButton(
                  icon: _isWishlisted
                      ? Icons.favorite_rounded
                      : Icons.favorite_border_rounded,
                  iconColor: _isWishlisted ? AppColors.sale : AppColors.ink,
                  onTap: () => setState(() => _isWishlisted = !_isWishlisted),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    product.thumbnail,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: AppColors.border,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.image_not_supported_outlined,
                        color: AppColors.inkMuted,
                        size: 32,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: const [0.7, 1.0],
                          colors: [
                            Colors.black.withOpacity(0.0),
                            Colors.black.withOpacity(0.25),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.canvas,
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
              ),
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w800,
                      color: AppColors.ink,
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'by ${product.brand}',
                    style: const TextStyle(
                      fontSize: 13.5,
                      color: AppColors.inkMuted,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _InfoChip(
                        icon: Icons.star_rounded,
                        iconColor: AppColors.accent,
                        label: product.rating.toStringAsFixed(1),
                      ),
                      _InfoChip(
                        icon: isOutOfStock
                            ? Icons.cancel_rounded
                            : Icons.inventory_2_outlined,
                        iconColor: isOutOfStock
                            ? AppColors.sale
                            : (isLowStock ? AppColors.accent : AppColors.primary),
                        label: isOutOfStock
                            ? 'Out of stock'
                            : (isLowStock
                                ? 'Only ${product.stock} left'
                                : 'In stock'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Text(
                    '\u20b9${_formatPrice(product.price)}',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(height: 1, color: AppColors.border),
                  const SizedBox(height: 24),
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: AppColors.ink,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    product.description,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.6,
                      color: AppColors.inkMuted,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _AddToCartBar(
        product: product,
        isOutOfStock: isOutOfStock,
      ),
    );
  }
}

/// ---------------------------------------------------------------------
/// Floating circular icon button used for back / wishlist, sits directly
/// on top of the hero image so it carries its own elevation and shadow.
/// ---------------------------------------------------------------------
class _CircleIconButton extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final VoidCallback onTap;

  const _CircleIconButton({
    required this.icon,
    required this.onTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      elevation: 2,
      shadowColor: Colors.black26,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(9),
          child: Icon(icon, size: 18, color: iconColor ?? AppColors.ink),
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;

  const _InfoChip({
    required this.icon,
    required this.iconColor,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 15, color: iconColor),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w700,
              color: AppColors.ink,
            ),
          ),
        ],
      ),
    );
  }
}


class _AddToCartBar extends StatelessWidget {
  final ProductModel product;
  final bool isOutOfStock;

  const _AddToCartBar({
    required this.product,
    required this.isOutOfStock,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: AppColors.ink.withOpacity(0.08),
            blurRadius: 18,
            offset: const Offset(0, -6),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, cartState) {
            var quantity = 0;
            for (final item in cartState.cartItems) {
              if (item.id == product.id) {
                quantity = item.quantity;
                break;
              }
            }

            if (isOutOfStock) {
              return SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.border,
                    disabledBackgroundColor: AppColors.border,
                    foregroundColor: AppColors.inkMuted,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'Out of stock',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                ),
              );
            }

            if (quantity == 0) {
              return SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: () {
                    context.read<CartBloc>().add(CartEvent.addToCart(product));

                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: AppColors.ink,
                          duration: const Duration(seconds: 1),
                          content: Text('${product.title} added to cart'),
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
                  icon: const Icon(Icons.add_shopping_cart_rounded, size: 18),
                  label: const Text(
                    'Add to Cart',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                ),
              );
            }

            return Row(
              children: [
                Container(
                  height: 52,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.border),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _stepIcon(
                        Icons.remove_rounded,
                        () => context
                            .read<CartBloc>()
                            .add(CartEvent.decrementQuantity(product.id)),
                      ),
                      SizedBox(
                        width: 32,
                        child: Text(
                          '$quantity',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: AppColors.ink,
                          ),
                        ),
                      ),
                      _stepIcon(
                        Icons.add_rounded,
                        () => context
                            .read<CartBloc>()
                            .add(CartEvent.incrementQuantity(product.id)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: SizedBox(
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {
                        context
                            .read<CartBloc>()
                            .add(const CartEvent.fetchCart());
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const CartScreen(),
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
                        'View Cart',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _stepIcon(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        width: 38,
        height: 50,
        child: Icon(icon, size: 17, color: AppColors.primary),
      ),
    );
  }
}