// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
  name: json['name'] as String,
  documentType: json['documentType'] as String,
  documentNumber: (json['documentNumber'] as num).toInt(),
  address: json['address'] as String,
  phone: json['phone'] as String,
  email: json['email'] as String,
  password: json['password'] as String,
  role: $enumDecode(_$RoleDtoEnumMap, json['role']),
);

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
  'name': instance.name,
  'documentType': instance.documentType,
  'documentNumber': instance.documentNumber,
  'address': instance.address,
  'phone': instance.phone,
  'email': instance.email,
  'password': instance.password,
  'role': _$RoleDtoEnumMap[instance.role]!,
};

const _$RoleDtoEnumMap = {RoleDto.admin: 'admin', RoleDto.user: 'user'};
