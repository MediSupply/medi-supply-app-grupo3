// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionDto _$SessionDtoFromJson(Map<String, dynamic> json) => _SessionDto(
  id: json['id'] as String,
  token: json['token'] as String,
  expiresAt: json['expires_at'] as String,
  userId: json['user_id'] as String,
);

Map<String, dynamic> _$SessionDtoToJson(_SessionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'token': instance.token,
      'expires_at': instance.expiresAt,
      'user_id': instance.userId,
    };
