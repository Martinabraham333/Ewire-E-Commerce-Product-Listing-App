import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/core/constants/app_colors.dart';
import 'package:product_listing_app/features/add_to_cart/bloc/cart_bloc.dart';
import 'package:product_listing_app/features/add_to_cart/views/screens/add_to_cart_screen.dart';
import 'package:product_listing_app/features/product_listing/bloc/product_bloc.dart';
import 'package:product_listing_app/features/product_listing/models/product_model.dart';
import 'package:product_listing_app/features/product_listing/views/screens/product_details_screen.dart';
import 'package:product_listing_app/features/product_listing/views/widgets/product_shimmer.dart';




String _formatPrice(num value) {
  return value % 1 == 0 ? value.toStringAsFixed(0) : value.toStringAsFixed(2);
}

enum _SortOption { featured, priceLowHigh, priceHighLow, topRated }

String _sortLabel(_SortOption option) {
  switch (option) {
    case _SortOption.featured:
      return 'Featured';
    case _SortOption.priceLowHigh:
      return 'Price: Low to High';
    case _SortOption.priceHighLow:
      return 'Price: High to Low';
    case _SortOption.topRated:
      return 'Top Rated';
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';
  _SortOption _sort = _SortOption.featured;
  final Set<int> _wishlistIds = {};

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<ProductModel> _applyFilters(List<ProductModel> products) {
    final query = _query.trim().toLowerCase();

    final list = query.isEmpty
        ? List<ProductModel>.from(products)
        : products
            .where((p) => p.title.toLowerCase().contains(query))
            .toList();

    switch (_sort) {
      case _SortOption.priceLowHigh:
        list.sort((a, b) => a.price.compareTo(b.price));
        break;
      case _SortOption.priceHighLow:
        list.sort((a, b) => b.price.compareTo(a.price));
        break;
      case _SortOption.topRated:
        list.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case _SortOption.featured:
        break;
    }

    return list;
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.canvas,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      titleSpacing: 20,
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'DISCOVER',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: 2),
          Text(
            "Today's picks",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: AppColors.ink,
            ),
          ),
        ],
      ),
      actions: const [_CartButton()],
    );
  }

  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 14),
      child: TextField(
        controller: _searchController,
        onChanged: (value) => setState(() => _query = value),
        style: const TextStyle(fontSize: 14.5, color: AppColors.ink),
        decoration: InputDecoration(
          hintText: 'Search bags, shoes, gadgets...',
          hintStyle: const TextStyle(color: AppColors.inkMuted, fontSize: 14),
          prefixIcon: const Icon(Icons.search_rounded, color: AppColors.inkMuted),
          suffixIcon: _query.isEmpty
              ? null
              : IconButton(
                  icon: const Icon(Icons.close_rounded,
                      size: 18, color: AppColors.inkMuted),
                  onPressed: () {
                    _searchController.clear();
                    setState(() => _query = '');
                  },
                ),
          filled: true,
          fillColor: Colors.white,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.border),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.border),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.primary, width: 1.4),
          ),
        ),
      ),
    );
  }

  Widget _buildSortChips() {
    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: _SortOption.values.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final option = _SortOption.values[index];
          final selected = _sort == option;

          return ChoiceChip(
            label: Text(_sortLabel(option)),
            selected: selected,
            onSelected: (_) => setState(() => _sort = option),
            showCheckmark: false,
            labelStyle: TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w600,
              color: selected ? Colors.white : AppColors.ink,
            ),
            selectedColor: AppColors.primary,
            backgroundColor: Colors.white,
            side: BorderSide(
              color: selected ? AppColors.primary : AppColors.border,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.canvas,
      appBar: _buildAppBar(),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, productState) {
              if (productState.responseStatus == ResponseStatus.loading) {
                return const ProductShimmer();
              }

              if (productState.responseStatus == ResponseStatus.failure) {
                return _ErrorState(
                  message: productState.msg,
                  onRetry: () => context
                      .read<ProductBloc>()
                      .add(const ProductEvent.fetchProducts()),
                );
              }

              final filtered = _applyFilters(productState.products);

              return RefreshIndicator(
                color: AppColors.primary,
                onRefresh: () async {
                  context
                      .read<ProductBloc>()
                      .add(const ProductEvent.fetchProducts());
                },
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(child: _buildSearchField()),
                    SliverToBoxAdapter(child: _buildSortChips()),
                    const SliverToBoxAdapter(child: SizedBox(height: 6)),
                    if (filtered.isEmpty)
                      _EmptySearchState(query: _query)
                    else
                      SliverPadding(
                        padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
                        sliver: SliverGrid(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 14,
                            mainAxisSpacing: 14,
                            childAspectRatio: 0.58,
                          ),
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              final product = filtered[index];

                              return _ProductCard(
                                product: product,
                                isWishlisted:
                                    _wishlistIds.contains(product.id),
                                onWishlistToggle: () => setState(() {
                                  if (_wishlistIds.contains(product.id)) {
                                    _wishlistIds.remove(product.id);
                                  } else {
                                    _wishlistIds.add(product.id);
                                  }
                                }),
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ProductDetailsScreen(
                                      product: product,
                                    ),
                                  ),
                                ),
                              );
                            },
                            childCount: filtered.length,
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}


