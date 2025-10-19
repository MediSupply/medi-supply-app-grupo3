import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.g.dart';

enum RoleDto { ADMIN, USER }

@JsonSerializable()
class UserDto {
  final String name;
  final String documentType;
  final int documentNumber;
  final String address;
  final String phone;
  final String email;
  final String password;
  final RoleDto role;
  UserDto({
    required this.name,
    required this.documentType,
    required this.documentNumber,
    required this.address,
    required this.phone,
    required this.email,
    required this.password,
    required this.role,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
