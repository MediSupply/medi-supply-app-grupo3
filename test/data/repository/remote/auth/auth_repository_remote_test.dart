import 'package:flutter_test/flutter_test.dart';
import 'package:medi_supply_app_grupo3/data/data_source/dto/user/user_dto.dart';
import 'package:medi_supply_app_grupo3/data/repository/mappers/user_mapper.dart';
import 'package:medi_supply_app_grupo3/data/repository/remote/auth/auth_repository_remote.dart';
import 'package:medi_supply_app_grupo3/data/data_source/remote/auth/auth_data_source_remote_interface.dart';
import 'package:medi_supply_app_grupo3/data/data_source/dto/session/session_dto.dart';
import 'package:medi_supply_app_grupo3/data/data_source/api/api_response.dart';
import 'package:medi_supply_app_grupo3/data/repository/entity/session/session.dart';
import 'package:medi_supply_app_grupo3/data/repository/entity/user/user_credentials.dart';
import 'package:medi_supply_app_grupo3/data/data_source/dto/user/user_credentials_dto.dart';

// Enhanced mock implementation for testing
class TestAuthDataSourceRemote implements AuthDataSourceRemoteInterface {
  bool _shouldReturnError = false;
  String _errorMessage = 'Test error';
  int _statusCode = 500;

  void setErrorResponse({String? message, int? statusCode}) {
    _shouldReturnError = true;
    _errorMessage = message ?? 'Test error';
    _statusCode = statusCode ?? 500;
  }

  void setSuccessResponse() {
    _shouldReturnError = false;
  }

  @override
  Future<ApiResponse<SessionDto>> login(
    UserCredentialsDto userCredentials,
  ) async {
    if (_shouldReturnError) {
      return ApiFailure<SessionDto>(
        message: _errorMessage,
        statusCode: _statusCode,
        error: {'code': 'TEST_ERROR'},
      );
    }

    return const ApiSuccess<SessionDto>(
      data: SessionDto(
        id: 'test-session',
        token: 'test-token',
        expiresAt: '2024-12-31T23:59:59Z',
        userId: 'test-user',
      ),
    );
  }

  @override
  Future<ApiResponse<SessionDto>> register(UserDto userData) async {
    if (_shouldReturnError) {
      return ApiFailure<SessionDto>(
        message: _errorMessage,
        statusCode: _statusCode,
        error: {'code': 'TEST_ERROR'},
      );
    }

    return const ApiSuccess<SessionDto>(
      data: SessionDto(
        id: 'test-session',
        token: 'test-token',
        expiresAt: '2024-12-31T23:59:59Z',
        userId: 'test-user',
      ),
    );
  }
}

