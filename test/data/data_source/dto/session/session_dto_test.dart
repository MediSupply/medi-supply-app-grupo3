import 'package:flutter_test/flutter_test.dart';
import 'package:medi_supply_app_grupo3/data/data_source/dto/session/session_dto.dart';

void main() {
  group('SessionDto', () {
    test('should create SessionDto with all required parameters', () {
      // Arrange
      const id = 'session123';
      const token = 'token123';
      const expiresAt = '2024-12-31T23:59:59Z';
      const userId = 'user123';

      // Act
      const dto = SessionDto(
        id: id,
        token: token,
        expiresAt: expiresAt,
        userId: userId,
      );

      // Assert
      expect(dto.id, equals(id));
      expect(dto.token, equals(token));
      expect(dto.expiresAt, equals(expiresAt));
      expect(dto.userId, equals(userId));
    });

    test('should create SessionDto with different values', () {
      // Arrange
      const id = 'different-session';
      const token = 'different-token';
      const expiresAt = '2025-01-01T00:00:00Z';
      const userId = 'different-user';

      // Act
      const dto = SessionDto(
        id: id,
        token: token,
        expiresAt: expiresAt,
        userId: userId,
      );

      // Assert
      expect(dto.id, equals(id));
      expect(dto.token, equals(token));
      expect(dto.expiresAt, equals(expiresAt));
      expect(dto.userId, equals(userId));
    });

    test('should handle empty strings', () {
      // Act
      const dto = SessionDto(id: '', token: '', expiresAt: '', userId: '');

      // Assert
      expect(dto.id, equals(''));
      expect(dto.token, equals(''));
      expect(dto.expiresAt, equals(''));
      expect(dto.userId, equals(''));
    });

    test('should handle special characters in token', () {
      // Arrange
      const id = 'session123';
      const token =
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c';
      const expiresAt = '2024-12-31T23:59:59Z';
      const userId = 'user123';

      // Act
      const dto = SessionDto(
        id: id,
        token: token,
        expiresAt: expiresAt,
        userId: userId,
      );

      // Assert
      expect(dto.id, equals(id));
      expect(dto.token, equals(token));
      expect(dto.expiresAt, equals(expiresAt));
      expect(dto.userId, equals(userId));
    });

    test('should handle different date formats', () {
      // Arrange
      const id = 'session123';
      const token = 'token123';
      const expiresAt = '2024-12-31T23:59:59.000Z';
      const userId = 'user123';

      // Act
      const dto = SessionDto(
        id: id,
        token: token,
        expiresAt: expiresAt,
        userId: userId,
      );

      // Assert
      expect(dto.id, equals(id));
      expect(dto.token, equals(token));
      expect(dto.expiresAt, equals(expiresAt));
      expect(dto.userId, equals(userId));
    });

    test('should handle UUID format IDs', () {
      // Arrange
      const id = '550e8400-e29b-41d4-a716-446655440000';
      const token = 'token123';
      const expiresAt = '2024-12-31T23:59:59Z';
      const userId = '550e8400-e29b-41d4-a716-446655440001';

      // Act
      const dto = SessionDto(
        id: id,
        token: token,
        expiresAt: expiresAt,
        userId: userId,
      );

      // Assert
      expect(dto.id, equals(id));
      expect(dto.token, equals(token));
      expect(dto.expiresAt, equals(expiresAt));
      expect(dto.userId, equals(userId));
    });

    test('should handle numeric IDs', () {
      // Arrange
      const id = '12345';
      const token = 'token123';
      const expiresAt = '2024-12-31T23:59:59Z';
      const userId = '67890';

      // Act
      const dto = SessionDto(
        id: id,
        token: token,
        expiresAt: expiresAt,
        userId: userId,
      );

      // Assert
      expect(dto.id, equals(id));
      expect(dto.token, equals(token));
      expect(dto.expiresAt, equals(expiresAt));
      expect(dto.userId, equals(userId));
    });

    test('should handle long token values', () {
      // Arrange
      const id = 'session123';
      const token =
          'verylongtokenthatmightbeusedforauthenticationpurposesandshouldbehandledcorrectly';
      const expiresAt = '2024-12-31T23:59:59Z';
      const userId = 'user123';

      // Act
      const dto = SessionDto(
        id: id,
        token: token,
        expiresAt: expiresAt,
        userId: userId,
      );

      // Assert
      expect(dto.id, equals(id));
      expect(dto.token, equals(token));
      expect(dto.expiresAt, equals(expiresAt));
      expect(dto.userId, equals(userId));
    });

    test('should handle future expiration dates', () {
      // Arrange
      const id = 'session123';
      const token = 'token123';
      const expiresAt = '2030-12-31T23:59:59Z';
      const userId = 'user123';

      // Act
      const dto = SessionDto(
        id: id,
        token: token,
        expiresAt: expiresAt,
        userId: userId,
      );

      // Assert
      expect(dto.id, equals(id));
      expect(dto.token, equals(token));
      expect(dto.expiresAt, equals(expiresAt));
      expect(dto.userId, equals(userId));
    });

    test('should handle past expiration dates', () {
      // Arrange
      const id = 'session123';
      const token = 'token123';
      const expiresAt = '2020-01-01T00:00:00Z';
      const userId = 'user123';

      // Act
      const dto = SessionDto(
        id: id,
        token: token,
        expiresAt: expiresAt,
        userId: userId,
      );

      // Assert
      expect(dto.id, equals(id));
      expect(dto.token, equals(token));
      expect(dto.expiresAt, equals(expiresAt));
      expect(dto.userId, equals(userId));
    });
  });

  group('SessionDto.fromJson', () {
    test('should create SessionDto from valid JSON', () {
      // Arrange
      const json = {
        'id': 'session123',
        'token': 'token123',
        'expires_at': '2024-12-31T23:59:59Z',
        'user_id': 'user123',
      };

      // Act
      final dto = SessionDto.fromJson(json);

      // Assert
      expect(dto.id, equals('session123'));
      expect(dto.token, equals('token123'));
      expect(dto.expiresAt, equals('2024-12-31T23:59:59Z'));
      expect(dto.userId, equals('user123'));
    });

    test('should create SessionDto from JSON with empty values', () {
      // Arrange
      const json = {'id': '', 'token': '', 'expires_at': '', 'user_id': ''};

      // Act
      final dto = SessionDto.fromJson(json);

      // Assert
      expect(dto.id, equals(''));
      expect(dto.token, equals(''));
      expect(dto.expiresAt, equals(''));
      expect(dto.userId, equals(''));
    });

    test('should handle missing optional fields in JSON', () {
      // Arrange
      final json = {
        'id': 'session123',
        'token': 'token123',
        'expires_at': '2024-12-31T23:59:59Z',
        // 'user_id' omitted
      };

      // Act & Assert
      expect(() => SessionDto.fromJson(json), throwsA(isA<Error>()));
    });
  });

  test('should convert SessionDto to JSON', () {
    // Arrange
    const dto = SessionDto(
      id: 'session456',
      token: 'token456',
      expiresAt: '2024-11-30T20:00:00Z',
      userId: 'user456',
    );

    // Act
    final json = dto.toJson();

    // Assert
    expect(json['id'], equals('session456'));
    expect(json['token'], equals('token456'));
    expect(json['expires_at'], equals('2024-11-30T20:00:00Z'));
    expect(json['user_id'], equals('user456'));
  });

  test('should convert SessionDto with empty fields to JSON', () {
    // Arrange
    const dto = SessionDto(id: '', token: '', expiresAt: '', userId: '');

    // Act
    final json = dto.toJson();

    // Assert
    expect(json['id'], equals(''));
    expect(json['token'], equals(''));
    expect(json['expires_at'], equals(''));
    expect(json['user_id'], equals(''));
  });
}
