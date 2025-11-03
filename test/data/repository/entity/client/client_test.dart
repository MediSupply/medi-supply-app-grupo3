import 'package:flutter_test/flutter_test.dart';
import 'package:medi_supply_app_grupo3/data/repository/entity/client/client.dart';

void main() {
  group('Client', () {
    test('should create Client with default values', () {
      // Arrange & Act
      const client = Client();

      // Assert
      expect(client.id, equals(''));
      expect(client.nombre, equals(''));
      expect(client.email, equals(''));
      expect(client.telefono, equals(''));
      expect(client.direccion, equals(''));
      expect(client.razonSocial, equals(''));
      expect(client.nit, equals(''));
    });

    test('should create Client with custom values', () {
      // Arrange & Act
      const client = Client(
        id: 'client-123',
        nombre: 'John Doe',
        email: 'john@example.com',
        telefono: '+1234567890',
        direccion: '123 Main St',
        razonSocial: 'Empresa S.A.S.',
        nit: '1234567890',
      );

      // Assert
      expect(client.id, equals('client-123'));
      expect(client.nombre, equals('John Doe'));
      expect(client.email, equals('john@example.com'));
      expect(client.telefono, equals('+1234567890'));
      expect(client.direccion, equals('123 Main St'));
      expect(client.razonSocial, equals('Empresa S.A.S.'));
      expect(client.nit, equals('1234567890'));
    });

    test('should be equal when properties are the same', () {
      // Arrange & Act
      const client1 = Client(
        id: 'client-123',
        nombre: 'John Doe',
        email: 'john@example.com',
        telefono: '+1234567890',
        direccion: '123 Main St',
        razonSocial: 'Empresa S.A.S.',
        nit: '1234567890',
      );
      const client2 = Client(
        id: 'client-123',
        nombre: 'John Doe',
        email: 'john@example.com',
        telefono: '+1234567890',
        direccion: '123 Main St',
        razonSocial: 'Empresa S.A.S.',
        nit: '1234567890',
      );

      // Assert
      expect(client1, equals(client2));
    });

    test('should not be equal when properties are different', () {
      // Arrange & Act
      const client1 = Client(
        id: 'client-123',
        nombre: 'John Doe',
        email: 'john@example.com',
        telefono: '+1234567890',
        direccion: '123 Main St',
        razonSocial: 'Empresa S.A.S.',
        nit: '1234567890',
      );
      const client2 = Client(
        id: 'client-456',
        nombre: 'Jane Doe',
        email: 'jane@example.com',
        telefono: '+0987654321',
        direccion: '456 Other St',
        razonSocial: 'Another Company',
        nit: '9876543210',
      );

      // Assert
      expect(client1, isNot(equals(client2)));
    });

    group('validateNombre', () {
      test('should return error message when nombre is empty', () {
        // Arrange
        const client = Client(nombre: '');

        // Act
        final result = client.validateNombre();

        // Assert
        expect(result, equals('El nombre es requerido'));
      });

      test('should return null when nombre is not empty', () {
        // Arrange
        const client = Client(nombre: 'John Doe');

        // Act
        final result = client.validateNombre();

        // Assert
        expect(result, isNull);
      });

      test('should return null for company name', () {
        // Arrange
        const client = Client(nombre: 'Empresa S.A.S.');

        // Act
        final result = client.validateNombre();

        // Assert
        expect(result, isNull);
      });
    });

    group('validateEmail', () {
      test('should return error message when email is empty', () {
        // Arrange
        const client = Client(email: '');

        // Act
        final result = client.validateEmail();

        // Assert
        expect(result, equals('El correo electrónico es requerido'));
      });

      test('should return error message when email format is invalid', () {
        // Arrange
        const client = Client(email: 'invalid-email');

        // Act
        final result = client.validateEmail();

        // Assert
        expect(result, equals('El correo electrónico no es válido'));
      });

      test('should return null when email format is valid', () {
        // Arrange
        const client = Client(email: 'test@example.com');

        // Act
        final result = client.validateEmail();

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
          final client = Client(email: email);

          // Act
          final result = client.validateEmail();

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
          final client = Client(email: email);

          // Act
          final result = client.validateEmail();

          // Assert
          expect(
            result,
            equals('El correo electrónico no es válido'),
            reason: 'Email $email should be invalid',
          );
        }
      });
    });

    group('validatePhone', () {
      test('should return error message when telefono is empty', () {
        // Arrange
        const client = Client(telefono: '');

        // Act
        final result = client.validatePhone();

        // Assert
        expect(result, equals('El teléfono es requerido'));
      });

      test('should return error message when telefono format is invalid', () {
        // Arrange
        const client = Client(telefono: 'invalid-phone');

        // Act
        final result = client.validatePhone();

        // Assert
        expect(result, equals('El teléfono no es válido'));
      });

      test('should return null when telefono format is valid', () {
        // Arrange
        const client = Client(telefono: '+1234567890');

        // Act
        final result = client.validatePhone();

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
          final client = Client(telefono: phone);

          // Act
          final result = client.validatePhone();

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
          final client = Client(telefono: phone);

          // Act
          final result = client.validatePhone();

          // Assert
          expect(
            result,
            equals('El teléfono no es válido'),
            reason: 'Phone $phone should be invalid',
          );
        }
      });
    });

    group('validateDireccion', () {
      test('should return error message when direccion is empty', () {
        // Arrange
        const client = Client(direccion: '');

        // Act
        final result = client.validateDireccion();

        // Assert
        expect(result, equals('La dirección es requerida'));
      });

      test('should return null when direccion is not empty', () {
        // Arrange
        const client = Client(direccion: '123 Main St');

        // Act
        final result = client.validateDireccion();

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
          final client = Client(direccion: address);

          // Act
          final result = client.validateDireccion();

          // Assert
          expect(result, isNull, reason: 'Address $address should be valid');
        }
      });
    });

    group('validateRazonSocial', () {
      test('should return error message when razonSocial is empty', () {
        // Arrange
        const client = Client(razonSocial: '');

        // Act
        final result = client.validateRazonSocial();

        // Assert
        expect(result, equals('La razón social es requerida'));
      });

      test('should return null when razonSocial is not empty', () {
        // Arrange
        const client = Client(razonSocial: 'Empresa S.A.S.');

        // Act
        final result = client.validateRazonSocial();

        // Assert
        expect(result, isNull);
      });

      test('should return null for various valid razon social values', () {
        // Arrange
        final razonesSociales = [
          'Empresa S.A.S.',
          'Compañía Limitada',
          'Sociedad Anónima',
          'Nombre Comercial',
        ];

        for (final razonSocial in razonesSociales) {
          final client = Client(razonSocial: razonSocial);

          // Act
          final result = client.validateRazonSocial();

          // Assert
          expect(
            result,
            isNull,
            reason: 'Razón social $razonSocial should be valid',
          );
        }
      });
    });

    group('validateNit', () {
      test('should return error message when nit is empty', () {
        // Arrange
        const client = Client(nit: '');

        // Act
        final result = client.validateNit();

        // Assert
        expect(result, equals('El NIT es requerido'));
      });

      test('should return error message when nit format is invalid', () {
        // Arrange
        const client = Client(nit: '12345');

        // Act
        final result = client.validateNit();

        // Assert
        expect(result, equals('El NIT no es válido'));
      });

      test('should return null when nit format is valid', () {
        // Arrange
        const client = Client(nit: '1234567890');

        // Act
        final result = client.validateNit();

        // Assert
        expect(result, isNull);
      });

      test('should return null for various valid NIT formats', () {
        // Arrange
        final validNits = [
          '1234567890',
          '9876543210',
          '1111111111',
          '9999999999',
        ];

        for (final nit in validNits) {
          final client = Client(nit: nit);

          // Act
          final result = client.validateNit();

          // Assert
          expect(result, isNull, reason: 'NIT $nit should be valid');
        }
      });

      test('should return error for invalid NIT formats', () {
        // Arrange
        final invalidNits = [
          '123456789', // Too short (9 digits)
          '12345678901', // Too long (11 digits)
          '123456789a', // Contains letters
          '123-456-789', // Contains dashes
          '123.456.789', // Contains dots
          '123 456 789', // Contains spaces
        ];

        for (final nit in invalidNits) {
          final client = Client(nit: nit);

          // Act
          final result = client.validateNit();

          // Assert
          expect(result, isNot(isNull), reason: 'NIT $nit should be invalid');
          expect(
            result,
            contains('NIT'),
            reason: 'NIT $nit should return NIT-related error',
          );
        }
      });
    });
  });
}
