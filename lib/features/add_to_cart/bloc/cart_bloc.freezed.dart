// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CartEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartEvent()';
}


}

/// @nodoc
class $CartEventCopyWith<$Res>  {
$CartEventCopyWith(CartEvent _, $Res Function(CartEvent) __);
}


/// Adds pattern-matching-related methods to [CartEvent].
extension CartEventPatterns on CartEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FetchCart value)?  fetchCart,TResult Function( AddToCart value)?  addToCart,TResult Function( RemoveFromCart value)?  removeFromCart,TResult Function( IncrementQuantity value)?  incrementQuantity,TResult Function( DecrementQuantity value)?  decrementQuantity,TResult Function( ClearCart value)?  clearCart,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FetchCart() when fetchCart != null:
return fetchCart(_that);case AddToCart() when addToCart != null:
return addToCart(_that);case RemoveFromCart() when removeFromCart != null:
return removeFromCart(_that);case IncrementQuantity() when incrementQuantity != null:
return incrementQuantity(_that);case DecrementQuantity() when decrementQuantity != null:
return decrementQuantity(_that);case ClearCart() when clearCart != null:
return clearCart(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FetchCart value)  fetchCart,required TResult Function( AddToCart value)  addToCart,required TResult Function( RemoveFromCart value)  removeFromCart,required TResult Function( IncrementQuantity value)  incrementQuantity,required TResult Function( DecrementQuantity value)  decrementQuantity,required TResult Function( ClearCart value)  clearCart,}){
final _that = this;
switch (_that) {
case FetchCart():
return fetchCart(_that);case AddToCart():
return addToCart(_that);case RemoveFromCart():
return removeFromCart(_that);case IncrementQuantity():
return incrementQuantity(_that);case DecrementQuantity():
return decrementQuantity(_that);case ClearCart():
return clearCart(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FetchCart value)?  fetchCart,TResult? Function( AddToCart value)?  addToCart,TResult? Function( RemoveFromCart value)?  removeFromCart,TResult? Function( IncrementQuantity value)?  incrementQuantity,TResult? Function( DecrementQuantity value)?  decrementQuantity,TResult? Function( ClearCart value)?  clearCart,}){
final _that = this;
switch (_that) {
case FetchCart() when fetchCart != null:
return fetchCart(_that);case AddToCart() when addToCart != null:
return addToCart(_that);case RemoveFromCart() when removeFromCart != null:
return removeFromCart(_that);case IncrementQuantity() when incrementQuantity != null:
return incrementQuantity(_that);case DecrementQuantity() when decrementQuantity != null:
return decrementQuantity(_that);case ClearCart() when clearCart != null:
return clearCart(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetchCart,TResult Function( ProductModel product)?  addToCart,TResult Function( int productId)?  removeFromCart,TResult Function( int productId)?  incrementQuantity,TResult Function( int productId)?  decrementQuantity,TResult Function()?  clearCart,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FetchCart() when fetchCart != null:
return fetchCart();case AddToCart() when addToCart != null:
return addToCart(_that.product);case RemoveFromCart() when removeFromCart != null:
return removeFromCart(_that.productId);case IncrementQuantity() when incrementQuantity != null:
return incrementQuantity(_that.productId);case DecrementQuantity() when decrementQuantity != null:
return decrementQuantity(_that.productId);case ClearCart() when clearCart != null:
return clearCart();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetchCart,required TResult Function( ProductModel product)  addToCart,required TResult Function( int productId)  removeFromCart,required TResult Function( int productId)  incrementQuantity,required TResult Function( int productId)  decrementQuantity,required TResult Function()  clearCart,}) {final _that = this;
switch (_that) {
case FetchCart():
return fetchCart();case AddToCart():
return addToCart(_that.product);case RemoveFromCart():
return removeFromCart(_that.productId);case IncrementQuantity():
return incrementQuantity(_that.productId);case DecrementQuantity():
return decrementQuantity(_that.productId);case ClearCart():
return clearCart();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetchCart,TResult? Function( ProductModel product)?  addToCart,TResult? Function( int productId)?  removeFromCart,TResult? Function( int productId)?  incrementQuantity,TResult? Function( int productId)?  decrementQuantity,TResult? Function()?  clearCart,}) {final _that = this;
switch (_that) {
case FetchCart() when fetchCart != null:
return fetchCart();case AddToCart() when addToCart != null:
return addToCart(_that.product);case RemoveFromCart() when removeFromCart != null:
return removeFromCart(_that.productId);case IncrementQuantity() when incrementQuantity != null:
return incrementQuantity(_that.productId);case DecrementQuantity() when decrementQuantity != null:
return decrementQuantity(_that.productId);case ClearCart() when clearCart != null:
return clearCart();case _:
  return null;

}
}

}

