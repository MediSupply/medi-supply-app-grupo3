// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductDto {

 String get id; String get nombre; String get descripcion; String get categoria;@JsonKey(name: 'condiciones_almacenamiento') String get condicionesAlmacenamiento;@JsonKey(name: 'valor_unitario') double get valorUnitario;@JsonKey(name: 'fecha_vencimiento') DateTime? get fechaVencimiento; String get lote;@JsonKey(name: 'tiempo_estimado_entrega') DateTime? get tiempoEstimadoEntrega;@JsonKey(name: 'id_proveedor') String get idProveedor;
/// Create a copy of ProductDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDtoCopyWith<ProductDto> get copyWith => _$ProductDtoCopyWithImpl<ProductDto>(this as ProductDto, _$identity);

  /// Serializes this ProductDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDto&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.descripcion, descripcion) || other.descripcion == descripcion)&&(identical(other.categoria, categoria) || other.categoria == categoria)&&(identical(other.condicionesAlmacenamiento, condicionesAlmacenamiento) || other.condicionesAlmacenamiento == condicionesAlmacenamiento)&&(identical(other.valorUnitario, valorUnitario) || other.valorUnitario == valorUnitario)&&(identical(other.fechaVencimiento, fechaVencimiento) || other.fechaVencimiento == fechaVencimiento)&&(identical(other.lote, lote) || other.lote == lote)&&(identical(other.tiempoEstimadoEntrega, tiempoEstimadoEntrega) || other.tiempoEstimadoEntrega == tiempoEstimadoEntrega)&&(identical(other.idProveedor, idProveedor) || other.idProveedor == idProveedor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nombre,descripcion,categoria,condicionesAlmacenamiento,valorUnitario,fechaVencimiento,lote,tiempoEstimadoEntrega,idProveedor);

@override
String toString() {
  return 'ProductDto(id: $id, nombre: $nombre, descripcion: $descripcion, categoria: $categoria, condicionesAlmacenamiento: $condicionesAlmacenamiento, valorUnitario: $valorUnitario, fechaVencimiento: $fechaVencimiento, lote: $lote, tiempoEstimadoEntrega: $tiempoEstimadoEntrega, idProveedor: $idProveedor)';
}


}

