import 'package:equatable/equatable.dart';

enum Role { ADMIN, USER }

class User extends Equatable {
  const User({
    this.name = '',
    this.documentType = '',
    this.documentNumber = 0,
    this.address = '',
    this.phone = '',
    this.email = '',
    this.password = '',
    this.role = Role.ADMIN,
  });

  // nombres y apellidos o razón social
  final String name;

  // tipo de documento
  final String documentType;

  // número de documento
  final int documentNumber;

  // dirección
  final String address;

  // teléfono
  final String phone;

  // correo
  final String email;

  // CONTRASEÑA
  final String password;

  // rol
  final Role role;

  @override
  List<Object?> get props => [
    name,
    documentType,
    documentNumber,
    address,
    phone,
    email,
    password,
  ];

  String? validateName() {
    if (name.isEmpty) return 'El nombre o razón social es requerido';
    return null;
  }

  String? validateDocumentType() {
    if (documentType.isEmpty) return 'El tipo de documento es requerido';
    return null;
  }

  String? validateDocumentNumber() {
    if (documentNumber <= 0) {
      return 'El número de documento es requerido y debe ser mayor a 0';
    }
    return null;
  }

  String? validateAddress() {
    if (address.isEmpty) return 'La dirección es requerida';
    return null;
  }

  String? validatePhone() {
    if (phone.isEmpty) return 'El teléfono es requerido';
    final phoneRegex = RegExp(r'^\+?[0-9]{7,15}$');
    if (!phoneRegex.hasMatch(phone)) return 'El teléfono no es válido';
    return null;
  }

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
