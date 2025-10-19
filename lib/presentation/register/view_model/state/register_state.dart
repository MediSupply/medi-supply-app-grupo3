import '../../../../data/repository/entity/session/session.dart';
import '../../../../data/repository/entity/user/user.dart';

class RegisterState {
  final User user;
  final Session? session;
  final bool isLoading;

  const RegisterState({
    this.user = const User(),
    this.session,
    this.isLoading = false,
  });

  RegisterState copyWith({
    User? user,
    Session? session,
    bool? isLoading,
  }) {
    return RegisterState(
      user: user ?? this.user,
      session: session ?? this.session,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}