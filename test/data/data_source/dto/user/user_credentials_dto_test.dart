import 'package:flutter_test/flutter_test.dart';
import 'package:medi_supply_app_grupo3/data/data_source/dto/user/user_credentials_dto.dart';

void main() {
  group('UserCredentialsDto', () {
    test('should create UserCredentialsDto with default values', () {
      // Act
      final dto = UserCredentialsDto(email: '', password: '');

      // Assert
      expect(dto.email, equals(''));
      expect(dto.password, equals(''));
    });

    test('should create UserCredentialsDto with custom values', () {
      // Arrange
      const email = 'test@example.com';
      const password = 'password123';

      // Act
      final dto = UserCredentialsDto(email: email, password: password);

      // Assert
      expect(dto.email, equals(email));
      expect(dto.password, equals(password));
    });

    test('should create UserCredentialsDto with partial values', () {
      // Arrange
      const email = 'test@example.com';
      const password = '';

      // Act
      final dto = UserCredentialsDto(email: email, password: password);

      // Assert
      expect(dto.email, equals(email));
      expect(dto.password, equals(''));
    });

    test('should create UserCredentialsDto with only password', () {
      // Arrange
      const email = '';
      const password = 'password123';

      // Act
      final dto = UserCredentialsDto(email: email, password: password);

      // Assert
      expect(dto.email, equals(''));
      expect(dto.password, equals(password));
    });

    test('should handle empty strings', () {
      // Act
      final dto = UserCredentialsDto(email: '', password: '');

      // Assert
      expect(dto.email, equals(''));
      expect(dto.password, equals(''));
    });

    test('should handle special characters in email', () {
      // Arrange
      const email = 'user+tag@domain.co.uk';
      const password = 'password123';

      // Act
      final dto = UserCredentialsDto(email: email, password: password);

      // Assert
      expect(dto.email, equals(email));
      expect(dto.password, equals(password));
    });

    test('should handle special characters in password', () {
      // Arrange
      const email = 'test@example.com';
      const password = 'P@ssw0rd!@#\$%^&*()';

      // Act
      final dto = UserCredentialsDto(email: email, password: password);

      // Assert
      expect(dto.email, equals(email));
      expect(dto.password, equals(password));
    });

    test('should handle long email addresses', () {
      // Arrange
      const email =
          'very.long.email.address.with.many.parts@very.long.domain.name.com';
      const password = 'password123';

      // Act
      final dto = UserCredentialsDto(email: email, password: password);

      // Assert
      expect(dto.email, equals(email));
      expect(dto.password, equals(password));
    });

    test('should handle long passwords', () {
      // Arrange
      const email = 'test@example.com';
      const password = 'verylongpasswordthatexceedsnormallengthrequirements';

      // Act
      final dto = UserCredentialsDto(email: email, password: password);

      // Assert
      expect(dto.email, equals(email));
      expect(dto.password, equals(password));
    });

    test('should handle unicode characters', () {
      // Arrange
      const email = 'tëst@éxämplé.com';
      const password = 'pässwörd123';

      // Act
      final dto = UserCredentialsDto(email: email, password: password);

      // Assert
      expect(dto.email, equals(email));
      expect(dto.password, equals(password));
    });

    test('should handle numeric values', () {
      // Arrange
      const email = '123@456.com';
      const password = '123456789';

      // Act
      final dto = UserCredentialsDto(email: email, password: password);

      // Assert
      expect(dto.email, equals(email));
      expect(dto.password, equals(password));
    });

    test('should create from JSON', () {
      // Arrange
      const json = {'email': 'test@example.com', 'password': 'password123'};

      // Act
      final dto = UserCredentialsDto.fromJson(json);

      // Assert
      expect(dto.email, equals('test@example.com'));
      expect(dto.password, equals('password123'));
    });

    test('should convert to JSON', () {
      // Arrange
      final dto = UserCredentialsDto(
        email: 'test@example.com',
        password: 'password123',
      );

      // Act
      final json = dto.toJson();

      // Assert
      expect(json['email'], equals('test@example.com'));
      expect(json['password'], equals('password123'));
    });

    test('should handle JSON with empty values', () {
      // Arrange
      const json = {'email': '', 'password': ''};

      // Act
      final dto = UserCredentialsDto.fromJson(json);

      // Assert
      expect(dto.email, equals(''));
      expect(dto.password, equals(''));
    });

    test('should handle JSON with special characters', () {
      // Arrange
      const json = {
        'email': 'user+tag@domain.co.uk',
        'password': 'P@ssw0rd!@#\$%^&*()',
      };

      // Act
      final dto = UserCredentialsDto.fromJson(json);

      // Assert
      expect(dto.email, equals('user+tag@domain.co.uk'));
      expect(dto.password, equals('P@ssw0rd!@#\$%^&*()'));
    });
  });
}
