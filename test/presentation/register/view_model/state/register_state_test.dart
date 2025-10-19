import 'package:flutter_test/flutter_test.dart';
import 'package:medi_supply_app_grupo3/data/repository/entity/session/session.dart';
import 'package:medi_supply_app_grupo3/data/repository/entity/user/user.dart';
import 'package:medi_supply_app_grupo3/presentation/register/view_model/state/register_state.dart';

void main() {
  group('RegisterState', () {
    test('should create RegisterState with default values', () {
      // Arrange & Act
      const state = RegisterState();

      // Assert
      expect(state.user, equals(const User()));
      expect(state.session, isNull);
      expect(state.isLoading, equals(false));
    });

    test('should create RegisterState with custom values', () {
      // Arrange
      const user = User(
        name: 'John Doe',
        email: 'john@example.com',
        password: 'password123',
      );
      const session = Session(
        id: 'session-id',
        token: 'test-token',
        expiresAt: '2024-12-31T23:59:59Z',
        userId: 'user-id',
      );

      // Act
      const state = RegisterState(
        user: user,
        session: session,
        isLoading: true,
      );

      // Assert
      expect(state.user, equals(user));
      expect(state.session, equals(session));
      expect(state.isLoading, equals(true));
    });

    test('should create RegisterState with partial custom values', () {
      // Arrange
      const user = User(name: 'John Doe');

      // Act
      const state = RegisterState(user: user);

      // Assert
      expect(state.user, equals(user));
      expect(state.session, isNull);
      expect(state.isLoading, equals(false));
    });

    test('should copy with new user', () {
      // Arrange
      const originalState = RegisterState();
      const newUser = User(name: 'Jane Doe');

      // Act
      final newState = originalState.copyWith(user: newUser);

      // Assert
      expect(newState.user, equals(newUser));
      expect(newState.session, equals(originalState.session));
      expect(newState.isLoading, equals(originalState.isLoading));
    });

    test('should copy with new session', () {
      // Arrange
      const originalState = RegisterState();
      const session = Session(
        id: 'session-id',
        token: 'test-token',
        expiresAt: '2024-12-31T23:59:59Z',
        userId: 'user-id',
      );

      // Act
      final newState = originalState.copyWith(session: session);

      // Assert
      expect(newState.user, equals(originalState.user));
      expect(newState.session, equals(session));
      expect(newState.isLoading, equals(originalState.isLoading));
    });

    test('should copy with new isLoading', () {
      // Arrange
      const originalState = RegisterState();

      // Act
      final newState = originalState.copyWith(isLoading: true);

      // Assert
      expect(newState.user, equals(originalState.user));
      expect(newState.session, equals(originalState.session));
      expect(newState.isLoading, equals(true));
    });

    test('should copy with multiple changes', () {
      // Arrange
      const originalState = RegisterState();
      const newUser = User(name: 'John Doe');
      const session = Session(
        id: 'session-id',
        token: 'test-token',
        expiresAt: '2024-12-31T23:59:59Z',
        userId: 'user-id',
      );

      // Act
      final newState = originalState.copyWith(
        user: newUser,
        session: session,
        isLoading: true,
      );

      // Assert
      expect(newState.user, equals(newUser));
      expect(newState.session, equals(session));
      expect(newState.isLoading, equals(true));
    });

    test('should copy with null values (no change)', () {
      // Arrange
      const originalState = RegisterState(
        user: User(name: 'John Doe'),
        isLoading: true,
      );

      // Act
      final newState = originalState.copyWith();

      // Assert
      expect(newState.user, equals(originalState.user));
      expect(newState.session, equals(originalState.session));
      expect(newState.isLoading, equals(originalState.isLoading));
    });

    test('should copy with null session (preserves original session)', () {
      // Arrange
      const originalState = RegisterState(
        session: Session(
          id: 'session-id',
          token: 'test-token',
          expiresAt: '2024-12-31T23:59:59Z',
          userId: 'user-id',
        ),
      );

      // Act
      final newState = originalState.copyWith(session: null);

      // Assert
      expect(newState.user, equals(originalState.user));
      expect(
        newState.session,
        equals(originalState.session),
      ); // copyWith doesn't handle null properly
      expect(newState.isLoading, equals(originalState.isLoading));
    });

    test('should maintain immutability', () {
      // Arrange
      const originalState = RegisterState();
      const newUser = User(name: 'John Doe');

      // Act
      final newState = originalState.copyWith(user: newUser);

      // Assert
      expect(originalState.user, equals(const User()));
      expect(newState.user, equals(newUser));
      expect(originalState, isNot(same(newState)));
    });

    test('should handle empty user', () {
      // Arrange
      const user = User();

      // Act
      const state = RegisterState(user: user);

      // Assert
      expect(state.user.name, equals(''));
      expect(state.user.email, equals(''));
      expect(state.user.password, equals(''));
      expect(state.user.documentType, equals(''));
      expect(state.user.documentNumber, equals(0));
      expect(state.user.address, equals(''));
      expect(state.user.phone, equals(''));
      expect(state.user.role, equals(Role.ADMIN));
    });

    test('should handle user with all fields', () {
      // Arrange
      const user = User(
        name: 'John Doe',
        documentType: 'CC',
        documentNumber: 12345678,
        address: '123 Main St',
        phone: '+1234567890',
        email: 'john@example.com',
        password: 'password123',
        role: Role.USER,
      );

      // Act
      const state = RegisterState(user: user);

      // Assert
      expect(state.user.name, equals('John Doe'));
      expect(state.user.documentType, equals('CC'));
      expect(state.user.documentNumber, equals(12345678));
      expect(state.user.address, equals('123 Main St'));
      expect(state.user.phone, equals('+1234567890'));
      expect(state.user.email, equals('john@example.com'));
      expect(state.user.password, equals('password123'));
      expect(state.user.role, equals(Role.USER));
    });

    test('should handle session with user', () {
      // Arrange
      const session = Session(
        id: 'session-id',
        token: 'test-token',
        expiresAt: '2024-12-31T23:59:59Z',
        userId: 'user-id',
      );

      // Act
      const state = RegisterState(session: session);

      // Assert
      expect(state.session?.token, equals('test-token'));
    });

    test('should handle loading states', () {
      // Arrange
      const loadingState = RegisterState(isLoading: true);
      const notLoadingState = RegisterState(isLoading: false);

      // Assert
      expect(loadingState.isLoading, equals(true));
      expect(notLoadingState.isLoading, equals(false));
    });
  });
}
