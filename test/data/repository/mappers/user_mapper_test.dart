import 'package:flutter_test/flutter_test.dart';
import 'package:medi_supply_app_grupo3/data/data_source/dto/user/user_dto.dart';
import 'package:medi_supply_app_grupo3/data/repository/entity/user/user.dart';
import 'package:medi_supply_app_grupo3/data/repository/mappers/user_mapper.dart';

void main() {
  group('UserMapper', () {
    group('UserDtoToEntityMapper', () {
      test('should convert UserDto to User entity', () {
        // Arrange
        final dto = UserDto(
          name: 'John Doe',
          documentType: 'CC',
          documentNumber: 12345678,
          address: '123 Main St',
          phone: '+1234567890',
          email: 'john@example.com',
          password: 'password123',
          role: RoleDto.user,
        );

        // Act
        final entity = dto.toEntity();

        // Assert
        expect(entity.name, equals('John Doe'));
        expect(entity.documentType, equals('CC'));
        expect(entity.documentNumber, equals(12345678));
        expect(entity.address, equals('123 Main St'));
        expect(entity.phone, equals('+1234567890'));
        expect(entity.email, equals('john@example.com'));
        expect(entity.password, equals('password123'));
        expect(entity.role, equals(Role.user));
      });

      test('should convert UserDto with admin role to User entity', () {
        // Arrange
        final dto = UserDto(
          name: 'Admin User',
          documentType: 'CC',
          documentNumber: 87654321,
          address: '456 Admin St',
          phone: '+0987654321',
          email: 'admin@example.com',
          password: 'admin123',
          role: RoleDto.admin,
        );

        // Act
        final entity = dto.toEntity();

        // Assert
        expect(entity.name, equals('Admin User'));
        expect(entity.documentType, equals('CC'));
        expect(entity.documentNumber, equals(87654321));
        expect(entity.address, equals('456 Admin St'));
        expect(entity.phone, equals('+0987654321'));
        expect(entity.email, equals('admin@example.com'));
        expect(entity.password, equals('admin123'));
        expect(entity.role, equals(Role.admin));
      });

      test('should convert UserDto with empty values to User entity', () {
        // Arrange
        final dto = UserDto(
          name: '',
          documentType: '',
          documentNumber: 0,
          address: '',
          phone: '',
          email: '',
          password: '',
          role: RoleDto.user,
        );

        // Act
        final entity = dto.toEntity();

        // Assert
        expect(entity.name, equals(''));
        expect(entity.documentType, equals(''));
        expect(entity.documentNumber, equals(0));
        expect(entity.address, equals(''));
        expect(entity.phone, equals(''));
        expect(entity.email, equals(''));
        expect(entity.password, equals(''));
        expect(entity.role, equals(Role.user));
      });

      test('should convert UserDto with special characters to User entity', () {
        // Arrange
        final dto = UserDto(
          name: 'José María',
          documentType: 'C.C.',
          documentNumber: 12345678,
          address: 'Calle 123 #45-67',
          phone: '+57 300 123 4567',
          email: 'josé.maría@ejemplo.com',
          password: 'P@ssw0rd!@#\$%^&*()',
          role: RoleDto.user,
        );

        // Act
        final entity = dto.toEntity();

        // Assert
        expect(entity.name, equals('José María'));
        expect(entity.documentType, equals('C.C.'));
        expect(entity.documentNumber, equals(12345678));
        expect(entity.address, equals('Calle 123 #45-67'));
        expect(entity.phone, equals('+57 300 123 4567'));
        expect(entity.email, equals('josé.maría@ejemplo.com'));
        expect(entity.password, equals('P@ssw0rd!@#\$%^&*()'));
        expect(entity.role, equals(Role.user));
      });
    });

    group('UserEntityToDtoMapper', () {
      test('should convert User entity to UserDto', () {
        // Arrange
        const entity = User(
          name: 'John Doe',
          documentType: 'CC',
          documentNumber: 12345678,
          address: '123 Main St',
          phone: '+1234567890',
          email: 'john@example.com',
          password: 'password123',
          role: Role.user,
        );

        // Act
        final dto = entity.toDto();

        // Assert
        expect(dto.name, equals('John Doe'));
        expect(dto.documentType, equals('CC'));
        expect(dto.documentNumber, equals(12345678));
        expect(dto.address, equals('123 Main St'));
        expect(dto.phone, equals('+1234567890'));
        expect(dto.email, equals('john@example.com'));
        expect(dto.password, equals('password123'));
        expect(dto.role, equals(RoleDto.user));
      });

      test('should convert User entity with admin role to UserDto', () {
        // Arrange
        const entity = User(
          name: 'Admin User',
          documentType: 'CC',
          documentNumber: 87654321,
          address: '456 Admin St',
          phone: '+0987654321',
          email: 'admin@example.com',
          password: 'admin123',
          role: Role.admin,
        );

        // Act
        final dto = entity.toDto();

        // Assert
        expect(dto.name, equals('Admin User'));
        expect(dto.documentType, equals('CC'));
        expect(dto.documentNumber, equals(87654321));
        expect(dto.address, equals('456 Admin St'));
        expect(dto.phone, equals('+0987654321'));
        expect(dto.email, equals('admin@example.com'));
        expect(dto.password, equals('admin123'));
        expect(dto.role, equals(RoleDto.admin));
      });

      test('should convert User entity with empty values to UserDto', () {
        // Arrange
        const entity = User(
          name: '',
          documentType: '',
          documentNumber: 0,
          address: '',
          phone: '',
          email: '',
          password: '',
          role: Role.user,
        );

        // Act
        final dto = entity.toDto();

        // Assert
        expect(dto.name, equals(''));
        expect(dto.documentType, equals(''));
        expect(dto.documentNumber, equals(0));
        expect(dto.address, equals(''));
        expect(dto.phone, equals(''));
        expect(dto.email, equals(''));
        expect(dto.password, equals(''));
        expect(dto.role, equals(RoleDto.user));
      });

      test('should convert User entity with special characters to UserDto', () {
        // Arrange
        const entity = User(
          name: 'José María',
          documentType: 'C.C.',
          documentNumber: 12345678,
          address: 'Calle 123 #45-67',
          phone: '+57 300 123 4567',
          email: 'josé.maría@ejemplo.com',
          password: 'P@ssw0rd!@#\$%^&*()',
          role: Role.user,
        );

        // Act
        final dto = entity.toDto();

        // Assert
        expect(dto.name, equals('José María'));
        expect(dto.documentType, equals('C.C.'));
        expect(dto.documentNumber, equals(12345678));
        expect(dto.address, equals('Calle 123 #45-67'));
        expect(dto.phone, equals('+57 300 123 4567'));
        expect(dto.email, equals('josé.maría@ejemplo.com'));
        expect(dto.password, equals('P@ssw0rd!@#\$%^&*()'));
        expect(dto.role, equals(RoleDto.user));
      });
    });

    group('UserRoleDtoToEntityMapper', () {
      test('should convert RoleDto.admin to Role.admin', () {
        // Arrange
        const roleDto = RoleDto.admin;

        // Act
        final role = roleDto.toEntity();

        // Assert
        expect(role, equals(Role.admin));
      });

      test('should convert RoleDto.USER to Role.USER', () {
        // Arrange
        const roleDto = RoleDto.user;

        // Act
        final role = roleDto.toEntity();

        // Assert
        expect(role, equals(Role.user));
      });

      test('should handle all RoleDto values', () {
        // Arrange & Act & Assert
        for (final roleDto in RoleDto.values) {
          final role = roleDto.toEntity();

          switch (roleDto) {
            case RoleDto.admin:
              expect(role, equals(Role.admin));
              break;
            case RoleDto.user:
              expect(role, equals(Role.user));
              break;
          }
        }
      });
    });

    group('UserRoleEntityToDtoMapper', () {
      test('should convert Role.admin to RoleDto.admin', () {
        // Arrange
        const role = Role.admin;

        // Act
        final roleDto = role.toDto();

        // Assert
        expect(roleDto, equals(RoleDto.admin));
      });

      test('should convert Role.user to RoleDto.user', () {
        // Arrange
        const role = Role.user;

        // Act
        final roleDto = role.toDto();

        // Assert
        expect(roleDto, equals(RoleDto.user));
      });

      test('should handle all Role values', () {
        // Arrange & Act & Assert
        for (final role in Role.values) {
          final roleDto = role.toDto();

          switch (role) {
            case Role.admin:
              expect(roleDto, equals(RoleDto.admin));
              break;
            case Role.user:
              expect(roleDto, equals(RoleDto.user));
              break;
          }
        }
      });
    });

    group('Round-trip conversion', () {
      test(
        'should maintain data integrity when converting DTO to Entity and back',
        () {
          // Arrange
          final originalDto = UserDto(
            name: 'John Doe',
            documentType: 'CC',
            documentNumber: 12345678,
            address: '123 Main St',
            phone: '+1234567890',
            email: 'john@example.com',
            password: 'password123',
            role: RoleDto.user,
          );

          // Act
          final entity = originalDto.toEntity();
          final convertedDto = entity.toDto();

          // Assert
          expect(convertedDto.name, equals(originalDto.name));
          expect(convertedDto.documentType, equals(originalDto.documentType));
          expect(
            convertedDto.documentNumber,
            equals(originalDto.documentNumber),
          );
          expect(convertedDto.address, equals(originalDto.address));
          expect(convertedDto.phone, equals(originalDto.phone));
          expect(convertedDto.email, equals(originalDto.email));
          expect(convertedDto.password, equals(originalDto.password));
          expect(convertedDto.role, equals(originalDto.role));
        },
      );

      test(
        'should maintain data integrity when converting Entity to DTO and back',
        () {
          // Arrange
          const originalEntity = User(
            name: 'John Doe',
            documentType: 'CC',
            documentNumber: 12345678,
            address: '123 Main St',
            phone: '+1234567890',
            email: 'john@example.com',
            password: 'password123',
            role: Role.user,
          );

          // Act
          final dto = originalEntity.toDto();
          final convertedEntity = dto.toEntity();

          // Assert
          expect(convertedEntity.name, equals(originalEntity.name));
          expect(
            convertedEntity.documentType,
            equals(originalEntity.documentType),
          );
          expect(
            convertedEntity.documentNumber,
            equals(originalEntity.documentNumber),
          );
          expect(convertedEntity.address, equals(originalEntity.address));
          expect(convertedEntity.phone, equals(originalEntity.phone));
          expect(convertedEntity.email, equals(originalEntity.email));
          expect(convertedEntity.password, equals(originalEntity.password));
          expect(convertedEntity.role, equals(originalEntity.role));
        },
      );

      test('should maintain data integrity with admin role', () {
        // Arrange
        final originalDto = UserDto(
          name: 'Admin User',
          documentType: 'CC',
          documentNumber: 87654321,
          address: '456 Admin St',
          phone: '+0987654321',
          email: 'admin@example.com',
          password: 'admin123',
          role: RoleDto.admin,
        );

        // Act
        final entity = originalDto.toEntity();
        final convertedDto = entity.toDto();

        // Assert
        expect(convertedDto.role, equals(RoleDto.admin));
        expect(entity.role, equals(Role.admin));
      });
    });
  });
}
