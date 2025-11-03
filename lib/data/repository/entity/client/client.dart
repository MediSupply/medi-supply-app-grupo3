import 'package:equatable/equatable.dart';

class Client extends Equatable {
  final String id;
  final String nombre;
  final String email;
  final String telefono;
  final String direccion;
  final String razonSocial;
  final String nit;

  const Client({
    this.id = '',
    this.nombre = '',
    this.email = '',
    this.telefono = '',
    this.direccion = '',
    this.razonSocial = '',
    this.nit = '',
  });

  @override
  List<Object?> get props => [
    id,
    nombre,
    email,
    telefono,
    direccion,
    razonSocial,
    nit,
  ];

  String? validateNombre() {
    if (nombre.isEmpty) return 'El nombre es requerido';
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

  String? validatePhone() {
    if (telefono.isEmpty) return 'El teléfono es requerido';
    final phoneRegex = RegExp(r'^\+?[0-9]{7,15}$');
    if (!phoneRegex.hasMatch(telefono)) return 'El teléfono no es válido';
    return null;
  }

  String? validateDireccion() {
    if (direccion.isEmpty) return 'La dirección es requerida';
    return null;
  }

  String? validateRazonSocial() {
    if (razonSocial.isEmpty) return 'La razón social es requerida';
    return null;
  }

  String? validateNit() {
    if (nit.isEmpty) return 'El NIT es requerido';
    final nitRegex = RegExp(r'^[0-9]{10}$');
    if (!nitRegex.hasMatch(nit)) return 'El NIT no es válido';
    return null;
  }
}
