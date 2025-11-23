import '../../data_source/dto/user/user_dto.dart';
import '../entity/user/user.dart';

extension UserDtoToEntityMapper on UserDto {
  User toEntity() {
    return User(
      name: name,
      documentType: documentType,
      documentNumber: documentNumber,
      address: address,
      phone: phone,
      email: email,
      password: password,
      role: role.toEntity(),
    );
  }
}

extension UserEntityToDtoMapper on User {
  UserDto toDto() {
    return UserDto(
      name: name,
      documentType: documentType,
      documentNumber: documentNumber,
      address: address,
      phone: phone,
      email: email,
      password: password,
      role: role.toDto(),
    );
  }
}

extension UserRoleDtoToEntityMapper on RoleDto {
  Role toEntity() {
    return switch (this) {
      RoleDto.admin => Role.admin,
      RoleDto.user => Role.user,
    };
  }
}

extension UserRoleEntityToDtoMapper on Role {
  RoleDto toDto() {
    return switch (this) {
      Role.admin => RoleDto.admin,
      Role.user => RoleDto.user,
    };
  }
}