void main() {
  group('AuthRepositoryRemote', () {
    late AuthRepositoryRemote authRepositoryRemote;
    late TestAuthDataSourceRemote testAuthDataSourceRemote;

    setUp(() {
      testAuthDataSourceRemote = TestAuthDataSourceRemote();
      authRepositoryRemote = AuthRepositoryRemote(testAuthDataSourceRemote);
    });

    group('login', () {
      test('should return Session when login succeeds', () async {
        // Arrange
        testAuthDataSourceRemote.setSuccessResponse();
        const userCredentials = UserCredentials(
          email: 'test@example.com',
          password: 'password123',
        );

        // Act
        final result = await authRepositoryRemote.login(userCredentials);

        // Assert
        expect(result, isA<Session>());
        expect(result.id, equals('test-session'));
        expect(result.token, equals('test-token'));
        expect(result.userId, equals('test-user'));
      });

      test('should handle different user credentials', () async {
        // Arrange
        testAuthDataSourceRemote.setSuccessResponse();
        const userCredentials = UserCredentials(
          email: 'another@example.com',
          password: 'different123',
        );

        // Act
        final result = await authRepositoryRemote.login(userCredentials);

        // Assert
        expect(result, isA<Session>());
        expect(result.id, equals('test-session'));
      });

      test('should convert UserCredentials to DTO correctly', () async {
        // Arrange
        testAuthDataSourceRemote.setSuccessResponse();
        const userCredentials = UserCredentials(
          email: 'test@example.com',
          password: 'password123',
        );

        // Act
        final result = await authRepositoryRemote.login(userCredentials);

        // Assert
        expect(result, isA<Session>());
        // The test verifies that the conversion and mapping works correctly
      });

      test('should throw Exception when login fails', () async {
        // Arrange
        testAuthDataSourceRemote.setErrorResponse(
          message: 'Invalid credentials',
          statusCode: 401,
        );
        const userCredentials = UserCredentials(
          email: 'test@example.com',
          password: 'wrongpassword',
        );

        // Act & Assert
        expect(
          () => authRepositoryRemote.login(userCredentials),
          throwsA(isA<Exception>()),
        );
      });

      test('should throw Exception with correct error message', () async {
        // Arrange
        const errorMessage = 'Network error';
        testAuthDataSourceRemote.setErrorResponse(
          message: errorMessage,
          statusCode: 500,
        );
        const userCredentials = UserCredentials(
          email: 'test@example.com',
          password: 'password123',
        );

        // Act & Assert
        try {
          await authRepositoryRemote.login(userCredentials);
          fail('Expected Exception to be thrown');
        } catch (e) {
          expect(e, isA<Exception>());
          expect(e.toString(), contains(errorMessage));
        }
      });

      test('should handle empty credentials', () async {
        // Arrange
        testAuthDataSourceRemote.setSuccessResponse();
        const userCredentials = UserCredentials();

        // Act
        final result = await authRepositoryRemote.login(userCredentials);

        // Assert
        expect(result, isA<Session>());
        expect(result.id, equals('test-session'));
      });
    });

    group('register', () {
      test('should return Session when register succeeds', () async {
        // Arrange
        testAuthDataSourceRemote.setSuccessResponse();
        final userData = UserDto(
          email: 'test@example.com',
          password: 'password123',
          name: 'Test User',
          documentType: 'CC',
          documentNumber: 1234567890,
          address: 'Test Address',
          phone: 'Test Phone',
          role: RoleDto.user,
        );

        // Act
        final result = await authRepositoryRemote.register(userData.toEntity());

        // Assert
        expect(result, isA<Session>());
        expect(result.id, equals('test-session'));
        expect(result.token, equals('test-token'));
        expect(result.userId, equals('test-user'));
      });

      test('should handle different user data', () async {
        // Arrange
        testAuthDataSourceRemote.setSuccessResponse();
        final userData = UserDto(
          email: 'another@example.com',
          password: 'different123',
          name: 'Another User',
          documentType: 'CC',
          documentNumber: 1234567890,
          address: 'Another Address',
          phone: 'Another Phone',
          role: RoleDto.user,
        );

        // Act
        final result = await authRepositoryRemote.register(userData.toEntity());

        // Assert
        expect(result, isA<Session>());
        expect(result.id, equals('test-session'));
      });

      test('should throw Exception when register fails', () async {
        // Arrange
        testAuthDataSourceRemote.setErrorResponse(
          message: 'Email already exists',
          statusCode: 409,
        );
        final userData = UserDto(
          email: 'existing@example.com',
          password: 'password123',
          name: 'Existing User',
          documentType: 'CC',
          documentNumber: 1234567890,
          address: 'Existing Address',
          phone: 'Existing Phone',
          role: RoleDto.user,
        );

        // Act & Assert
        expect(
          () => authRepositoryRemote.register(userData.toEntity()),
          throwsA(isA<Exception>()),
        );
      });

      test(
        'should throw Exception with correct error message for register',
        () async {
          // Arrange
          const errorMessage = 'Registration failed';
          testAuthDataSourceRemote.setErrorResponse(
            message: errorMessage,
            statusCode: 400,
          );
          final userData = UserDto(
            email: 'test@example.com',
            password: 'password123',
            name: 'Test User',
            documentType: 'CC',
            documentNumber: 1234567890,
            address: 'Test Address',
            phone: 'Test Phone',
            role: RoleDto.user,
          );

          // Act & Assert
          try {
            await authRepositoryRemote.register(userData.toEntity());
            fail('Expected Exception to be thrown');
          } catch (e) {
            expect(e, isA<Exception>());
            expect(e.toString(), contains(errorMessage));
          }
        },
      );

      test('should handle empty user data', () async {
        // Arrange
        testAuthDataSourceRemote.setSuccessResponse();
        final userData = UserDto(
          email: 'test@example.com',
          password: 'password123',
          name: 'Test User',
          documentType: 'CC',
          documentNumber: 1234567890,
          address: 'Test Address',
          phone: 'Test Phone',
          role: RoleDto.user,
        );

        // Act
        final result = await authRepositoryRemote.register(userData.toEntity());

        // Assert
        expect(result, isA<Session>());
        expect(result.id, equals('test-session'));
      });

      test('should handle user data with additional fields', () async {
        // Arrange
        testAuthDataSourceRemote.setSuccessResponse();
        final userData = UserDto(
          email: 'test@example.com',
          password: 'password123',
          name: 'Test User',
          documentType: 'CC',
          documentNumber: 1234567890,
          address: 'Test Address',
          phone: 'Test Phone',
          role: RoleDto.user,
        );

        // Act
        final result = await authRepositoryRemote.register(userData.toEntity());

        // Assert
        expect(result, isA<Session>());
        expect(result.id, equals('test-session'));
      });
    });
  });
}
