import 'package:dio/dio.dart';
import 'package:medi_supply_app_grupo3/data/data_source/dto/user/user_credentials_dto.dart';
import 'package:retrofit/retrofit.dart';

import '../../data_source/dto/session/session_dto.dart';
import '../../data_source/dto/user/user_dto.dart';

part 'auth_service.g.dart';

@RestApi()
abstract interface class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST('/auth/login')
  Future<SessionDto> login({
    @Body() required UserCredentialsDto userCredentials,
  });

  @POST('/auth/signup')
  Future<SessionDto> register({@Body() required UserDto user});
}
