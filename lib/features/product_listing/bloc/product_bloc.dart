import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:product_listing_app/features/product_listing/models/product_model.dart';
import 'package:product_listing_app/features/product_listing/repositories/product_repositories.dart';

part 'product_event.dart';
part 'product_state.dart';
part 'product_bloc.freezed.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepositories productRepositories;
  ProductBloc({required this.productRepositories}) : super(_ProductState()) {
    on<FetchProducts>(_fetchProducts);
    on<FetchProductsById>(_fetchProductsById);
  }

  Future<void> _fetchProductsById(
    FetchProductsById event,
    Emitter<ProductState> emit,
  ) async {
    emit(state.copyWith(responseStatus: ResponseStatus.loading));

    final result = await productRepositories.getProductDetails(event.productId);

    result.fold(
      (failure) {
        emit(
          state.copyWith(responseStatus: ResponseStatus.failure, msg: failure),
        );
      },
      (product) {
        emit(
          state.copyWith(
            productDetails: product,
            responseStatus: ResponseStatus.success,
          ),
        );
      },
    );
  }

  Future<void> _fetchProducts(
    FetchProducts event,
    Emitter<ProductState> emit,
  ) async {
    emit(
      state.copyWith(
        responseStatus: ResponseStatus.loading,
        productAction: ProductAction.fetchProducts,
        msg: null,
      ),
    );

    final result = await productRepositories.getProducts();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            responseStatus: ResponseStatus.failure,
            productAction: ProductAction.fetchProducts,
            msg: failure,
          ),
        );
      },
      (products) {
        emit(
          state.copyWith(
            responseStatus: ResponseStatus.success,
            productAction: ProductAction.fetchProducts,
            products: products,
          ),
        );
      },
    );
  }
}
