import 'package:flutter/material.dart';
import 'package:product_listing_app/core/constants/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.border,
      highlightColor: Colors.white,
      period: const Duration(milliseconds: 1400),
      child: GridView.builder(
      
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          childAspectRatio: 0.58,
        ),
        itemBuilder: (context, index) => const _ShimmerCard(),
      ),
    );
  }
}


class _ShimmerCard extends StatelessWidget {
  const _ShimmerCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(color: Colors.white),
                Positioned(
                  top: 10,
                  left: 10,
                  child: _block(width: 46, height: 22, radius: 20),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: _block(width: 32, height: 32, radius: 16),
                ),
                Positioned(
                  left: 10,
                  bottom: 10,
                  child: _block(width: 56, height: 24, radius: 20),
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
                _block(width: double.infinity, height: 13, radius: 4),
                const SizedBox(height: 6),
                _block(width: 90, height: 13, radius: 4),
                const SizedBox(height: 10),
                _block(width: double.infinity, height: 34, radius: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _block({
    required double width,
    required double height,
    required double radius,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}