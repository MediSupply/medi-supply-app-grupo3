import 'package:flutter_test/flutter_test.dart';
import 'package:medi_supply_app_grupo3/data/repository/entity/session/session.dart';

void main() {
  group('Session', () {
    test('should create Session with required parameters', () {
      // Arrange & Act
      const session = Session(
        id: 'session123',
        token: 'token123',
        expiresAt: '2024-12-31T23:59:59Z',
        userId: 'user123',
      );

      // Assert
      expect(session.id, equals('session123'));
      expect(session.token, equals('token123'));
      expect(session.expiresAt, equals('2024-12-31T23:59:59Z'));
      expect(session.userId, equals('user123'));
    });

    test('should be equal when properties are the same', () {
      // Arrange & Act
      const session1 = Session(
        id: 'session123',
        token: 'token123',
        expiresAt: '2024-12-31T23:59:59Z',
        userId: 'user123',
      );
      const session2 = Session(
        id: 'session123',
        token: 'token123',
        expiresAt: '2024-12-31T23:59:59Z',
        userId: 'user123',
      );

      // Assert
      expect(session1, equals(session2));
    });

    test('should not be equal when properties are different', () {
      // Arrange & Act
      const session1 = Session(
        id: 'session123',
        token: 'token123',
        expiresAt: '2024-12-31T23:59:59Z',
        userId: 'user123',
      );
      const session2 = Session(
        id: 'session456',
        token: 'token123',
        expiresAt: '2024-12-31T23:59:59Z',
        userId: 'user123',
      );

      // Assert
      expect(session1, isNot(equals(session2)));
    });

    test('should include all properties in props list', () {
      // Arrange
      const session = Session(
        id: 'session123',
        token: 'token123',
        expiresAt: '2024-12-31T23:59:59Z',
        userId: 'user123',
      );

      // Act
      final props = session.props;

      // Assert
      expect(props, contains('session123'));
      expect(props, contains('token123'));
      expect(props, contains('2024-12-31T23:59:59Z'));
      expect(props, contains('user123'));
      expect(props.length, equals(4));
    });
  });
}
