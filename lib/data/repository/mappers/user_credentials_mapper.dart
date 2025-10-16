import '../../data_source/dto/user/user_credentials_dto.dart';
import '../entity/user/user_credentials.dart';

extension UserCredentialsDtoMapper on UserCredentialsDto {
  UserCredentials toEntity() {
    return UserCredentials(email: email, password: password);
  }
}

extension UserCredentialsEntityMapper on UserCredentials {
  UserCredentialsDto toDto() {
    return UserCredentialsDto(email: email, password: password);
  }
}
