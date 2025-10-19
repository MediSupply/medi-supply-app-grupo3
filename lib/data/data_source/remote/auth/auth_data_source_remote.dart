import 'package:dio/dio.dart';
import 'package:medi_supply_app_grupo3/data/data_source/api/api_response.dart';
import 'package:medi_supply_app_grupo3/data/data_source/dto/session/session_dto.dart';

import '../../../services/auth/auth_service.dart';
import '../../api/mixin/api_response_handler_mixin.dart';
import '../../dto/user/user_credentials_dto.dart';
import '../../dto/user/user_dto.dart';
import 'auth_data_source_remote_interface.dart';

class AuthDataSourceRemote
    with ApiResponseHandlerMixin
    implements AuthDataSourceRemoteInterface {
  final AuthService _authService;

  AuthDataSourceRemote(Dio dio) : _authService = AuthService(dio);

  @override
  Future<ApiResponse<SessionDto>> login(UserCredentialsDto userCredentials) {
    return handleApiCall<SessionDto>(
      _authService.login(userCredentials: userCredentials),
    );
  }

  @override
  Future<ApiResponse<SessionDto>> register(UserDto user) async {
    return handleApiCall<SessionDto>(_authService.register(user: user));
  }
}
