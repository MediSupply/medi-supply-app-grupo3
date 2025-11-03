// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClientDto {

 String get id; String get nombre; String get email; String get telefono; String get direccion;@JsonKey(name: 'razon_social') String get razonSocial; String get nit;
/// Create a copy of ClientDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientDtoCopyWith<ClientDto> get copyWith => _$ClientDtoCopyWithImpl<ClientDto>(this as ClientDto, _$identity);

  /// Serializes this ClientDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientDto&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.email, email) || other.email == email)&&(identical(other.telefono, telefono) || other.telefono == telefono)&&(identical(other.direccion, direccion) || other.direccion == direccion)&&(identical(other.razonSocial, razonSocial) || other.razonSocial == razonSocial)&&(identical(other.nit, nit) || other.nit == nit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nombre,email,telefono,direccion,razonSocial,nit);

@override
String toString() {
  return 'ClientDto(id: $id, nombre: $nombre, email: $email, telefono: $telefono, direccion: $direccion, razonSocial: $razonSocial, nit: $nit)';
}


}

/// @nodoc
abstract mixin class $ClientDtoCopyWith<$Res>  {
  factory $ClientDtoCopyWith(ClientDto value, $Res Function(ClientDto) _then) = _$ClientDtoCopyWithImpl;
@useResult
$Res call({
 String id, String nombre, String email, String telefono, String direccion,@JsonKey(name: 'razon_social') String razonSocial, String nit
});




}
/// @nodoc
class _$ClientDtoCopyWithImpl<$Res>
    implements $ClientDtoCopyWith<$Res> {
  _$ClientDtoCopyWithImpl(this._self, this._then);

  final ClientDto _self;
  final $Res Function(ClientDto) _then;

/// Create a copy of ClientDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nombre = null,Object? email = null,Object? telefono = null,Object? direccion = null,Object? razonSocial = null,Object? nit = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,telefono: null == telefono ? _self.telefono : telefono // ignore: cast_nullable_to_non_nullable
as String,direccion: null == direccion ? _self.direccion : direccion // ignore: cast_nullable_to_non_nullable
as String,razonSocial: null == razonSocial ? _self.razonSocial : razonSocial // ignore: cast_nullable_to_non_nullable
as String,nit: null == nit ? _self.nit : nit // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ClientDto].
extension ClientDtoPatterns on ClientDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClientDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClientDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClientDto value)  $default,){
final _that = this;
switch (_that) {
case _ClientDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClientDto value)?  $default,){
final _that = this;
switch (_that) {
case _ClientDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String nombre,  String email,  String telefono,  String direccion, @JsonKey(name: 'razon_social')  String razonSocial,  String nit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClientDto() when $default != null:
return $default(_that.id,_that.nombre,_that.email,_that.telefono,_that.direccion,_that.razonSocial,_that.nit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String nombre,  String email,  String telefono,  String direccion, @JsonKey(name: 'razon_social')  String razonSocial,  String nit)  $default,) {final _that = this;
switch (_that) {
case _ClientDto():
return $default(_that.id,_that.nombre,_that.email,_that.telefono,_that.direccion,_that.razonSocial,_that.nit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String nombre,  String email,  String telefono,  String direccion, @JsonKey(name: 'razon_social')  String razonSocial,  String nit)?  $default,) {final _that = this;
switch (_that) {
case _ClientDto() when $default != null:
return $default(_that.id,_that.nombre,_that.email,_that.telefono,_that.direccion,_that.razonSocial,_that.nit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClientDto implements ClientDto {
  const _ClientDto({required this.id, required this.nombre, required this.email, required this.telefono, required this.direccion, @JsonKey(name: 'razon_social') required this.razonSocial, required this.nit});
  factory _ClientDto.fromJson(Map<String, dynamic> json) => _$ClientDtoFromJson(json);

@override final  String id;
@override final  String nombre;
@override final  String email;
@override final  String telefono;
@override final  String direccion;
@override@JsonKey(name: 'razon_social') final  String razonSocial;
@override final  String nit;

/// Create a copy of ClientDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientDtoCopyWith<_ClientDto> get copyWith => __$ClientDtoCopyWithImpl<_ClientDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClientDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientDto&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.email, email) || other.email == email)&&(identical(other.telefono, telefono) || other.telefono == telefono)&&(identical(other.direccion, direccion) || other.direccion == direccion)&&(identical(other.razonSocial, razonSocial) || other.razonSocial == razonSocial)&&(identical(other.nit, nit) || other.nit == nit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nombre,email,telefono,direccion,razonSocial,nit);

@override
String toString() {
  return 'ClientDto(id: $id, nombre: $nombre, email: $email, telefono: $telefono, direccion: $direccion, razonSocial: $razonSocial, nit: $nit)';
}


}

/// @nodoc
abstract mixin class _$ClientDtoCopyWith<$Res> implements $ClientDtoCopyWith<$Res> {
  factory _$ClientDtoCopyWith(_ClientDto value, $Res Function(_ClientDto) _then) = __$ClientDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String nombre, String email, String telefono, String direccion,@JsonKey(name: 'razon_social') String razonSocial, String nit
});




}
/// @nodoc
class __$ClientDtoCopyWithImpl<$Res>
    implements _$ClientDtoCopyWith<$Res> {
  __$ClientDtoCopyWithImpl(this._self, this._then);

  final _ClientDto _self;
  final $Res Function(_ClientDto) _then;

/// Create a copy of ClientDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nombre = null,Object? email = null,Object? telefono = null,Object? direccion = null,Object? razonSocial = null,Object? nit = null,}) {
  return _then(_ClientDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,telefono: null == telefono ? _self.telefono : telefono // ignore: cast_nullable_to_non_nullable
as String,direccion: null == direccion ? _self.direccion : direccion // ignore: cast_nullable_to_non_nullable
as String,razonSocial: null == razonSocial ? _self.razonSocial : razonSocial // ignore: cast_nullable_to_non_nullable
as String,nit: null == nit ? _self.nit : nit // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
