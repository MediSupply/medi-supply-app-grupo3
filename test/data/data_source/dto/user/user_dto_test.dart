import 'package:flutter_test/flutter_test.dart';
import 'package:medi_supply_app_grupo3/data/data_source/dto/user/user_dto.dart';

void main() {
  group('UserDto', () {
    test('should create UserDto with required parameters', () {
      // Arrange & Act
      final dto = UserDto(
        name: 'John Doe',
        documentType: 'CC',
        documentNumber: 12345678,
        address: '123 Main St',
        phone: '+1234567890',
        email: 'john@example.com',
        password: 'password123',
        role: RoleDto.USER,
      );

      // Assert
      expect(dto.name, equals('John Doe'));
      expect(dto.documentType, equals('CC'));
      expect(dto.documentNumber, equals(12345678));
      expect(dto.address, equals('123 Main St'));
      expect(dto.phone, equals('+1234567890'));
      expect(dto.email, equals('john@example.com'));
      expect(dto.password, equals('password123'));
      expect(dto.role, equals(RoleDto.USER));
    });

    test('should create UserDto with ADMIN role', () {
      // Arrange & Act
      final dto = UserDto(
        name: 'Admin User',
        documentType: 'CC',
        documentNumber: 87654321,
        address: '456 Admin St',
        phone: '+0987654321',
        email: 'admin@example.com',
        password: 'admin123',
        role: RoleDto.ADMIN,
      );

      // Assert
      expect(dto.name, equals('Admin User'));
      expect(dto.documentType, equals('CC'));
      expect(dto.documentNumber, equals(87654321));
      expect(dto.address, equals('456 Admin St'));
      expect(dto.phone, equals('+0987654321'));
      expect(dto.email, equals('admin@example.com'));
      expect(dto.password, equals('admin123'));
      expect(dto.role, equals(RoleDto.ADMIN));
    });

    test('should create from JSON', () {
      // Arrange
      const json = {
        'name': 'John Doe',
        'documentType': 'CC',
        'documentNumber': 12345678,
        'address': '123 Main St',
        'phone': '+1234567890',
        'email': 'john@example.com',
        'password': 'password123',
        'role': 'USER',
      };

      // Act
      final dto = UserDto.fromJson(json);

      // Assert
      expect(dto.name, equals('John Doe'));
      expect(dto.documentType, equals('CC'));
      expect(dto.documentNumber, equals(12345678));
      expect(dto.address, equals('123 Main St'));
      expect(dto.phone, equals('+1234567890'));
      expect(dto.email, equals('john@example.com'));
      expect(dto.password, equals('password123'));
      expect(dto.role, equals(RoleDto.USER));
    });

    test('should create from JSON with ADMIN role', () {
      // Arrange
      const json = {
        'name': 'Admin User',
        'documentType': 'CC',
        'documentNumber': 87654321,
        'address': '456 Admin St',
        'phone': '+0987654321',
        'email': 'admin@example.com',
        'password': 'admin123',
        'role': 'ADMIN',
      };

      // Act
      final dto = UserDto.fromJson(json);

      // Assert
      expect(dto.name, equals('Admin User'));
      expect(dto.documentType, equals('CC'));
      expect(dto.documentNumber, equals(87654321));
      expect(dto.address, equals('456 Admin St'));
      expect(dto.phone, equals('+0987654321'));
      expect(dto.email, equals('admin@example.com'));
      expect(dto.password, equals('admin123'));
      expect(dto.role, equals(RoleDto.ADMIN));
    });

    test('should convert to JSON', () {
      // Arrange
      final dto = UserDto(
        name: 'John Doe',
        documentType: 'CC',
        documentNumber: 12345678,
        address: '123 Main St',
        phone: '+1234567890',
        email: 'john@example.com',
        password: 'password123',
        role: RoleDto.USER,
      );

      // Act
      final json = dto.toJson();

      // Assert
      expect(json['name'], equals('John Doe'));
      expect(json['documentType'], equals('CC'));
      expect(json['documentNumber'], equals(12345678));
      expect(json['address'], equals('123 Main St'));
      expect(json['phone'], equals('+1234567890'));
      expect(json['email'], equals('john@example.com'));
      expect(json['password'], equals('password123'));
      expect(json['role'], equals('USER'));
    });

    test('should convert to JSON with ADMIN role', () {
      // Arrange
      final dto = UserDto(
        name: 'Admin User',
        documentType: 'CC',
        documentNumber: 87654321,
        address: '456 Admin St',
        phone: '+0987654321',
        email: 'admin@example.com',
        password: 'admin123',
        role: RoleDto.ADMIN,
      );

      // Act
      final json = dto.toJson();

      // Assert
      expect(json['name'], equals('Admin User'));
      expect(json['documentType'], equals('CC'));
      expect(json['documentNumber'], equals(87654321));
      expect(json['address'], equals('456 Admin St'));
      expect(json['phone'], equals('+0987654321'));
      expect(json['email'], equals('admin@example.com'));
      expect(json['password'], equals('admin123'));
      expect(json['role'], equals('ADMIN'));
    });

    test('should handle empty strings', () {
      // Arrange & Act
      final dto = UserDto(
        name: '',
        documentType: '',
        documentNumber: 0,
        address: '',
        phone: '',
        email: '',
        password: '',
        role: RoleDto.USER,
      );

      // Assert
      expect(dto.name, equals(''));
      expect(dto.documentType, equals(''));
      expect(dto.documentNumber, equals(0));
      expect(dto.address, equals(''));
      expect(dto.phone, equals(''));
      expect(dto.email, equals(''));
      expect(dto.password, equals(''));
      expect(dto.role, equals(RoleDto.USER));
    });

    test('should handle special characters', () {
      // Arrange & Act
      final dto = UserDto(
        name: 'José María',
        documentType: 'C.C.',
        documentNumber: 12345678,
        address: 'Calle 123 #45-67',
        phone: '+57 300 123 4567',
        email: 'josé.maría@ejemplo.com',
        password: 'P@ssw0rd!@#\$%^&*()',
        role: RoleDto.USER,
      );

      // Assert
      expect(dto.name, equals('José María'));
      expect(dto.documentType, equals('C.C.'));
      expect(dto.documentNumber, equals(12345678));
      expect(dto.address, equals('Calle 123 #45-67'));
      expect(dto.phone, equals('+57 300 123 4567'));
      expect(dto.email, equals('josé.maría@ejemplo.com'));
      expect(dto.password, equals('P@ssw0rd!@#\$%^&*()'));
      expect(dto.role, equals(RoleDto.USER));
    });

    test('should handle large numbers', () {
      // Arrange & Act
      final dto = UserDto(
        name: 'Test User',
        documentType: 'CC',
        documentNumber: 999999999,
        address: 'Test Address',
        phone: '+1234567890',
        email: 'test@example.com',
        password: 'password123',
        role: RoleDto.USER,
      );

      // Assert
      expect(dto.documentNumber, equals(999999999));
    });

    test('should handle JSON with empty values', () {
      // Arrange
      const json = {
        'name': '',
        'documentType': '',
        'documentNumber': 0,
        'address': '',
        'phone': '',
        'email': '',
        'password': '',
        'role': 'USER',
      };

      // Act
      final dto = UserDto.fromJson(json);

      // Assert
      expect(dto.name, equals(''));
      expect(dto.documentType, equals(''));
      expect(dto.documentNumber, equals(0));
      expect(dto.address, equals(''));
      expect(dto.phone, equals(''));
      expect(dto.email, equals(''));
      expect(dto.password, equals(''));
      expect(dto.role, equals(RoleDto.USER));
    });

    group('RoleDto enum', () {
      test('should have ADMIN and USER values', () {
        // Assert
        expect(RoleDto.values, contains(RoleDto.ADMIN));
        expect(RoleDto.values, contains(RoleDto.USER));
        expect(RoleDto.values.length, equals(2));
      });

      test('should serialize ADMIN role correctly', () {
        // Arrange
        final dto = UserDto(
          name: 'Admin',
          documentType: 'CC',
          documentNumber: 12345678,
          address: 'Address',
          phone: '+1234567890',
          email: 'admin@example.com',
          password: 'password',
          role: RoleDto.ADMIN,
        );

        // Act
        final json = dto.toJson();

        // Assert
        expect(json['role'], equals('ADMIN'));
      });

      test('should serialize USER role correctly', () {
        // Arrange
        final dto = UserDto(
          name: 'User',
          documentType: 'CC',
          documentNumber: 12345678,
          address: 'Address',
          phone: '+1234567890',
          email: 'user@example.com',
          password: 'password',
          role: RoleDto.USER,
        );

        // Act
        final json = dto.toJson();

        // Assert
        expect(json['role'], equals('USER'));
      });

      test('should deserialize ADMIN role correctly', () {
        // Arrange
        const json = {
          'name': 'Admin',
          'documentType': 'CC',
          'documentNumber': 12345678,
          'address': 'Address',
          'phone': '+1234567890',
          'email': 'admin@example.com',
          'password': 'password',
          'role': 'ADMIN',
        };

        // Act
        final dto = UserDto.fromJson(json);

        // Assert
        expect(dto.role, equals(RoleDto.ADMIN));
      });

      test('should deserialize USER role correctly', () {
        // Arrange
        const json = {
          'name': 'User',
          'documentType': 'CC',
          'documentNumber': 12345678,
          'address': 'Address',
          'phone': '+1234567890',
          'email': 'user@example.com',
          'password': 'password',
          'role': 'USER',
        };

        // Act
        final dto = UserDto.fromJson(json);

        // Assert
        expect(dto.role, equals(RoleDto.USER));
      });
    });
  });
}
