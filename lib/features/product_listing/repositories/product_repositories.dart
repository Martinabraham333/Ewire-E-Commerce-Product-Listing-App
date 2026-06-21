import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:product_listing_app/core/network/api_client.dart';

import 'package:product_listing_app/features/product_listing/models/product_model.dart';

class ProductRepositories {
  final ApiClient apiClient;

  ProductRepositories({
    required this.apiClient,
  });

Future<Either<String, List<ProductModel>>>
    getProducts() async {
  try {
    final Response response =
        await apiClient.get('/products');

    final List products =
        response.data['products'];

    final result = products
        .map(
          (e) => ProductModel.fromJson(e),
        )
        .toList();

    return Right(result);
  } catch (e) {
    return Left(e.toString());
  }
}

Future<Either<String, ProductModel>>
    getProductDetails(int productId) async {
  try {
    final Response response =
        await apiClient.get(
      '/products/$productId',
    );

    return Right(
      ProductModel.fromJson(
        response.data,
      ),
    );
  } catch (e) {
    return Left(e.toString());
  }
}

}