/// @nodoc


class FetchCart implements CartEvent {
  const FetchCart();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchCart);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartEvent.fetchCart()';
}


}




/// @nodoc


class AddToCart implements CartEvent {
  const AddToCart(this.product);
  

 final  ProductModel product;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddToCartCopyWith<AddToCart> get copyWith => _$AddToCartCopyWithImpl<AddToCart>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddToCart&&(identical(other.product, product) || other.product == product));
}


@override
int get hashCode => Object.hash(runtimeType,product);

@override
String toString() {
  return 'CartEvent.addToCart(product: $product)';
}


}

/// @nodoc
abstract mixin class $AddToCartCopyWith<$Res> implements $CartEventCopyWith<$Res> {
  factory $AddToCartCopyWith(AddToCart value, $Res Function(AddToCart) _then) = _$AddToCartCopyWithImpl;
@useResult
$Res call({
 ProductModel product
});




}
/// @nodoc
class _$AddToCartCopyWithImpl<$Res>
    implements $AddToCartCopyWith<$Res> {
  _$AddToCartCopyWithImpl(this._self, this._then);

  final AddToCart _self;
  final $Res Function(AddToCart) _then;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? product = null,}) {
  return _then(AddToCart(
null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductModel,
  ));
}


}

/// @nodoc


class RemoveFromCart implements CartEvent {
  const RemoveFromCart(this.productId);
  

