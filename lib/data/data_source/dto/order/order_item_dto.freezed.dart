// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderItemDto {

 ProductDto get producto; int get cantidad; double get precioUnitario; double get precioTotal;
/// Create a copy of OrderItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderItemDtoCopyWith<OrderItemDto> get copyWith => _$OrderItemDtoCopyWithImpl<OrderItemDto>(this as OrderItemDto, _$identity);

  /// Serializes this OrderItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderItemDto&&(identical(other.producto, producto) || other.producto == producto)&&(identical(other.cantidad, cantidad) || other.cantidad == cantidad)&&(identical(other.precioUnitario, precioUnitario) || other.precioUnitario == precioUnitario)&&(identical(other.precioTotal, precioTotal) || other.precioTotal == precioTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,producto,cantidad,precioUnitario,precioTotal);

@override
String toString() {
  return 'OrderItemDto(producto: $producto, cantidad: $cantidad, precioUnitario: $precioUnitario, precioTotal: $precioTotal)';
}


}

/// @nodoc
abstract mixin class $OrderItemDtoCopyWith<$Res>  {
  factory $OrderItemDtoCopyWith(OrderItemDto value, $Res Function(OrderItemDto) _then) = _$OrderItemDtoCopyWithImpl;
@useResult
$Res call({
 ProductDto producto, int cantidad, double precioUnitario, double precioTotal
});


$ProductDtoCopyWith<$Res> get producto;

}
/// @nodoc
class _$OrderItemDtoCopyWithImpl<$Res>
    implements $OrderItemDtoCopyWith<$Res> {
  _$OrderItemDtoCopyWithImpl(this._self, this._then);

  final OrderItemDto _self;
  final $Res Function(OrderItemDto) _then;

/// Create a copy of OrderItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? producto = null,Object? cantidad = null,Object? precioUnitario = null,Object? precioTotal = null,}) {
  return _then(_self.copyWith(
producto: null == producto ? _self.producto : producto // ignore: cast_nullable_to_non_nullable
as ProductDto,cantidad: null == cantidad ? _self.cantidad : cantidad // ignore: cast_nullable_to_non_nullable
as int,precioUnitario: null == precioUnitario ? _self.precioUnitario : precioUnitario // ignore: cast_nullable_to_non_nullable
as double,precioTotal: null == precioTotal ? _self.precioTotal : precioTotal // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of OrderItemDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductDtoCopyWith<$Res> get producto {
  
  return $ProductDtoCopyWith<$Res>(_self.producto, (value) {
    return _then(_self.copyWith(producto: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderItemDto].
extension OrderItemDtoPatterns on OrderItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderItemDto value)  $default,){
final _that = this;
switch (_that) {
case _OrderItemDto():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _OrderItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProductDto producto,  int cantidad,  double precioUnitario,  double precioTotal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderItemDto() when $default != null:
return $default(_that.producto,_that.cantidad,_that.precioUnitario,_that.precioTotal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProductDto producto,  int cantidad,  double precioUnitario,  double precioTotal)  $default,) {final _that = this;
switch (_that) {
case _OrderItemDto():
return $default(_that.producto,_that.cantidad,_that.precioUnitario,_that.precioTotal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProductDto producto,  int cantidad,  double precioUnitario,  double precioTotal)?  $default,) {final _that = this;
switch (_that) {
case _OrderItemDto() when $default != null:
return $default(_that.producto,_that.cantidad,_that.precioUnitario,_that.precioTotal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderItemDto implements OrderItemDto {
  const _OrderItemDto({required this.producto, required this.cantidad, required this.precioUnitario, required this.precioTotal});
  factory _OrderItemDto.fromJson(Map<String, dynamic> json) => _$OrderItemDtoFromJson(json);

@override final  ProductDto producto;
@override final  int cantidad;
@override final  double precioUnitario;
@override final  double precioTotal;

/// Create a copy of OrderItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderItemDtoCopyWith<_OrderItemDto> get copyWith => __$OrderItemDtoCopyWithImpl<_OrderItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderItemDto&&(identical(other.producto, producto) || other.producto == producto)&&(identical(other.cantidad, cantidad) || other.cantidad == cantidad)&&(identical(other.precioUnitario, precioUnitario) || other.precioUnitario == precioUnitario)&&(identical(other.precioTotal, precioTotal) || other.precioTotal == precioTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,producto,cantidad,precioUnitario,precioTotal);

@override
String toString() {
  return 'OrderItemDto(producto: $producto, cantidad: $cantidad, precioUnitario: $precioUnitario, precioTotal: $precioTotal)';
}


}

/// @nodoc
abstract mixin class _$OrderItemDtoCopyWith<$Res> implements $OrderItemDtoCopyWith<$Res> {
  factory _$OrderItemDtoCopyWith(_OrderItemDto value, $Res Function(_OrderItemDto) _then) = __$OrderItemDtoCopyWithImpl;
@override @useResult
$Res call({
 ProductDto producto, int cantidad, double precioUnitario, double precioTotal
});


@override $ProductDtoCopyWith<$Res> get producto;

}
/// @nodoc
class __$OrderItemDtoCopyWithImpl<$Res>
    implements _$OrderItemDtoCopyWith<$Res> {
  __$OrderItemDtoCopyWithImpl(this._self, this._then);

  final _OrderItemDto _self;
  final $Res Function(_OrderItemDto) _then;

/// Create a copy of OrderItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? producto = null,Object? cantidad = null,Object? precioUnitario = null,Object? precioTotal = null,}) {
  return _then(_OrderItemDto(
producto: null == producto ? _self.producto : producto // ignore: cast_nullable_to_non_nullable
as ProductDto,cantidad: null == cantidad ? _self.cantidad : cantidad // ignore: cast_nullable_to_non_nullable
as int,precioUnitario: null == precioUnitario ? _self.precioUnitario : precioUnitario // ignore: cast_nullable_to_non_nullable
as double,precioTotal: null == precioTotal ? _self.precioTotal : precioTotal // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of OrderItemDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductDtoCopyWith<$Res> get producto {
  
  return $ProductDtoCopyWith<$Res>(_self.producto, (value) {
    return _then(_self.copyWith(producto: value));
  });
}
}

// dart format on
