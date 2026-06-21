// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductEvent()';
}


}

/// @nodoc
class $ProductEventCopyWith<$Res>  {
$ProductEventCopyWith(ProductEvent _, $Res Function(ProductEvent) __);
}


/// Adds pattern-matching-related methods to [ProductEvent].
extension ProductEventPatterns on ProductEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FetchProducts value)?  fetchProducts,TResult Function( FetchProductsById value)?  fetchProductsById,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FetchProducts() when fetchProducts != null:
return fetchProducts(_that);case FetchProductsById() when fetchProductsById != null:
return fetchProductsById(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FetchProducts value)  fetchProducts,required TResult Function( FetchProductsById value)  fetchProductsById,}){
final _that = this;
switch (_that) {
case FetchProducts():
return fetchProducts(_that);case FetchProductsById():
return fetchProductsById(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FetchProducts value)?  fetchProducts,TResult? Function( FetchProductsById value)?  fetchProductsById,}){
final _that = this;
switch (_that) {
case FetchProducts() when fetchProducts != null:
return fetchProducts(_that);case FetchProductsById() when fetchProductsById != null:
return fetchProductsById(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetchProducts,TResult Function( int productId)?  fetchProductsById,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FetchProducts() when fetchProducts != null:
return fetchProducts();case FetchProductsById() when fetchProductsById != null:
return fetchProductsById(_that.productId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetchProducts,required TResult Function( int productId)  fetchProductsById,}) {final _that = this;
switch (_that) {
case FetchProducts():
return fetchProducts();case FetchProductsById():
return fetchProductsById(_that.productId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetchProducts,TResult? Function( int productId)?  fetchProductsById,}) {final _that = this;
switch (_that) {
case FetchProducts() when fetchProducts != null:
return fetchProducts();case FetchProductsById() when fetchProductsById != null:
return fetchProductsById(_that.productId);case _:
  return null;

}
}

}

/// @nodoc


class FetchProducts implements ProductEvent {
  const FetchProducts();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchProducts);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductEvent.fetchProducts()';
}


}




/// @nodoc


class FetchProductsById implements ProductEvent {
  const FetchProductsById(this.productId);
  

 final  int productId;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FetchProductsByIdCopyWith<FetchProductsById> get copyWith => _$FetchProductsByIdCopyWithImpl<FetchProductsById>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchProductsById&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'ProductEvent.fetchProductsById(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $FetchProductsByIdCopyWith<$Res> implements $ProductEventCopyWith<$Res> {
  factory $FetchProductsByIdCopyWith(FetchProductsById value, $Res Function(FetchProductsById) _then) = _$FetchProductsByIdCopyWithImpl;
@useResult
$Res call({
 int productId
});




}
/// @nodoc
class _$FetchProductsByIdCopyWithImpl<$Res>
    implements $FetchProductsByIdCopyWith<$Res> {
  _$FetchProductsByIdCopyWithImpl(this._self, this._then);

  final FetchProductsById _self;
  final $Res Function(FetchProductsById) _then;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(FetchProductsById(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$ProductState {

 ResponseStatus get responseStatus; ProductAction get productAction; String? get msg; List<ProductModel> get products; ProductModel? get productDetails;
/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductStateCopyWith<ProductState> get copyWith => _$ProductStateCopyWithImpl<ProductState>(this as ProductState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductState&&(identical(other.responseStatus, responseStatus) || other.responseStatus == responseStatus)&&(identical(other.productAction, productAction) || other.productAction == productAction)&&(identical(other.msg, msg) || other.msg == msg)&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.productDetails, productDetails) || other.productDetails == productDetails));
}


@override
int get hashCode => Object.hash(runtimeType,responseStatus,productAction,msg,const DeepCollectionEquality().hash(products),productDetails);

@override
String toString() {
  return 'ProductState(responseStatus: $responseStatus, productAction: $productAction, msg: $msg, products: $products, productDetails: $productDetails)';
}


}

