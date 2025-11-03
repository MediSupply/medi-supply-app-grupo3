// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderDto {

 String get id; double get valor; String get estado;@JsonKey(name: 'fecha_creacion') String get fechaCreacion;@JsonKey(name: 'fecha_entrega_estimada') String get fechaEntregaEstimada;@JsonKey(name: 'direccion_entrega') String get direccionEntrega; List<OrderItemDto> get items;
/// Create a copy of OrderDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderDtoCopyWith<OrderDto> get copyWith => _$OrderDtoCopyWithImpl<OrderDto>(this as OrderDto, _$identity);

  /// Serializes this OrderDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDto&&(identical(other.id, id) || other.id == id)&&(identical(other.valor, valor) || other.valor == valor)&&(identical(other.estado, estado) || other.estado == estado)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion)&&(identical(other.fechaEntregaEstimada, fechaEntregaEstimada) || other.fechaEntregaEstimada == fechaEntregaEstimada)&&(identical(other.direccionEntrega, direccionEntrega) || other.direccionEntrega == direccionEntrega)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,valor,estado,fechaCreacion,fechaEntregaEstimada,direccionEntrega,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'OrderDto(id: $id, valor: $valor, estado: $estado, fechaCreacion: $fechaCreacion, fechaEntregaEstimada: $fechaEntregaEstimada, direccionEntrega: $direccionEntrega, items: $items)';
}


}

