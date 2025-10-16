import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../application/networking/networking.dart';
import '../../../data/data_source/remote/auth/auth_data_source_remote.dart';
import '../../../data/repository/entity/session/session.dart';
import '../../../data/repository/entity/user/user_credentials.dart';
import '../../../data/repository/remote/auth/auth_repository_remote.dart';
import '../../../data/repository/remote/auth/auth_repository_remote_interface.dart';
import 'state/login_state.dart';

final NotifierProvider<LoginViewModel, LoginState> loginViewModelProvider =
    NotifierProvider<LoginViewModel, LoginState>(() => LoginViewModel());

class LoginViewModel extends Notifier<LoginState> {
  late AuthRepositoryRemoteInterface _authRepositoryRemote;

  @override
  LoginState build() {
    _authRepositoryRemote = AuthRepositoryRemote(
      AuthDataSourceRemote(Networking.instance.dio),
    );
    return LoginState();
  }

  void setEmail(String email) {
    final UserCredentials userCredentials = UserCredentials(
      email: email,
      password: state.userCredentials.password,
    );
    state = state.copyWith(userCredentials: userCredentials);
  }

  void setPassword(String password) {
    final UserCredentials userCredentials = UserCredentials(
      email: state.userCredentials.email,
      password: password,
    );
    state = state.copyWith(userCredentials: userCredentials);
  }

  Future<bool> login() async {
    state = state.copyWith(isLoading: true);
    final AsyncValue<Session> session = await AsyncValue.guard(
      () => _authRepositoryRemote.login(state.userCredentials),
    );
    session.when(
      data: (session) =>
          state = state.copyWith(isLoading: false, session: session),
      error: (error, stackTrace) => state = state.copyWith(isLoading: false),
      loading: () => state = state.copyWith(isLoading: true),
    );

    return !session.hasError;
  }

  String? validateUserEmail() {
    return state.userCredentials.validateEmail();
  }

  String? validateUserPassword() {
    return state.userCredentials.validatePassword();
  }
}
