import '../../entity/session/session.dart';
import '../../entity/user/user_credentials.dart';

abstract interface class AuthRepositoryRemoteInterface {
  Future<Session> login(UserCredentials userCredentials);
  Future<Session> register(Map<String, dynamic> user);
}
