import 'package:flutter_test/flutter_test.dart';
import 'package:medi_supply_app_grupo3/data/repository/mappers/user_credentials_mapper.dart';
import 'package:medi_supply_app_grupo3/data/repository/entity/user/user_credentials.dart';
import 'package:medi_supply_app_grupo3/data/data_source/dto/user/user_credentials_dto.dart';

void main() {
  group('UserCredentialsMapper', () {
    group('UserCredentialsDtoMapper', () {
      test('should convert UserCredentialsDto to UserCredentials entity', () {
        // Arrange
        final userCredentialsDto = UserCredentialsDto(
          email: 'test@example.com',
          password: 'password123',
        );

        // Act
        final userCredentials = userCredentialsDto.toEntity();

        // Assert
        expect(userCredentials.email, equals('test@example.com'));
        expect(userCredentials.password, equals('password123'));
      });
    });

    group('UserCredentialsEntityMapper', () {
      test('should convert UserCredentials entity to UserCredentialsDto', () {
        // Arrange
        const userCredentials = UserCredentials(
          email: 'test@example.com',
          password: 'password123',
        );

        // Act
        final userCredentialsDto = userCredentials.toDto();

        // Assert
        expect(userCredentialsDto.email, equals('test@example.com'));
        expect(userCredentialsDto.password, equals('password123'));
      });
    });

    group('Round trip conversion', () {
      test(
        'should maintain data integrity through DTO to Entity to DTO conversion',
        () {
          // Arrange
          final originalDto = UserCredentialsDto(
            email: 'test@example.com',
            password: 'password123',
          );

          // Act
          final entity = originalDto.toEntity();
          final convertedDto = entity.toDto();

          // Assert
          expect(convertedDto.email, equals(originalDto.email));
          expect(convertedDto.password, equals(originalDto.password));
        },
      );

      test(
        'should maintain data integrity through Entity to DTO to Entity conversion',
        () {
          // Arrange
          const originalEntity = UserCredentials(
            email: 'test@example.com',
            password: 'password123',
          );

          // Act
          final dto = originalEntity.toDto();
          final convertedEntity = dto.toEntity();

          // Assert
          expect(convertedEntity.email, equals(originalEntity.email));
          expect(convertedEntity.password, equals(originalEntity.password));
        },
      );
    });

    group('Edge cases', () {
      test('should handle empty strings correctly', () {
        // Arrange
        final userCredentialsDto = UserCredentialsDto(email: '', password: '');

        // Act
        final userCredentials = userCredentialsDto.toEntity();
        final convertedDto = userCredentials.toDto();

        // Assert
        expect(convertedDto.email, equals(''));
        expect(convertedDto.password, equals(''));
      });

      test('should handle special characters in email and password', () {
        // Arrange
        final userCredentialsDto = UserCredentialsDto(
          email: 'user+tag@domain.co.uk',
          password: 'p@ssw0rd!@#',
        );

        // Act
        final userCredentials = userCredentialsDto.toEntity();
        final convertedDto = userCredentials.toDto();

        // Assert
        expect(convertedDto.email, equals('user+tag@domain.co.uk'));
        expect(convertedDto.password, equals('p@ssw0rd!@#'));
      });
    });
  });
}
