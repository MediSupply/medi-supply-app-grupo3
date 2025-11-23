import 'package:flutter_test/flutter_test.dart';
import 'package:medi_supply_app_grupo3/data/repository/entity/user/user.dart';

void main() {
  group('User', () {
    test('should create User with default values', () {
      // Arrange & Act
      const user = User();

      // Assert
      expect(user.name, equals(''));
      expect(user.documentType, equals(''));
      expect(user.documentNumber, equals(0));
      expect(user.address, equals(''));
      expect(user.phone, equals(''));
      expect(user.email, equals(''));
      expect(user.password, equals(''));
      expect(user.role, equals(Role.admin));
    });

    test('should create User with custom values', () {
      // Arrange & Act
      const user = User(
        name: 'John Doe',
        documentType: 'CC',
        documentNumber: 12345678,
        address: '123 Main St',
        phone: '+1234567890',
        email: 'john@example.com',
        password: 'password123',
        role: Role.user,
      );

      // Assert
      expect(user.name, equals('John Doe'));
      expect(user.documentType, equals('CC'));
      expect(user.documentNumber, equals(12345678));
      expect(user.address, equals('123 Main St'));
      expect(user.phone, equals('+1234567890'));
      expect(user.email, equals('john@example.com'));
      expect(user.password, equals('password123'));
      expect(user.role, equals(Role.user));
    });

    test('should be equal when properties are the same', () {
      // Arrange & Act
      const user1 = User(
        name: 'John Doe',
        documentType: 'CC',
        documentNumber: 12345678,
        address: '123 Main St',
        phone: '+1234567890',
        email: 'john@example.com',
        password: 'password123',
        role: Role.user,
      );
      const user2 = User(
        name: 'John Doe',
        documentType: 'CC',
        documentNumber: 12345678,
        address: '123 Main St',
        phone: '+1234567890',
        email: 'john@example.com',
        password: 'password123',
        role: Role.user,
      );

      // Assert
      expect(user1, equals(user2));
    });

    test('should not be equal when properties are different', () {
      // Arrange & Act
      const user1 = User(
        name: 'John Doe',
        documentType: 'CC',
        documentNumber: 12345678,
        address: '123 Main St',
        phone: '+1234567890',
        email: 'john@example.com',
        password: 'password123',
        role: Role.user,
      );
      const user2 = User(
        name: 'Jane Doe',
        documentType: 'CC',
        documentNumber: 12345678,
        address: '123 Main St',
        phone: '+1234567890',
        email: 'john@example.com',
        password: 'password123',
        role: Role.user,
      );

      // Assert
      expect(user1, isNot(equals(user2)));
    });

    group('validateName', () {
      test('should return error message when name is empty', () {
        // Arrange
        const user = User(name: '');

        // Act
        final result = user.validateName();

        // Assert
        expect(result, equals('El nombre o razón social es requerido'));
      });

      test('should return null when name is not empty', () {
        // Arrange
        const user = User(name: 'John Doe');

        // Act
        final result = user.validateName();

        // Assert
        expect(result, isNull);
      });

      test('should return null for company name', () {
        // Arrange
        const user = User(name: 'Empresa S.A.S.');

        // Act
        final result = user.validateName();

        // Assert
        expect(result, isNull);
      });
    });

    group('validateDocumentType', () {
      test('should return error message when documentType is empty', () {
        // Arrange
        const user = User(documentType: '');

        // Act
        final result = user.validateDocumentType();

        // Assert
        expect(result, equals('El tipo de documento es requerido'));
      });

      test('should return null when documentType is not empty', () {
        // Arrange
        const user = User(documentType: 'CC');

        // Act
        final result = user.validateDocumentType();

        // Assert
        expect(result, isNull);
      });

      test('should return null for various document types', () {
        // Arrange
        final documentTypes = ['CC', 'CE', 'TI', 'RC', 'NIT'];

        for (final docType in documentTypes) {
          final user = User(documentType: docType);

          // Act
          final result = user.validateDocumentType();

          // Assert
          expect(
            result,
            isNull,
            reason: 'Document type $docType should be valid',
          );
        }
      });
    });

    group('validateDocumentNumber', () {
      test('should return error message when documentNumber is zero', () {
        // Arrange
        const user = User(documentNumber: 0);

        // Act
        final result = user.validateDocumentNumber();

        // Assert
        expect(
          result,
          equals('El número de documento es requerido y debe ser mayor a 0'),
        );
      });

      test('should return error message when documentNumber is negative', () {
        // Arrange
        const user = User(documentNumber: -1);

        // Act
        final result = user.validateDocumentNumber();

        // Assert
        expect(
          result,
          equals('El número de documento es requerido y debe ser mayor a 0'),
        );
      });

      test('should return null when documentNumber is positive', () {
        // Arrange
        const user = User(documentNumber: 12345678);

        // Act
        final result = user.validateDocumentNumber();

        // Assert
        expect(result, isNull);
      });

      test('should return null for various valid document numbers', () {
        // Arrange
        final documentNumbers = [1, 12345678, 999999999];

        for (final docNumber in documentNumbers) {
          final user = User(documentNumber: docNumber);

          // Act
          final result = user.validateDocumentNumber();

          // Assert
          expect(
            result,
            isNull,
            reason: 'Document number $docNumber should be valid',
          );
        }
      });
    });

    group('validateAddress', () {
      test('should return error message when address is empty', () {
        // Arrange
        const user = User(address: '');

        // Act
        final result = user.validateAddress();

        // Assert
        expect(result, equals('La dirección es requerida'));
      });

      test('should return null when address is not empty', () {
        // Arrange
        const user = User(address: '123 Main St');

        // Act
        final result = user.validateAddress();

        // Assert
        expect(result, isNull);
      });

      test('should return null for various valid addresses', () {
        // Arrange
        final addresses = [
          '123 Main St',
          'Calle 123 #45-67',
          'Avenida Siempre Viva 123',
          'Carrera 7 #32-10',
        ];

        for (final address in addresses) {
          final user = User(address: address);

          // Act
          final result = user.validateAddress();

          // Assert
          expect(result, isNull, reason: 'Address $address should be valid');
        }
      });
    });

    group('validatePhone', () {
      test('should return error message when phone is empty', () {
        // Arrange
        const user = User(phone: '');

        // Act
        final result = user.validatePhone();

        // Assert
        expect(result, equals('El teléfono es requerido'));
      });

      test('should return error message when phone format is invalid', () {
        // Arrange
        const user = User(phone: 'invalid-phone');

        // Act
        final result = user.validatePhone();

        // Assert
        expect(result, equals('El teléfono no es válido'));
      });

      test('should return null when phone format is valid', () {
        // Arrange
        const user = User(phone: '+1234567890');

        // Act
        final result = user.validatePhone();

        // Assert
        expect(result, isNull);
      });

      test('should return null for various valid phone formats', () {
        // Arrange
        final validPhones = [
          '1234567890',
          '+1234567890',
          '+573001234567',
          '3001234567',
          '1234567',
          '123456789012345',
        ];

        for (final phone in validPhones) {
          final user = User(phone: phone);

          // Act
          final result = user.validatePhone();

          // Assert
          expect(result, isNull, reason: 'Phone $phone should be valid');
        }
      });

      test('should return error for invalid phone formats', () {
        // Arrange
        final invalidPhones = [
          '123456', // Too short
          '1234567890123456', // Too long
          'abc1234567', // Contains letters
          '123-456-7890', // Contains dashes
          '123.456.7890', // Contains dots
          '123 456 7890', // Contains spaces
        ];

        for (final phone in invalidPhones) {
          final user = User(phone: phone);

          // Act
          final result = user.validatePhone();

          // Assert
          expect(
            result,
            equals('El teléfono no es válido'),
            reason: 'Phone $phone should be invalid',
          );
        }
      });
    });

    group('validateEmail', () {
      test('should return error message when email is empty', () {
        // Arrange
        const user = User(email: '');

        // Act
        final result = user.validateEmail();

        // Assert
        expect(result, equals('El correo electrónico es requerido'));
      });

      test('should return error message when email format is invalid', () {
        // Arrange
        const user = User(email: 'invalid-email');

        // Act
        final result = user.validateEmail();

        // Assert
        expect(result, equals('El correo electrónico no es válido'));
      });

      test('should return null when email format is valid', () {
        // Arrange
        const user = User(email: 'test@example.com');

        // Act
        final result = user.validateEmail();

        // Assert
        expect(result, isNull);
      });

      test('should return null for various valid email formats', () {
        // Arrange
        final validEmails = [
          'user@domain.com',
          'user.name@domain.co.uk',
          'user+tag@domain.org',
          'user123@domain123.net',
          'test.email+tag@example.com',
        ];

        for (final email in validEmails) {
          final user = User(email: email);

          // Act
          final result = user.validateEmail();

          // Assert
          expect(result, isNull, reason: 'Email $email should be valid');
        }
      });

      test('should return error for invalid email formats', () {
        // Arrange
        final invalidEmails = [
          'plainaddress',
          '@domain.com',
          'user@',
          'user@domain',
        ];

        for (final email in invalidEmails) {
          final user = User(email: email);

          // Act
          final result = user.validateEmail();

          // Assert
          expect(
            result,
            equals('El correo electrónico no es válido'),
            reason: 'Email $email should be invalid',
          );
        }
      });
    });

    group('validatePassword', () {
      test('should return error message when password is empty', () {
        // Arrange
        const user = User(password: '');

        // Act
        final result = user.validatePassword();

        // Assert
        expect(result, equals('La contraseña es requerida'));
      });

      test('should return null when password is not empty', () {
        // Arrange
        const user = User(password: 'password123');

        // Act
        final result = user.validatePassword();

        // Assert
        expect(result, isNull);
      });

      test('should return null for various valid passwords', () {
        // Arrange
        final validPasswords = [
          'password123',
          'P@ssw0rd!',
          '12345678',
          'verylongpassword',
          'P@ssw0rd!@#\$%^&*()',
        ];

        for (final password in validPasswords) {
          final user = User(password: password);

          // Act
          final result = user.validatePassword();

          // Assert
          expect(result, isNull, reason: 'Password should be valid');
        }
      });
    });

    group('Role enum', () {
      test('should have ADMIN and USER values', () {
        // Assert
        expect(Role.values, contains(Role.admin));
        expect(Role.values, contains(Role.user));
        expect(Role.values.length, equals(2));
      });

      test('should create user with ADMIN role', () {
        // Arrange & Act
        const user = User(role: Role.admin);

        // Assert
        expect(user.role, equals(Role.admin));
      });

      test('should create user with USER role', () {
        // Arrange & Act
        const user = User(role: Role.user);

        // Assert
        expect(user.role, equals(Role.user));
      });
    });
  });
}
