import '../../api/api_response.dart';
import '../../dto/session/session_dto.dart';
import '../../dto/user/user_credentials_dto.dart';
import '../../dto/user/user_dto.dart';

abstract interface class AuthDataSourceRemoteInterface {
  Future<ApiResponse<SessionDto>> login(UserCredentialsDto userCredentials);
  Future<ApiResponse<SessionDto>> register(UserDto user);
}