/// @nodoc
abstract mixin class $ProductDtoCopyWith<$Res>  {
  factory $ProductDtoCopyWith(ProductDto value, $Res Function(ProductDto) _then) = _$ProductDtoCopyWithImpl;
@useResult
$Res call({
 String id, String nombre, String descripcion, String categoria,@JsonKey(name: 'condiciones_almacenamiento') String condicionesAlmacenamiento,@JsonKey(name: 'valor_unitario') double valorUnitario,@JsonKey(name: 'fecha_vencimiento') DateTime? fechaVencimiento, String lote,@JsonKey(name: 'tiempo_estimado_entrega') DateTime? tiempoEstimadoEntrega,@JsonKey(name: 'id_proveedor') String idProveedor
});




}
/// @nodoc
class _$ProductDtoCopyWithImpl<$Res>
    implements $ProductDtoCopyWith<$Res> {
  _$ProductDtoCopyWithImpl(this._self, this._then);

  final ProductDto _self;
  final $Res Function(ProductDto) _then;

/// Create a copy of ProductDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nombre = null,Object? descripcion = null,Object? categoria = null,Object? condicionesAlmacenamiento = null,Object? valorUnitario = null,Object? fechaVencimiento = freezed,Object? lote = null,Object? tiempoEstimadoEntrega = freezed,Object? idProveedor = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,descripcion: null == descripcion ? _self.descripcion : descripcion // ignore: cast_nullable_to_non_nullable
as String,categoria: null == categoria ? _self.categoria : categoria // ignore: cast_nullable_to_non_nullable
as String,condicionesAlmacenamiento: null == condicionesAlmacenamiento ? _self.condicionesAlmacenamiento : condicionesAlmacenamiento // ignore: cast_nullable_to_non_nullable
as String,valorUnitario: null == valorUnitario ? _self.valorUnitario : valorUnitario // ignore: cast_nullable_to_non_nullable
as double,fechaVencimiento: freezed == fechaVencimiento ? _self.fechaVencimiento : fechaVencimiento // ignore: cast_nullable_to_non_nullable
as DateTime?,lote: null == lote ? _self.lote : lote // ignore: cast_nullable_to_non_nullable
as String,tiempoEstimadoEntrega: freezed == tiempoEstimadoEntrega ? _self.tiempoEstimadoEntrega : tiempoEstimadoEntrega // ignore: cast_nullable_to_non_nullable
as DateTime?,idProveedor: null == idProveedor ? _self.idProveedor : idProveedor // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductDto].
extension ProductDtoPatterns on ProductDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductDto value)  $default,){
final _that = this;
switch (_that) {
case _ProductDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductDto value)?  $default,){
final _that = this;
switch (_that) {
case _ProductDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String nombre,  String descripcion,  String categoria, @JsonKey(name: 'condiciones_almacenamiento')  String condicionesAlmacenamiento, @JsonKey(name: 'valor_unitario')  double valorUnitario, @JsonKey(name: 'fecha_vencimiento')  DateTime? fechaVencimiento,  String lote, @JsonKey(name: 'tiempo_estimado_entrega')  DateTime? tiempoEstimadoEntrega, @JsonKey(name: 'id_proveedor')  String idProveedor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductDto() when $default != null:
return $default(_that.id,_that.nombre,_that.descripcion,_that.categoria,_that.condicionesAlmacenamiento,_that.valorUnitario,_that.fechaVencimiento,_that.lote,_that.tiempoEstimadoEntrega,_that.idProveedor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String nombre,  String descripcion,  String categoria, @JsonKey(name: 'condiciones_almacenamiento')  String condicionesAlmacenamiento, @JsonKey(name: 'valor_unitario')  double valorUnitario, @JsonKey(name: 'fecha_vencimiento')  DateTime? fechaVencimiento,  String lote, @JsonKey(name: 'tiempo_estimado_entrega')  DateTime? tiempoEstimadoEntrega, @JsonKey(name: 'id_proveedor')  String idProveedor)  $default,) {final _that = this;
switch (_that) {
case _ProductDto():
return $default(_that.id,_that.nombre,_that.descripcion,_that.categoria,_that.condicionesAlmacenamiento,_that.valorUnitario,_that.fechaVencimiento,_that.lote,_that.tiempoEstimadoEntrega,_that.idProveedor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String nombre,  String descripcion,  String categoria, @JsonKey(name: 'condiciones_almacenamiento')  String condicionesAlmacenamiento, @JsonKey(name: 'valor_unitario')  double valorUnitario, @JsonKey(name: 'fecha_vencimiento')  DateTime? fechaVencimiento,  String lote, @JsonKey(name: 'tiempo_estimado_entrega')  DateTime? tiempoEstimadoEntrega, @JsonKey(name: 'id_proveedor')  String idProveedor)?  $default,) {final _that = this;
switch (_that) {
case _ProductDto() when $default != null:
return $default(_that.id,_that.nombre,_that.descripcion,_that.categoria,_that.condicionesAlmacenamiento,_that.valorUnitario,_that.fechaVencimiento,_that.lote,_that.tiempoEstimadoEntrega,_that.idProveedor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductDto implements ProductDto {
  const _ProductDto({required this.id, required this.nombre, required this.descripcion, required this.categoria, @JsonKey(name: 'condiciones_almacenamiento') required this.condicionesAlmacenamiento, @JsonKey(name: 'valor_unitario') required this.valorUnitario, @JsonKey(name: 'fecha_vencimiento') this.fechaVencimiento, required this.lote, @JsonKey(name: 'tiempo_estimado_entrega') this.tiempoEstimadoEntrega, @JsonKey(name: 'id_proveedor') required this.idProveedor});
  factory _ProductDto.fromJson(Map<String, dynamic> json) => _$ProductDtoFromJson(json);

@override final  String id;
@override final  String nombre;
@override final  String descripcion;
@override final  String categoria;
@override@JsonKey(name: 'condiciones_almacenamiento') final  String condicionesAlmacenamiento;
@override@JsonKey(name: 'valor_unitario') final  double valorUnitario;
@override@JsonKey(name: 'fecha_vencimiento') final  DateTime? fechaVencimiento;
@override final  String lote;
@override@JsonKey(name: 'tiempo_estimado_entrega') final  DateTime? tiempoEstimadoEntrega;
@override@JsonKey(name: 'id_proveedor') final  String idProveedor;

/// Create a copy of ProductDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductDtoCopyWith<_ProductDto> get copyWith => __$ProductDtoCopyWithImpl<_ProductDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductDto&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.descripcion, descripcion) || other.descripcion == descripcion)&&(identical(other.categoria, categoria) || other.categoria == categoria)&&(identical(other.condicionesAlmacenamiento, condicionesAlmacenamiento) || other.condicionesAlmacenamiento == condicionesAlmacenamiento)&&(identical(other.valorUnitario, valorUnitario) || other.valorUnitario == valorUnitario)&&(identical(other.fechaVencimiento, fechaVencimiento) || other.fechaVencimiento == fechaVencimiento)&&(identical(other.lote, lote) || other.lote == lote)&&(identical(other.tiempoEstimadoEntrega, tiempoEstimadoEntrega) || other.tiempoEstimadoEntrega == tiempoEstimadoEntrega)&&(identical(other.idProveedor, idProveedor) || other.idProveedor == idProveedor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nombre,descripcion,categoria,condicionesAlmacenamiento,valorUnitario,fechaVencimiento,lote,tiempoEstimadoEntrega,idProveedor);

@override
String toString() {
  return 'ProductDto(id: $id, nombre: $nombre, descripcion: $descripcion, categoria: $categoria, condicionesAlmacenamiento: $condicionesAlmacenamiento, valorUnitario: $valorUnitario, fechaVencimiento: $fechaVencimiento, lote: $lote, tiempoEstimadoEntrega: $tiempoEstimadoEntrega, idProveedor: $idProveedor)';
}


}

/// @nodoc
abstract mixin class _$ProductDtoCopyWith<$Res> implements $ProductDtoCopyWith<$Res> {
  factory _$ProductDtoCopyWith(_ProductDto value, $Res Function(_ProductDto) _then) = __$ProductDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String nombre, String descripcion, String categoria,@JsonKey(name: 'condiciones_almacenamiento') String condicionesAlmacenamiento,@JsonKey(name: 'valor_unitario') double valorUnitario,@JsonKey(name: 'fecha_vencimiento') DateTime? fechaVencimiento, String lote,@JsonKey(name: 'tiempo_estimado_entrega') DateTime? tiempoEstimadoEntrega,@JsonKey(name: 'id_proveedor') String idProveedor
});




}
/// @nodoc
class __$ProductDtoCopyWithImpl<$Res>
    implements _$ProductDtoCopyWith<$Res> {
  __$ProductDtoCopyWithImpl(this._self, this._then);

  final _ProductDto _self;
  final $Res Function(_ProductDto) _then;

/// Create a copy of ProductDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nombre = null,Object? descripcion = null,Object? categoria = null,Object? condicionesAlmacenamiento = null,Object? valorUnitario = null,Object? fechaVencimiento = freezed,Object? lote = null,Object? tiempoEstimadoEntrega = freezed,Object? idProveedor = null,}) {
  return _then(_ProductDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,descripcion: null == descripcion ? _self.descripcion : descripcion // ignore: cast_nullable_to_non_nullable
as String,categoria: null == categoria ? _self.categoria : categoria // ignore: cast_nullable_to_non_nullable
as String,condicionesAlmacenamiento: null == condicionesAlmacenamiento ? _self.condicionesAlmacenamiento : condicionesAlmacenamiento // ignore: cast_nullable_to_non_nullable
as String,valorUnitario: null == valorUnitario ? _self.valorUnitario : valorUnitario // ignore: cast_nullable_to_non_nullable
as double,fechaVencimiento: freezed == fechaVencimiento ? _self.fechaVencimiento : fechaVencimiento // ignore: cast_nullable_to_non_nullable
as DateTime?,lote: null == lote ? _self.lote : lote // ignore: cast_nullable_to_non_nullable
as String,tiempoEstimadoEntrega: freezed == tiempoEstimadoEntrega ? _self.tiempoEstimadoEntrega : tiempoEstimadoEntrega // ignore: cast_nullable_to_non_nullable
as DateTime?,idProveedor: null == idProveedor ? _self.idProveedor : idProveedor // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
