import 'package:flutter_test/flutter_test.dart';
import 'package:medi_supply_app_grupo3/data/data_source/dto/client/client_dto.dart';

void main() {
  group('ClientDto', () {
    test('should create ClientDto with required parameters', () {
      // Arrange & Act
      final dto = ClientDto(
        id: 'client-123',
        nombre: 'John Doe',
        email: 'john@example.com',
        telefono: '+1234567890',
        direccion: '123 Main St',
        razonSocial: 'Empresa S.A.S.',
        nit: '1234567890',
      );

      // Assert
      expect(dto.id, equals('client-123'));
      expect(dto.nombre, equals('John Doe'));
      expect(dto.email, equals('john@example.com'));
      expect(dto.telefono, equals('+1234567890'));
      expect(dto.direccion, equals('123 Main St'));
      expect(dto.razonSocial, equals('Empresa S.A.S.'));
      expect(dto.nit, equals('1234567890'));
    });

    test('should create ClientDto with empty values', () {
      // Arrange & Act
      final dto = ClientDto(
        id: '',
        nombre: '',
        email: '',
        telefono: '',
        direccion: '',
        razonSocial: '',
        nit: '',
      );

      // Assert
      expect(dto.id, equals(''));
      expect(dto.nombre, equals(''));
      expect(dto.email, equals(''));
      expect(dto.telefono, equals(''));
      expect(dto.direccion, equals(''));
      expect(dto.razonSocial, equals(''));
      expect(dto.nit, equals(''));
    });

    test('should create from JSON', () {
      // Arrange
      final json = {
        'id': 'client-123',
        'nombre': 'John Doe',
        'email': 'john@example.com',
        'telefono': '+1234567890',
        'direccion': '123 Main St',
        'razon_social': 'Empresa S.A.S.',
        'nit': '1234567890',
      };

      // Act
      final dto = ClientDto.fromJson(json);

      // Assert
      expect(dto.id, equals('client-123'));
      expect(dto.nombre, equals('John Doe'));
      expect(dto.email, equals('john@example.com'));
      expect(dto.telefono, equals('+1234567890'));
      expect(dto.direccion, equals('123 Main St'));
      expect(dto.razonSocial, equals('Empresa S.A.S.'));
      expect(dto.nit, equals('1234567890'));
    });

    test('should create from JSON with empty values', () {
      // Arrange
      final json = {
        'id': '',
        'nombre': '',
        'email': '',
        'telefono': '',
        'direccion': '',
        'razon_social': '',
        'nit': '',
      };

      // Act
      final dto = ClientDto.fromJson(json);

      // Assert
      expect(dto.id, equals(''));
      expect(dto.nombre, equals(''));
      expect(dto.email, equals(''));
      expect(dto.telefono, equals(''));
      expect(dto.direccion, equals(''));
      expect(dto.razonSocial, equals(''));
      expect(dto.nit, equals(''));
    });

    test('should convert to JSON', () {
      // Arrange
      final dto = ClientDto(
        id: 'client-123',
        nombre: 'John Doe',
        email: 'john@example.com',
        telefono: '+1234567890',
        direccion: '123 Main St',
        razonSocial: 'Empresa S.A.S.',
        nit: '1234567890',
      );

      // Act
      final json = dto.toJson();

      // Assert
      expect(json['id'], equals('client-123'));
      expect(json['nombre'], equals('John Doe'));
      expect(json['email'], equals('john@example.com'));
      expect(json['telefono'], equals('+1234567890'));
      expect(json['direccion'], equals('123 Main St'));
      expect(json['razon_social'], equals('Empresa S.A.S.'));
      expect(json['nit'], equals('1234567890'));
    });

    test('should handle special characters in JSON', () {
      // Arrange
      final dto = ClientDto(
        id: 'client-123',
        nombre: 'José María',
        email: 'josé@example.com',
        telefono: '+57 300 123 4567',
        direccion: 'Calle 123 #45-67',
        razonSocial: 'Empresa & Asociados S.A.S.',
        nit: '1234567890',
      );

      // Act
      final json = dto.toJson();
      final fromJson = ClientDto.fromJson(json);

      // Assert
      expect(fromJson.nombre, equals('José María'));
      expect(fromJson.email, equals('josé@example.com'));
      expect(fromJson.telefono, equals('+57 300 123 4567'));
      expect(fromJson.direccion, equals('Calle 123 #45-67'));
      expect(fromJson.razonSocial, equals('Empresa & Asociados S.A.S.'));
    });

    test('should handle JSON with razon_social key mapping', () {
      // Arrange
      final json = {
        'id': 'client-123',
        'nombre': 'Test Client',
        'email': 'test@example.com',
        'telefono': '1234567890',
        'direccion': 'Test Address',
        'razon_social': 'Test Company',
        'nit': '9876543210',
      };

      // Act
      final dto = ClientDto.fromJson(json);

      // Assert
      expect(dto.razonSocial, equals('Test Company'));
    });

    test('should maintain data integrity in round-trip conversion', () {
      // Arrange
      final originalDto = ClientDto(
        id: 'client-123',
        nombre: 'John Doe',
        email: 'john@example.com',
        telefono: '+1234567890',
        direccion: '123 Main St',
        razonSocial: 'Empresa S.A.S.',
        nit: '1234567890',
      );

      // Act
      final json = originalDto.toJson();
      final convertedDto = ClientDto.fromJson(json);

      // Assert
      expect(convertedDto.id, equals(originalDto.id));
      expect(convertedDto.nombre, equals(originalDto.nombre));
      expect(convertedDto.email, equals(originalDto.email));
      expect(convertedDto.telefono, equals(originalDto.telefono));
      expect(convertedDto.direccion, equals(originalDto.direccion));
      expect(convertedDto.razonSocial, equals(originalDto.razonSocial));
      expect(convertedDto.nit, equals(originalDto.nit));
    });
  });
}
