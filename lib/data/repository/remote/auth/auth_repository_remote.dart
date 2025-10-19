import '../../../data_source/api/api_response.dart';
import '../../../data_source/dto/session/session_dto.dart';
import '../../../data_source/remote/auth/auth_data_source_remote_interface.dart';
import '../../entity/session/session.dart';
import '../../entity/user/user.dart';
import '../../entity/user/user_credentials.dart';
import '../../mappers/session_mapper.dart';
import '../../mappers/user_credentials_mapper.dart';
import '../../mappers/user_mapper.dart';
import 'auth_repository_remote_interface.dart';

class AuthRepositoryRemote implements AuthRepositoryRemoteInterface {
  final AuthDataSourceRemoteInterface _authDataSourceRemote;

  AuthRepositoryRemote(this._authDataSourceRemote);

  @override
  Future<Session> login(UserCredentials userCredentials) async {
    final ApiResponse<SessionDto> response = await _authDataSourceRemote.login(
      userCredentials.toDto(),
    );

    return response.when(
      onSuccess: (data) => data.toEntity(),
      onFailure: (error, statusCode, data) => throw Exception(error),
    );
  }

  @override
  Future<Session> register(User user) async {
    final ApiResponse<SessionDto> response = await _authDataSourceRemote
        .register(user.toDto());

    return response.when(
      onSuccess: (data) => data.toEntity(),
      onFailure: (error, statusCode, data) => throw Exception(error),
    );
  }
}