 final  int productId;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoveFromCartCopyWith<RemoveFromCart> get copyWith => _$RemoveFromCartCopyWithImpl<RemoveFromCart>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoveFromCart&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'CartEvent.removeFromCart(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $RemoveFromCartCopyWith<$Res> implements $CartEventCopyWith<$Res> {
  factory $RemoveFromCartCopyWith(RemoveFromCart value, $Res Function(RemoveFromCart) _then) = _$RemoveFromCartCopyWithImpl;
@useResult
$Res call({
 int productId
});




}
/// @nodoc
class _$RemoveFromCartCopyWithImpl<$Res>
    implements $RemoveFromCartCopyWith<$Res> {
  _$RemoveFromCartCopyWithImpl(this._self, this._then);

  final RemoveFromCart _self;
  final $Res Function(RemoveFromCart) _then;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(RemoveFromCart(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class IncrementQuantity implements CartEvent {
  const IncrementQuantity(this.productId);
  

 final  int productId;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncrementQuantityCopyWith<IncrementQuantity> get copyWith => _$IncrementQuantityCopyWithImpl<IncrementQuantity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncrementQuantity&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'CartEvent.incrementQuantity(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $IncrementQuantityCopyWith<$Res> implements $CartEventCopyWith<$Res> {
  factory $IncrementQuantityCopyWith(IncrementQuantity value, $Res Function(IncrementQuantity) _then) = _$IncrementQuantityCopyWithImpl;
@useResult
$Res call({
 int productId
});




}
/// @nodoc
class _$IncrementQuantityCopyWithImpl<$Res>
    implements $IncrementQuantityCopyWith<$Res> {
  _$IncrementQuantityCopyWithImpl(this._self, this._then);

  final IncrementQuantity _self;
  final $Res Function(IncrementQuantity) _then;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(IncrementQuantity(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class DecrementQuantity implements CartEvent {
  const DecrementQuantity(this.productId);
  

 final  int productId;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DecrementQuantityCopyWith<DecrementQuantity> get copyWith => _$DecrementQuantityCopyWithImpl<DecrementQuantity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DecrementQuantity&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'CartEvent.decrementQuantity(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $DecrementQuantityCopyWith<$Res> implements $CartEventCopyWith<$Res> {
  factory $DecrementQuantityCopyWith(DecrementQuantity value, $Res Function(DecrementQuantity) _then) = _$DecrementQuantityCopyWithImpl;
@useResult
$Res call({
 int productId
});




}
/// @nodoc
class _$DecrementQuantityCopyWithImpl<$Res>
    implements $DecrementQuantityCopyWith<$Res> {
  _$DecrementQuantityCopyWithImpl(this._self, this._then);

  final DecrementQuantity _self;
  final $Res Function(DecrementQuantity) _then;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(DecrementQuantity(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class ClearCart implements CartEvent {
  const ClearCart();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearCart);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartEvent.clearCart()';
}


}




/// @nodoc
mixin _$CartState {

 ResponseStatus get responseStatus; CartAction get cartAction; String? get msg; List<CartModel> get cartItems; CartModel? get selectedCartItem; double get totalAmount;
/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartStateCopyWith<CartState> get copyWith => _$CartStateCopyWithImpl<CartState>(this as CartState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartState&&(identical(other.responseStatus, responseStatus) || other.responseStatus == responseStatus)&&(identical(other.cartAction, cartAction) || other.cartAction == cartAction)&&(identical(other.msg, msg) || other.msg == msg)&&const DeepCollectionEquality().equals(other.cartItems, cartItems)&&(identical(other.selectedCartItem, selectedCartItem) || other.selectedCartItem == selectedCartItem)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount));
}


@override
int get hashCode => Object.hash(runtimeType,responseStatus,cartAction,msg,const DeepCollectionEquality().hash(cartItems),selectedCartItem,totalAmount);

@override
String toString() {
  return 'CartState(responseStatus: $responseStatus, cartAction: $cartAction, msg: $msg, cartItems: $cartItems, selectedCartItem: $selectedCartItem, totalAmount: $totalAmount)';
}


}

/// @nodoc
abstract mixin class $CartStateCopyWith<$Res>  {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) _then) = _$CartStateCopyWithImpl;
@useResult
$Res call({
 ResponseStatus responseStatus, CartAction cartAction, String? msg, List<CartModel> cartItems, CartModel? selectedCartItem, double totalAmount
});




}
/// @nodoc
class _$CartStateCopyWithImpl<$Res>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._self, this._then);

  final CartState _self;
  final $Res Function(CartState) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? responseStatus = null,Object? cartAction = null,Object? msg = freezed,Object? cartItems = null,Object? selectedCartItem = freezed,Object? totalAmount = null,}) {
  return _then(_self.copyWith(
responseStatus: null == responseStatus ? _self.responseStatus : responseStatus // ignore: cast_nullable_to_non_nullable
as ResponseStatus,cartAction: null == cartAction ? _self.cartAction : cartAction // ignore: cast_nullable_to_non_nullable
as CartAction,msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,cartItems: null == cartItems ? _self.cartItems : cartItems // ignore: cast_nullable_to_non_nullable
as List<CartModel>,selectedCartItem: freezed == selectedCartItem ? _self.selectedCartItem : selectedCartItem // ignore: cast_nullable_to_non_nullable
as CartModel?,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CartState].
extension CartStatePatterns on CartState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartState value)  $default,){
final _that = this;
switch (_that) {
case _CartState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartState value)?  $default,){
final _that = this;
switch (_that) {
case _CartState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ResponseStatus responseStatus,  CartAction cartAction,  String? msg,  List<CartModel> cartItems,  CartModel? selectedCartItem,  double totalAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartState() when $default != null:
return $default(_that.responseStatus,_that.cartAction,_that.msg,_that.cartItems,_that.selectedCartItem,_that.totalAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ResponseStatus responseStatus,  CartAction cartAction,  String? msg,  List<CartModel> cartItems,  CartModel? selectedCartItem,  double totalAmount)  $default,) {final _that = this;
switch (_that) {
case _CartState():
return $default(_that.responseStatus,_that.cartAction,_that.msg,_that.cartItems,_that.selectedCartItem,_that.totalAmount);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ResponseStatus responseStatus,  CartAction cartAction,  String? msg,  List<CartModel> cartItems,  CartModel? selectedCartItem,  double totalAmount)?  $default,) {final _that = this;
switch (_that) {
case _CartState() when $default != null:
return $default(_that.responseStatus,_that.cartAction,_that.msg,_that.cartItems,_that.selectedCartItem,_that.totalAmount);case _:
  return null;

}
}

}

