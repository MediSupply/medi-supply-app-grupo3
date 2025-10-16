import '../../../../data/repository/entity/session/session.dart';
import '../../../../data/repository/entity/user/user_credentials.dart';

class LoginState {
  final UserCredentials userCredentials;
  final Session? session;
  final bool isLoading;
  const LoginState({
    this.userCredentials = const UserCredentials(),
    this.session,
    this.isLoading = false,
  });

  LoginState copyWith({
    UserCredentials? userCredentials,
    Session? session,
    bool? isLoading,
  }) {
    return LoginState(
      userCredentials: userCredentials ?? this.userCredentials,
      session: session ?? this.session,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
