import 'package:flutter_test/flutter_test.dart';
import 'package:medi_supply_app_grupo3/presentation/login/view_model/state/login_state.dart';
import 'package:medi_supply_app_grupo3/data/repository/entity/user/user_credentials.dart';
import 'package:medi_supply_app_grupo3/data/repository/entity/session/session.dart';

void main() {
  group('LoginState', () {
    test('should create LoginState with default values', () {
      // Arrange & Act
      const loginState = LoginState();

      // Assert
      expect(loginState.userCredentials, equals(const UserCredentials()));
      expect(loginState.session, isNull);
      expect(loginState.isLoading, isFalse);
    });

    test('should create LoginState with custom values', () {
      // Arrange
      const userCredentials = UserCredentials(
        email: 'test@example.com',
        password: 'password123',
      );
      const session = Session(
        id: 'session123',
        token: 'token123',
        expiresAt: '2024-12-31T23:59:59Z',
        userId: 'user123',
      );

      // Act
      const loginState = LoginState(
        userCredentials: userCredentials,
        session: session,
        isLoading: true,
      );

      // Assert
      expect(loginState.userCredentials, equals(userCredentials));
      expect(loginState.session, equals(session));
      expect(loginState.isLoading, isTrue);
    });

    group('copyWith', () {
      test('should create new instance with updated userCredentials', () {
        // Arrange
        const originalState = LoginState();
        const newUserCredentials = UserCredentials(
          email: 'new@example.com',
          password: 'newpassword',
        );

        // Act
        final newState = originalState.copyWith(
          userCredentials: newUserCredentials,
        );

        // Assert
        expect(newState.userCredentials, equals(newUserCredentials));
        expect(newState.session, equals(originalState.session));
        expect(newState.isLoading, equals(originalState.isLoading));
      });

      test('should create new instance with updated session', () {
        // Arrange
        const originalState = LoginState();
        const newSession = Session(
          id: 'newsession123',
          token: 'newtoken123',
          expiresAt: '2024-12-31T23:59:59Z',
          userId: 'user123',
        );

        // Act
        final newState = originalState.copyWith(session: newSession);

        // Assert
        expect(newState.userCredentials, equals(originalState.userCredentials));
        expect(newState.session, equals(newSession));
        expect(newState.isLoading, equals(originalState.isLoading));
      });

      test('should create new instance with updated isLoading', () {
        // Arrange
        const originalState = LoginState();

        // Act
        final newState = originalState.copyWith(isLoading: true);

        // Assert
        expect(newState.userCredentials, equals(originalState.userCredentials));
        expect(newState.session, equals(originalState.session));
        expect(newState.isLoading, isTrue);
      });

      test('should create new instance with multiple updates', () {
        // Arrange
        const originalState = LoginState();
        const newUserCredentials = UserCredentials(
          email: 'test@example.com',
          password: 'password123',
        );
        const newSession = Session(
          id: 'session123',
          token: 'token123',
          expiresAt: '2024-12-31T23:59:59Z',
          userId: 'user123',
        );

        // Act
        final newState = originalState.copyWith(
          userCredentials: newUserCredentials,
          session: newSession,
          isLoading: true,
        );

        // Assert
        expect(newState.userCredentials, equals(newUserCredentials));
        expect(newState.session, equals(newSession));
        expect(newState.isLoading, isTrue);
      });

      test('should preserve original values when null is passed', () {
        // Arrange
        const originalUserCredentials = UserCredentials(
          email: 'test@example.com',
          password: 'password123',
        );
        const originalSession = Session(
          id: 'session123',
          token: 'token123',
          expiresAt: '2024-12-31T23:59:59Z',
          userId: 'user123',
        );
        const originalState = LoginState(
          userCredentials: originalUserCredentials,
          session: originalSession,
          isLoading: true,
        );

        // Act
        final newState = originalState.copyWith();

        // Assert
        expect(newState.userCredentials, equals(originalUserCredentials));
        expect(newState.session, equals(originalSession));
        expect(newState.isLoading, isTrue);
      });

      test('should handle null session in copyWith', () {
        // Arrange
        const originalSession = Session(
          id: 'session123',
          token: 'token123',
          expiresAt: '2024-12-31T23:59:59Z',
          userId: 'user123',
        );
        const originalState = LoginState(session: originalSession);

        // Act
        final newState = originalState.copyWith(session: null);

        // Assert
        expect(newState.userCredentials, equals(originalState.userCredentials));
        // Note: With ?? operator, null ?? originalSession = originalSession
        // So we expect the original session to be preserved
        expect(newState.session, equals(originalSession));
        expect(newState.isLoading, equals(originalState.isLoading));
      });
    });
  });
}
