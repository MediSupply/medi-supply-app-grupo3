import 'package:flutter_test/flutter_test.dart';
import 'package:medi_supply_app_grupo3/data/repository/mappers/session_mapper.dart';
import 'package:medi_supply_app_grupo3/data/repository/entity/session/session.dart';
import 'package:medi_supply_app_grupo3/data/data_source/dto/session/session_dto.dart';

void main() {
  group('SessionMapper', () {
    group('SessionDtoMapper', () {
      test('should convert SessionDto to Session entity', () {
        // Arrange
        const sessionDto = SessionDto(
          id: 'session123',
          token: 'token123',
          expiresAt: '2024-12-31T23:59:59Z',
          userId: 'user123',
        );

        // Act
        final session = sessionDto.toEntity();

        // Assert
        expect(session.id, equals('session123'));
        expect(session.token, equals('token123'));
        expect(session.expiresAt, equals('2024-12-31T23:59:59Z'));
        expect(session.userId, equals('user123'));
      });
    });

    group('SessionEntityMapper', () {
      test('should convert Session entity to SessionDto', () {
        // Arrange
        const session = Session(
          id: 'session123',
          token: 'token123',
          expiresAt: '2024-12-31T23:59:59Z',
          userId: 'user123',
        );

        // Act
        final sessionDto = session.toDto();

        // Assert
        expect(sessionDto.id, equals('session123'));
        expect(sessionDto.token, equals('token123'));
        expect(sessionDto.expiresAt, equals('2024-12-31T23:59:59Z'));
        expect(sessionDto.userId, equals('user123'));
      });
    });

    group('Round trip conversion', () {
      test(
        'should maintain data integrity through DTO to Entity to DTO conversion',
        () {
          // Arrange
          const originalDto = SessionDto(
            id: 'session123',
            token: 'token123',
            expiresAt: '2024-12-31T23:59:59Z',
            userId: 'user123',
          );

          // Act
          final entity = originalDto.toEntity();
          final convertedDto = entity.toDto();

          // Assert
          expect(convertedDto.id, equals(originalDto.id));
          expect(convertedDto.token, equals(originalDto.token));
          expect(convertedDto.expiresAt, equals(originalDto.expiresAt));
          expect(convertedDto.userId, equals(originalDto.userId));
        },
      );

      test(
        'should maintain data integrity through Entity to DTO to Entity conversion',
        () {
          // Arrange
          const originalEntity = Session(
            id: 'session123',
            token: 'token123',
            expiresAt: '2024-12-31T23:59:59Z',
            userId: 'user123',
          );

          // Act
          final dto = originalEntity.toDto();
          final convertedEntity = dto.toEntity();

          // Assert
          expect(convertedEntity.id, equals(originalEntity.id));
          expect(convertedEntity.token, equals(originalEntity.token));
          expect(convertedEntity.expiresAt, equals(originalEntity.expiresAt));
          expect(convertedEntity.userId, equals(originalEntity.userId));
        },
      );
    });
  });
}
