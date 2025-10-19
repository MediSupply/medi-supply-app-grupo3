import '../../data_source/dto/user/user_dto.dart';
import '../../data_source/dto/user/user_credentials_dto.dart';
import '../entity/user/user.dart';
import '../entity/user/user_credentials.dart';

extension UserDtoToEntityMapper on UserDto {
  User toEntity() {
    return User(
      name: name ?? '',
      documentType: documentType ?? '',
      documentNumber: documentNumber is int
          ? documentNumber as int
          : int.tryParse('${documentNumber ?? 0}') ?? 0,
      address: address ?? '',
      phone: phone ?? '',
      email: email ?? '',
      password: password ?? '',
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
    );
  }
}


