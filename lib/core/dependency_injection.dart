import 'package:get_it/get_it.dart';
import 'package:product_listing_app/core/network/api_client.dart';

import 'package:product_listing_app/features/product_listing/bloc/product_bloc.dart';
import 'package:product_listing_app/features/product_listing/repositories/product_repositories.dart';

import 'package:product_listing_app/features/add_to_cart/bloc/cart_bloc.dart';
import 'package:product_listing_app/features/add_to_cart/repositories/add_to_cart_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Api Client
  sl.registerLazySingleton<ApiClient>(
    () => ApiClient(),
  );

  // Product Repository
  sl.registerLazySingleton<ProductRepositories>(
    () => ProductRepositories(
      apiClient: sl<ApiClient>(),
    ),
  );

  // Cart Repository
  sl.registerLazySingleton<AddToCartRepository>(
    () => AddToCartRepository(),
  );

  // Product Bloc
  sl.registerFactory<ProductBloc>(
    () => ProductBloc(
      productRepositories:
          sl<ProductRepositories>(),
    ),
  );

  // Cart Bloc
  sl.registerFactory<CartBloc>(
    () => CartBloc(
      repository:
          sl<AddToCartRepository>(),
    ),
  );
}