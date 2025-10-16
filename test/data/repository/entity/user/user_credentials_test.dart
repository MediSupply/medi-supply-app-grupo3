import 'package:flutter_test/flutter_test.dart';
import 'package:medi_supply_app_grupo3/data/repository/entity/user/user_credentials.dart';

void main() {
  group('UserCredentials', () {
    test('should create UserCredentials with default values', () {
      // Arrange & Act
      const userCredentials = UserCredentials();

      // Assert
      expect(userCredentials.email, equals(''));
      expect(userCredentials.password, equals(''));
    });

    test('should create UserCredentials with custom values', () {
      // Arrange & Act
      const userCredentials = UserCredentials(
        email: 'test@example.com',
        password: 'password123',
      );

      // Assert
      expect(userCredentials.email, equals('test@example.com'));
      expect(userCredentials.password, equals('password123'));
    });

    test('should be equal when properties are the same', () {
      // Arrange & Act
      const userCredentials1 = UserCredentials(
        email: 'test@example.com',
        password: 'password123',
      );
      const userCredentials2 = UserCredentials(
        email: 'test@example.com',
        password: 'password123',
      );

      // Assert
      expect(userCredentials1, equals(userCredentials2));
    });

    test('should not be equal when properties are different', () {
      // Arrange & Act
      const userCredentials1 = UserCredentials(
        email: 'test@example.com',
        password: 'password123',
      );
      const userCredentials2 = UserCredentials(
        email: 'different@example.com',
        password: 'password123',
      );

      // Assert
      expect(userCredentials1, isNot(equals(userCredentials2)));
    });

    group('validateEmail', () {
      test('should return error message when email is empty', () {
        // Arrange
        const userCredentials = UserCredentials(email: '');

        // Act
        final result = userCredentials.validateEmail();

        // Assert
        expect(result, equals('El correo electrónico es requerido'));
      });

      test('should return error message when email format is invalid', () {
        // Arrange
        const userCredentials = UserCredentials(email: 'invalid-email');

        // Act
        final result = userCredentials.validateEmail();

        // Assert
        expect(result, equals('El correo electrónico no es válido'));
      });

      test('should return null when email format is valid', () {
        // Arrange
        const userCredentials = UserCredentials(email: 'test@example.com');

        // Act
        final result = userCredentials.validateEmail();

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
        ];

        for (final email in validEmails) {
          final userCredentials = UserCredentials(email: email);

          // Act
          final result = userCredentials.validateEmail();

          // Assert
          expect(result, isNull, reason: 'Email $email should be valid');
        }
      });
    });

    group('validatePassword', () {
      test('should return error message when password is empty', () {
        // Arrange
        const userCredentials = UserCredentials(password: '');

        // Act
        final result = userCredentials.validatePassword();

        // Assert
        expect(result, equals('La contraseña es requerida'));
      });

      test('should return null when password is not empty', () {
        // Arrange
        const userCredentials = UserCredentials(password: 'password123');

        // Act
        final result = userCredentials.validatePassword();

        // Assert
        expect(result, isNull);
      });
    });
  });
}
