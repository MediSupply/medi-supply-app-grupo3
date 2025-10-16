// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_credentials_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCredentialsDto _$UserCredentialsDtoFromJson(Map<String, dynamic> json) =>
    UserCredentialsDto(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$UserCredentialsDtoToJson(UserCredentialsDto instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};
