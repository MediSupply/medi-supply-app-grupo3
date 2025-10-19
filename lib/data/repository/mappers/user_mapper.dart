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
      RoleDto.ADMIN => Role.ADMIN,
      RoleDto.USER => Role.USER,
    };
  }
}

extension UserRoleEntityToDtoMapper on Role {
  RoleDto toDto() {
    return switch (this) {
      Role.ADMIN => RoleDto.ADMIN,
      Role.USER => RoleDto.USER,
    };
  }
}
