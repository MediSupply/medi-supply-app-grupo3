import 'package:flutter_test/flutter_test.dart';
import 'package:medi_supply_app_grupo3/data/data_source/dto/client/client_dto.dart';
import 'package:medi_supply_app_grupo3/data/repository/entity/client/client.dart';
import 'package:medi_supply_app_grupo3/data/repository/mappers/client_mapper.dart';

void main() {
  group('ClientMapper', () {
    group('ClientDtoToEntityMapper', () {
      test('should convert ClientDto to Client entity', () {
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
        final entity = dto.toEntity();

        // Assert
        expect(entity.id, equals('client-123'));
        expect(entity.nombre, equals('John Doe'));
        expect(entity.email, equals('john@example.com'));
        expect(entity.telefono, equals('+1234567890'));
        expect(entity.direccion, equals('123 Main St'));
        expect(entity.razonSocial, equals('Empresa S.A.S.'));
        expect(entity.nit, equals('1234567890'));
      });

      test('should convert ClientDto with empty values to Client entity', () {
        // Arrange
        final dto = ClientDto(
          id: '',
          nombre: '',
          email: '',
          telefono: '',
          direccion: '',
          razonSocial: '',
          nit: '',
        );

        // Act
        final entity = dto.toEntity();

        // Assert
        expect(entity.id, equals(''));
        expect(entity.nombre, equals(''));
        expect(entity.email, equals(''));
        expect(entity.telefono, equals(''));
        expect(entity.direccion, equals(''));
        expect(entity.razonSocial, equals(''));
        expect(entity.nit, equals(''));
      });

      test(
        'should convert ClientDto with special characters to Client entity',
        () {
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
          final entity = dto.toEntity();

          // Assert
          expect(entity.nombre, equals('José María'));
          expect(entity.email, equals('josé@example.com'));
          expect(entity.telefono, equals('+57 300 123 4567'));
          expect(entity.direccion, equals('Calle 123 #45-67'));
          expect(entity.razonSocial, equals('Empresa & Asociados S.A.S.'));
        },
      );
    });

    group('ClientEntityToDtoMapper', () {
      test('should convert Client entity to ClientDto', () {
        // Arrange
        const entity = Client(
          id: 'client-123',
          nombre: 'John Doe',
          email: 'john@example.com',
          telefono: '+1234567890',
          direccion: '123 Main St',
          razonSocial: 'Empresa S.A.S.',
          nit: '1234567890',
        );

        // Act
        final dto = entity.toDto();

        // Assert
        expect(dto.id, equals('client-123'));
        expect(dto.nombre, equals('John Doe'));
        expect(dto.email, equals('john@example.com'));
        expect(dto.telefono, equals('+1234567890'));
        expect(dto.direccion, equals('123 Main St'));
        expect(dto.razonSocial, equals('Empresa S.A.S.'));
        expect(dto.nit, equals('1234567890'));
      });

      test('should convert Client entity with empty values to ClientDto', () {
        // Arrange
        const entity = Client(
          id: '',
          nombre: '',
          email: '',
          telefono: '',
          direccion: '',
          razonSocial: '',
          nit: '',
        );

        // Act
        final dto = entity.toDto();

        // Assert
        expect(dto.id, equals(''));
        expect(dto.nombre, equals(''));
        expect(dto.email, equals(''));
        expect(dto.telefono, equals(''));
        expect(dto.direccion, equals(''));
        expect(dto.razonSocial, equals(''));
        expect(dto.nit, equals(''));
      });

      test(
        'should convert Client entity with special characters to ClientDto',
        () {
          // Arrange
          const entity = Client(
            id: 'client-123',
            nombre: 'José María',
            email: 'josé@example.com',
            telefono: '+57 300 123 4567',
            direccion: 'Calle 123 #45-67',
            razonSocial: 'Empresa & Asociados S.A.S.',
            nit: '1234567890',
          );

          // Act
          final dto = entity.toDto();

          // Assert
          expect(dto.nombre, equals('José María'));
          expect(dto.email, equals('josé@example.com'));
          expect(dto.telefono, equals('+57 300 123 4567'));
          expect(dto.direccion, equals('Calle 123 #45-67'));
          expect(dto.razonSocial, equals('Empresa & Asociados S.A.S.'));
        },
      );
    });

    group('Round-trip conversion', () {
      test(
        'should maintain data integrity when converting DTO to Entity and back',
        () {
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
          final entity = originalDto.toEntity();
          final convertedDto = entity.toDto();

          // Assert
          expect(convertedDto.id, equals(originalDto.id));
          expect(convertedDto.nombre, equals(originalDto.nombre));
          expect(convertedDto.email, equals(originalDto.email));
          expect(convertedDto.telefono, equals(originalDto.telefono));
          expect(convertedDto.direccion, equals(originalDto.direccion));
          expect(convertedDto.razonSocial, equals(originalDto.razonSocial));
          expect(convertedDto.nit, equals(originalDto.nit));
        },
      );

      test(
        'should maintain data integrity when converting Entity to DTO and back',
        () {
          // Arrange
          const originalEntity = Client(
            id: 'client-123',
            nombre: 'John Doe',
            email: 'john@example.com',
            telefono: '+1234567890',
            direccion: '123 Main St',
            razonSocial: 'Empresa S.A.S.',
            nit: '1234567890',
          );

          // Act
          final dto = originalEntity.toDto();
          final convertedEntity = dto.toEntity();

          // Assert
          expect(convertedEntity.id, equals(originalEntity.id));
          expect(convertedEntity.nombre, equals(originalEntity.nombre));
          expect(convertedEntity.email, equals(originalEntity.email));
          expect(convertedEntity.telefono, equals(originalEntity.telefono));
          expect(convertedEntity.direccion, equals(originalEntity.direccion));
          expect(
            convertedEntity.razonSocial,
            equals(originalEntity.razonSocial),
          );
          expect(convertedEntity.nit, equals(originalEntity.nit));
        },
      );

      test('should maintain data integrity with special characters', () {
        // Arrange
        final originalDto = ClientDto(
          id: 'client-123',
          nombre: 'José María',
          email: 'josé@example.com',
          telefono: '+57 300 123 4567',
          direccion: 'Calle 123 #45-67',
          razonSocial: 'Empresa & Asociados S.A.S.',
          nit: '1234567890',
        );

        // Act
        final entity = originalDto.toEntity();
        final convertedDto = entity.toDto();

        // Assert
        expect(convertedDto.nombre, equals(originalDto.nombre));
        expect(convertedDto.email, equals(originalDto.email));
        expect(convertedDto.telefono, equals(originalDto.telefono));
        expect(convertedDto.direccion, equals(originalDto.direccion));
        expect(convertedDto.razonSocial, equals(originalDto.razonSocial));
      });
    });
  });
}