/// @nodoc
abstract mixin class $OrderDtoCopyWith<$Res>  {
  factory $OrderDtoCopyWith(OrderDto value, $Res Function(OrderDto) _then) = _$OrderDtoCopyWithImpl;
@useResult
$Res call({
 String id, double valor, String estado,@JsonKey(name: 'fecha_creacion') String fechaCreacion,@JsonKey(name: 'fecha_entrega_estimada') String fechaEntregaEstimada,@JsonKey(name: 'direccion_entrega') String direccionEntrega, List<OrderItemDto> items
});




}
/// @nodoc
class _$OrderDtoCopyWithImpl<$Res>
    implements $OrderDtoCopyWith<$Res> {
  _$OrderDtoCopyWithImpl(this._self, this._then);

  final OrderDto _self;
  final $Res Function(OrderDto) _then;

/// Create a copy of OrderDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? valor = null,Object? estado = null,Object? fechaCreacion = null,Object? fechaEntregaEstimada = null,Object? direccionEntrega = null,Object? items = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,valor: null == valor ? _self.valor : valor // ignore: cast_nullable_to_non_nullable
as double,estado: null == estado ? _self.estado : estado // ignore: cast_nullable_to_non_nullable
as String,fechaCreacion: null == fechaCreacion ? _self.fechaCreacion : fechaCreacion // ignore: cast_nullable_to_non_nullable
as String,fechaEntregaEstimada: null == fechaEntregaEstimada ? _self.fechaEntregaEstimada : fechaEntregaEstimada // ignore: cast_nullable_to_non_nullable
as String,direccionEntrega: null == direccionEntrega ? _self.direccionEntrega : direccionEntrega // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItemDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderDto].
extension OrderDtoPatterns on OrderDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderDto value)  $default,){
final _that = this;
switch (_that) {
case _OrderDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderDto value)?  $default,){
final _that = this;
switch (_that) {
case _OrderDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  double valor,  String estado, @JsonKey(name: 'fecha_creacion')  String fechaCreacion, @JsonKey(name: 'fecha_entrega_estimada')  String fechaEntregaEstimada, @JsonKey(name: 'direccion_entrega')  String direccionEntrega,  List<OrderItemDto> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderDto() when $default != null:
return $default(_that.id,_that.valor,_that.estado,_that.fechaCreacion,_that.fechaEntregaEstimada,_that.direccionEntrega,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  double valor,  String estado, @JsonKey(name: 'fecha_creacion')  String fechaCreacion, @JsonKey(name: 'fecha_entrega_estimada')  String fechaEntregaEstimada, @JsonKey(name: 'direccion_entrega')  String direccionEntrega,  List<OrderItemDto> items)  $default,) {final _that = this;
switch (_that) {
case _OrderDto():
return $default(_that.id,_that.valor,_that.estado,_that.fechaCreacion,_that.fechaEntregaEstimada,_that.direccionEntrega,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  double valor,  String estado, @JsonKey(name: 'fecha_creacion')  String fechaCreacion, @JsonKey(name: 'fecha_entrega_estimada')  String fechaEntregaEstimada, @JsonKey(name: 'direccion_entrega')  String direccionEntrega,  List<OrderItemDto> items)?  $default,) {final _that = this;
switch (_that) {
case _OrderDto() when $default != null:
return $default(_that.id,_that.valor,_that.estado,_that.fechaCreacion,_that.fechaEntregaEstimada,_that.direccionEntrega,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderDto implements OrderDto {
  const _OrderDto({required this.id, required this.valor, required this.estado, @JsonKey(name: 'fecha_creacion') required this.fechaCreacion, @JsonKey(name: 'fecha_entrega_estimada') required this.fechaEntregaEstimada, @JsonKey(name: 'direccion_entrega') required this.direccionEntrega, required final  List<OrderItemDto> items}): _items = items;
  factory _OrderDto.fromJson(Map<String, dynamic> json) => _$OrderDtoFromJson(json);

@override final  String id;
@override final  double valor;
@override final  String estado;
@override@JsonKey(name: 'fecha_creacion') final  String fechaCreacion;
@override@JsonKey(name: 'fecha_entrega_estimada') final  String fechaEntregaEstimada;
@override@JsonKey(name: 'direccion_entrega') final  String direccionEntrega;
 final  List<OrderItemDto> _items;
@override List<OrderItemDto> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of OrderDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderDtoCopyWith<_OrderDto> get copyWith => __$OrderDtoCopyWithImpl<_OrderDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderDto&&(identical(other.id, id) || other.id == id)&&(identical(other.valor, valor) || other.valor == valor)&&(identical(other.estado, estado) || other.estado == estado)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion)&&(identical(other.fechaEntregaEstimada, fechaEntregaEstimada) || other.fechaEntregaEstimada == fechaEntregaEstimada)&&(identical(other.direccionEntrega, direccionEntrega) || other.direccionEntrega == direccionEntrega)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,valor,estado,fechaCreacion,fechaEntregaEstimada,direccionEntrega,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'OrderDto(id: $id, valor: $valor, estado: $estado, fechaCreacion: $fechaCreacion, fechaEntregaEstimada: $fechaEntregaEstimada, direccionEntrega: $direccionEntrega, items: $items)';
}


}

/// @nodoc
abstract mixin class _$OrderDtoCopyWith<$Res> implements $OrderDtoCopyWith<$Res> {
  factory _$OrderDtoCopyWith(_OrderDto value, $Res Function(_OrderDto) _then) = __$OrderDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, double valor, String estado,@JsonKey(name: 'fecha_creacion') String fechaCreacion,@JsonKey(name: 'fecha_entrega_estimada') String fechaEntregaEstimada,@JsonKey(name: 'direccion_entrega') String direccionEntrega, List<OrderItemDto> items
});




}
/// @nodoc
class __$OrderDtoCopyWithImpl<$Res>
    implements _$OrderDtoCopyWith<$Res> {
  __$OrderDtoCopyWithImpl(this._self, this._then);

  final _OrderDto _self;
  final $Res Function(_OrderDto) _then;

/// Create a copy of OrderDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? valor = null,Object? estado = null,Object? fechaCreacion = null,Object? fechaEntregaEstimada = null,Object? direccionEntrega = null,Object? items = null,}) {
  return _then(_OrderDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,valor: null == valor ? _self.valor : valor // ignore: cast_nullable_to_non_nullable
as double,estado: null == estado ? _self.estado : estado // ignore: cast_nullable_to_non_nullable
as String,fechaCreacion: null == fechaCreacion ? _self.fechaCreacion : fechaCreacion // ignore: cast_nullable_to_non_nullable
as String,fechaEntregaEstimada: null == fechaEntregaEstimada ? _self.fechaEntregaEstimada : fechaEntregaEstimada // ignore: cast_nullable_to_non_nullable
as String,direccionEntrega: null == direccionEntrega ? _self.direccionEntrega : direccionEntrega // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItemDto>,
  ));
}


}

// dart format on