class _CartButton extends StatelessWidget {
  const _CartButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, cartState) {
          final count = cartState.cartItems
              .fold<int>(0, (sum, item) => sum + item.quantity);

          return Stack(
            clipBehavior: Clip.none,
            children: [
              Material(
                color: Colors.white,
                shape: const CircleBorder(),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {
                    context.read<CartBloc>().add(const CartEvent.fetchCart());
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const CartScreen()),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(9),
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      color: AppColors.ink,
                      size: 20,
                    ),
                  ),
                ),
              ),
              if (count > 0)
                Positioned(
                  top: -2,
                  right: -2,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                    decoration: BoxDecoration(
                      color: AppColors.sale,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.canvas, width: 1.5),
                    ),
                    child: Text(
                      '$count',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}


class _ProductCard extends StatelessWidget {
  final ProductModel product;
  final bool isWishlisted;
  final VoidCallback onWishlistToggle;
  final VoidCallback onTap;

  const _ProductCard({
    required this.product,
    required this.isWishlisted,
    required this.onWishlistToggle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isTopRated = product.rating >= 4.5;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: AppColors.ink.withOpacity(0.06),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    product.thumbnail,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return Container(
                        color: AppColors.canvas,
                        alignment: Alignment.center,
                        child: const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: AppColors.canvas,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.image_not_supported_outlined,
                        color: AppColors.inkMuted,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: const [0.55, 1.0],
                          colors: [
                            Colors.black.withOpacity(0.0),
                            Colors.black.withOpacity(0.45),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: _GlassPill(
                      label: product.rating.toStringAsFixed(1),
                      icon: Icons.star_rounded,
                      iconColor: AppColors.accent,
                      background: Colors.white.withOpacity(0.92),
                      foreground: AppColors.ink,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: _CircleIconButton(
                      icon: isWishlisted
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                      color: isWishlisted ? AppColors.sale : AppColors.inkMuted,
                      onTap: onWishlistToggle,
                    ),
                  ),
                  if (isTopRated)
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: _GlassPill(
                        label: 'Top rated',
                        background: AppColors.accent,
                        foreground: Colors.white,
                      ),
                    ),
                  Positioned(
                    left: 10,
                    bottom: 10,
                    child: _GlassPill(
                      label: '\u20b9${_formatPrice(product.price)}',
                      background: AppColors.ink.withOpacity(0.85),
                      foreground: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13.5,
                      height: 1.25,
                      fontWeight: FontWeight.w600,
                      color: AppColors.ink,
                    ),
                  ),
                  const SizedBox(height: 10),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, cartState) {
                      var quantity = 0;
                      for (final item in cartState.cartItems) {
                        if (item.id == product.id) {
                          quantity = item.quantity;
                          break;
                        }
                      }

                      if (quantity == 0) {
                        return SizedBox(
                          width: double.infinity,
                          height: 34,
                          child: OutlinedButton.icon(
                            onPressed: () {
                              context
                                  .read<CartBloc>()
                                  .add(CartEvent.addToCart(product));

                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(
                                  SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: AppColors.ink,
                                    duration: const Duration(seconds: 1),
                                    content:
                                        Text('${product.title} added to cart'),
                                  ),
                                );
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.primary,
                              side: const BorderSide(
                                color: AppColors.primary,
                                width: 1.2,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.zero,
                            ),
                            icon: const Icon(
                              Icons.add_shopping_cart_rounded,
                              size: 15,
                            ),
                            label: const Text(
                              'Add to cart',
                              style: TextStyle(
                                fontSize: 12.5,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        );
                      }

                      return Container(
                        height: 34,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _StepperButton(
                              icon: Icons.remove_rounded,
                              onTap: () => context.read<CartBloc>().add(
                                    CartEvent.decrementQuantity(product.id),
                                  ),
                            ),
                            Text(
                              '$quantity',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                              ),
                            ),
                            _StepperButton(
                              icon: Icons.add_rounded,
                              onTap: () => context.read<CartBloc>().add(
                                    CartEvent.incrementQuantity(product.id),
                                  ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StepperButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _StepperButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        width: 34,
        height: 34,
        child: Icon(icon, size: 16, color: Colors.white),
      ),
    );
  }
}

class _GlassPill extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Color? iconColor;
  final Color background;
  final Color foreground;

  const _GlassPill({
    required this.label,
    required this.background,
    required this.foreground,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 13, color: iconColor ?? foreground),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: TextStyle(
              color: foreground,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _CircleIconButton({
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(7),
          child: Icon(icon, size: 16, color: color),
        ),
      ),
    );
  }
}


class _ErrorState extends StatelessWidget {
  final String? message;
  final VoidCallback onRetry;

  const _ErrorState({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.wifi_off_rounded,
              size: 40,
              color: AppColors.inkMuted,
            ),
            const SizedBox(height: 14),
            Text(
              (message != null && message!.isNotEmpty)
                  ? message!
                  : "We couldn't load the products.",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15, color: AppColors.inkMuted),
            ),
            const SizedBox(height: 18),
            ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text('Try again'),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptySearchState extends StatelessWidget {
  final String query;

  const _EmptySearchState({required this.query});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.search_off_rounded,
                size: 40,
                color: AppColors.inkMuted,
              ),
              const SizedBox(height: 14),
              Text(
                query.isEmpty ? 'No products found' : 'No results for "$query"',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.ink,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Try a different keyword or clear your search.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: AppColors.inkMuted),
              ),
            ],
          ),
        ),
      ),
    );
  }
}