/// @nodoc


class _CartState implements CartState {
  const _CartState({this.responseStatus = ResponseStatus.initial, this.cartAction = CartAction.none, this.msg, final  List<CartModel> cartItems = const [], this.selectedCartItem, this.totalAmount = 0.0}): _cartItems = cartItems;
  

@override@JsonKey() final  ResponseStatus responseStatus;
@override@JsonKey() final  CartAction cartAction;
@override final  String? msg;
 final  List<CartModel> _cartItems;
@override@JsonKey() List<CartModel> get cartItems {
  if (_cartItems is EqualUnmodifiableListView) return _cartItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cartItems);
}

@override final  CartModel? selectedCartItem;
@override@JsonKey() final  double totalAmount;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartStateCopyWith<_CartState> get copyWith => __$CartStateCopyWithImpl<_CartState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartState&&(identical(other.responseStatus, responseStatus) || other.responseStatus == responseStatus)&&(identical(other.cartAction, cartAction) || other.cartAction == cartAction)&&(identical(other.msg, msg) || other.msg == msg)&&const DeepCollectionEquality().equals(other._cartItems, _cartItems)&&(identical(other.selectedCartItem, selectedCartItem) || other.selectedCartItem == selectedCartItem)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount));
}


@override
int get hashCode => Object.hash(runtimeType,responseStatus,cartAction,msg,const DeepCollectionEquality().hash(_cartItems),selectedCartItem,totalAmount);

@override
String toString() {
  return 'CartState(responseStatus: $responseStatus, cartAction: $cartAction, msg: $msg, cartItems: $cartItems, selectedCartItem: $selectedCartItem, totalAmount: $totalAmount)';
}


}

/// @nodoc
abstract mixin class _$CartStateCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$CartStateCopyWith(_CartState value, $Res Function(_CartState) _then) = __$CartStateCopyWithImpl;
@override @useResult
$Res call({
 ResponseStatus responseStatus, CartAction cartAction, String? msg, List<CartModel> cartItems, CartModel? selectedCartItem, double totalAmount
});




}
/// @nodoc
class __$CartStateCopyWithImpl<$Res>
    implements _$CartStateCopyWith<$Res> {
  __$CartStateCopyWithImpl(this._self, this._then);

  final _CartState _self;
  final $Res Function(_CartState) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? responseStatus = null,Object? cartAction = null,Object? msg = freezed,Object? cartItems = null,Object? selectedCartItem = freezed,Object? totalAmount = null,}) {
  return _then(_CartState(
responseStatus: null == responseStatus ? _self.responseStatus : responseStatus // ignore: cast_nullable_to_non_nullable
as ResponseStatus,cartAction: null == cartAction ? _self.cartAction : cartAction // ignore: cast_nullable_to_non_nullable
as CartAction,msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,cartItems: null == cartItems ? _self._cartItems : cartItems // ignore: cast_nullable_to_non_nullable
as List<CartModel>,selectedCartItem: freezed == selectedCartItem ? _self.selectedCartItem : selectedCartItem // ignore: cast_nullable_to_non_nullable
as CartModel?,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
