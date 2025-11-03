// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClientDto _$ClientDtoFromJson(Map<String, dynamic> json) => _ClientDto(
  id: json['id'] as String,
  nombre: json['nombre'] as String,
  email: json['email'] as String,
  telefono: json['telefono'] as String,
  direccion: json['direccion'] as String,
  razonSocial: json['razon_social'] as String,
  nit: json['nit'] as String,
);

Map<String, dynamic> _$ClientDtoToJson(_ClientDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
      'email': instance.email,
      'telefono': instance.telefono,
      'direccion': instance.direccion,
      'razon_social': instance.razonSocial,
      'nit': instance.nit,
    };
