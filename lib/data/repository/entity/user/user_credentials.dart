import 'package:equatable/equatable.dart';

class UserCredentials extends Equatable {
  const UserCredentials({this.email = '', this.password = ''});

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];

  String? validateEmail() {
    if (email.isEmpty) {
      return 'El correo electrónico es requerido';
    }
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(email)) {
      return 'El correo electrónico no es válido';
    }
    return null;
  }

  String? validatePassword() {
    if (password.isEmpty) {
      return 'La contraseña es requerida';
    }
    return null;
  }
}