/// @nodoc
abstract mixin class $ProductStateCopyWith<$Res>  {
  factory $ProductStateCopyWith(ProductState value, $Res Function(ProductState) _then) = _$ProductStateCopyWithImpl;
@useResult
$Res call({
 ResponseStatus responseStatus, ProductAction productAction, String? msg, List<ProductModel> products, ProductModel? productDetails
});




}
/// @nodoc
class _$ProductStateCopyWithImpl<$Res>
    implements $ProductStateCopyWith<$Res> {
  _$ProductStateCopyWithImpl(this._self, this._then);

  final ProductState _self;
  final $Res Function(ProductState) _then;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? responseStatus = null,Object? productAction = null,Object? msg = freezed,Object? products = null,Object? productDetails = freezed,}) {
  return _then(_self.copyWith(
responseStatus: null == responseStatus ? _self.responseStatus : responseStatus // ignore: cast_nullable_to_non_nullable
as ResponseStatus,productAction: null == productAction ? _self.productAction : productAction // ignore: cast_nullable_to_non_nullable
as ProductAction,msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,productDetails: freezed == productDetails ? _self.productDetails : productDetails // ignore: cast_nullable_to_non_nullable
as ProductModel?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductState].
extension ProductStatePatterns on ProductState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductState value)  $default,){
final _that = this;
switch (_that) {
case _ProductState():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductState value)?  $default,){
final _that = this;
switch (_that) {
case _ProductState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ResponseStatus responseStatus,  ProductAction productAction,  String? msg,  List<ProductModel> products,  ProductModel? productDetails)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductState() when $default != null:
return $default(_that.responseStatus,_that.productAction,_that.msg,_that.products,_that.productDetails);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ResponseStatus responseStatus,  ProductAction productAction,  String? msg,  List<ProductModel> products,  ProductModel? productDetails)  $default,) {final _that = this;
switch (_that) {
case _ProductState():
return $default(_that.responseStatus,_that.productAction,_that.msg,_that.products,_that.productDetails);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ResponseStatus responseStatus,  ProductAction productAction,  String? msg,  List<ProductModel> products,  ProductModel? productDetails)?  $default,) {final _that = this;
switch (_that) {
case _ProductState() when $default != null:
return $default(_that.responseStatus,_that.productAction,_that.msg,_that.products,_that.productDetails);case _:
  return null;

}
}

}

/// @nodoc


class _ProductState implements ProductState {
  const _ProductState({this.responseStatus = ResponseStatus.initial, this.productAction = ProductAction.none, this.msg, final  List<ProductModel> products = const [], this.productDetails}): _products = products;
  

@override@JsonKey() final  ResponseStatus responseStatus;
@override@JsonKey() final  ProductAction productAction;
@override final  String? msg;
 final  List<ProductModel> _products;
@override@JsonKey() List<ProductModel> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

@override final  ProductModel? productDetails;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductStateCopyWith<_ProductState> get copyWith => __$ProductStateCopyWithImpl<_ProductState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductState&&(identical(other.responseStatus, responseStatus) || other.responseStatus == responseStatus)&&(identical(other.productAction, productAction) || other.productAction == productAction)&&(identical(other.msg, msg) || other.msg == msg)&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.productDetails, productDetails) || other.productDetails == productDetails));
}


@override
int get hashCode => Object.hash(runtimeType,responseStatus,productAction,msg,const DeepCollectionEquality().hash(_products),productDetails);

@override
String toString() {
  return 'ProductState(responseStatus: $responseStatus, productAction: $productAction, msg: $msg, products: $products, productDetails: $productDetails)';
}


}

/// @nodoc
abstract mixin class _$ProductStateCopyWith<$Res> implements $ProductStateCopyWith<$Res> {
  factory _$ProductStateCopyWith(_ProductState value, $Res Function(_ProductState) _then) = __$ProductStateCopyWithImpl;
@override @useResult
$Res call({
 ResponseStatus responseStatus, ProductAction productAction, String? msg, List<ProductModel> products, ProductModel? productDetails
});




}
/// @nodoc
class __$ProductStateCopyWithImpl<$Res>
    implements _$ProductStateCopyWith<$Res> {
  __$ProductStateCopyWithImpl(this._self, this._then);

  final _ProductState _self;
  final $Res Function(_ProductState) _then;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? responseStatus = null,Object? productAction = null,Object? msg = freezed,Object? products = null,Object? productDetails = freezed,}) {
  return _then(_ProductState(
responseStatus: null == responseStatus ? _self.responseStatus : responseStatus // ignore: cast_nullable_to_non_nullable
as ResponseStatus,productAction: null == productAction ? _self.productAction : productAction // ignore: cast_nullable_to_non_nullable
as ProductAction,msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,productDetails: freezed == productDetails ? _self.productDetails : productDetails // ignore: cast_nullable_to_non_nullable
as ProductModel?,
  ));
}


}

// dart format on
