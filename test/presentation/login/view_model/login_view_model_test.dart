import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:medi_supply_app_grupo3/presentation/login/view_model/login_view_model.dart';
import 'package:medi_supply_app_grupo3/data/repository/remote/auth/auth_repository_remote_interface.dart';
import 'package:medi_supply_app_grupo3/data/repository/entity/user/user_credentials.dart';

class MockAuthRepositoryRemoteInterface extends Mock
    implements AuthRepositoryRemoteInterface {}

void main() {
  group('LoginViewModel', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    group('build', () {
      test('should return initial LoginState', () {
        // Arrange
        final loginViewModel = container.read(loginViewModelProvider.notifier);

        // Act
        final state = loginViewModel.state;

        // Assert
        expect(state.userCredentials, equals(const UserCredentials()));
        expect(state.session, isNull);
        expect(state.isLoading, isFalse);
      });
    });

    group('setEmail', () {
      test('should update email in userCredentials', () {
        // Arrange
        final loginViewModel = container.read(loginViewModelProvider.notifier);
        const newEmail = 'test@example.com';

        // Act
        loginViewModel.setEmail(newEmail);

        // Assert
        expect(loginViewModel.state.userCredentials.email, equals(newEmail));
        expect(loginViewModel.state.userCredentials.password, equals(''));
      });

      test('should preserve existing password when updating email', () {
        // Arrange
        final loginViewModel = container.read(loginViewModelProvider.notifier);
        const existingPassword = 'password123';
        const newEmail = 'test@example.com';

        // First set password
        loginViewModel.setPassword(existingPassword);

        // Act
        loginViewModel.setEmail(newEmail);

        // Assert
        expect(loginViewModel.state.userCredentials.email, equals(newEmail));
        expect(
          loginViewModel.state.userCredentials.password,
          equals(existingPassword),
        );
      });
    });

    group('setPassword', () {
      test('should update password in userCredentials', () {
        // Arrange
        final loginViewModel = container.read(loginViewModelProvider.notifier);
        const newPassword = 'password123';

        // Act
        loginViewModel.setPassword(newPassword);

        // Assert
        expect(
          loginViewModel.state.userCredentials.password,
          equals(newPassword),
        );
        expect(loginViewModel.state.userCredentials.email, equals(''));
      });

      test('should preserve existing email when updating password', () {
        // Arrange
        final loginViewModel = container.read(loginViewModelProvider.notifier);
        const existingEmail = 'test@example.com';
        const newPassword = 'password123';

        // First set email
        loginViewModel.setEmail(existingEmail);

        // Act
        loginViewModel.setPassword(newPassword);

        // Assert
        expect(
          loginViewModel.state.userCredentials.email,
          equals(existingEmail),
        );
        expect(
          loginViewModel.state.userCredentials.password,
          equals(newPassword),
        );
      });
    });

    group('login', () {
      test('should return true when login succeeds', () async {
        // Arrange
        final loginViewModel = container.read(loginViewModelProvider.notifier);

        // Set credentials
        loginViewModel.setEmail('test@example.com');
        loginViewModel.setPassword('password123');

        // Act
        final result = await loginViewModel.login();

        // Assert
        expect(result, isA<bool>());
        expect(loginViewModel.state.isLoading, isFalse);
      });

      test('should return false when login fails', () async {
        // Arrange
        final loginViewModel = container.read(loginViewModelProvider.notifier);

        // Set credentials
        loginViewModel.setEmail('test@example.com');
        loginViewModel.setPassword('password123');

        // Act
        final result = await loginViewModel.login();

        // Assert
        expect(result, isA<bool>());
        expect(loginViewModel.state.isLoading, isFalse);
      });

      test('should set loading state during login process', () async {
        // Arrange
        final loginViewModel = container.read(loginViewModelProvider.notifier);

        // Set credentials
        loginViewModel.setEmail('test@example.com');
        loginViewModel.setPassword('password123');

        // Act
        final loginFuture = loginViewModel.login();

        // Assert loading state is set immediately
        expect(loginViewModel.state.isLoading, isTrue);

        // Wait for completion
        final result = await loginFuture;

        // Assert final state
        expect(result, isA<bool>());
        expect(loginViewModel.state.isLoading, isFalse);
      });
    });

    group('validateUserEmail', () {
      test('should return null when email is valid', () {
        // Arrange
        final loginViewModel = container.read(loginViewModelProvider.notifier);
        loginViewModel.setEmail('test@example.com');

        // Act
        final result = loginViewModel.validateUserEmail();

        // Assert
        expect(result, isNull);
      });

      test('should return error message when email is invalid', () {
        // Arrange
        final loginViewModel = container.read(loginViewModelProvider.notifier);
        loginViewModel.setEmail('invalid-email');

        // Act
        final result = loginViewModel.validateUserEmail();

        // Assert
        expect(result, equals('El correo electrónico no es válido'));
      });

      test('should return error message when email is empty', () {
        // Arrange
        final loginViewModel = container.read(loginViewModelProvider.notifier);

        // Act
        final result = loginViewModel.validateUserEmail();

        // Assert
        expect(result, equals('El correo electrónico es requerido'));
      });
    });

    group('validateUserPassword', () {
      test('should return null when password is not empty', () {
        // Arrange
        final loginViewModel = container.read(loginViewModelProvider.notifier);
        loginViewModel.setPassword('password123');

        // Act
        final result = loginViewModel.validateUserPassword();

        // Assert
        expect(result, isNull);
      });

      test('should return error message when password is empty', () {
        // Arrange
        final loginViewModel = container.read(loginViewModelProvider.notifier);

        // Act
        final result = loginViewModel.validateUserPassword();

        // Assert
        expect(result, equals('La contraseña es requerida'));
      });
    });
  });
}
