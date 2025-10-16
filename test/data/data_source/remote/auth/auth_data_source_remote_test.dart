import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:medi_supply_app_grupo3/data/data_source/remote/auth/auth_data_source_remote.dart';
import 'package:medi_supply_app_grupo3/data/data_source/dto/session/session_dto.dart';
import 'package:medi_supply_app_grupo3/data/data_source/dto/user/user_credentials_dto.dart';
import 'package:medi_supply_app_grupo3/data/data_source/api/api_response.dart';
import 'package:medi_supply_app_grupo3/data/services/auth/auth_service.dart';

class MockAuthService extends Mock implements AuthService {}

void main() {
  group('AuthDataSourceRemote', () {
    late AuthDataSourceRemote authDataSourceRemote;
    late Dio mockDio;

    setUp(() {
      mockDio = Dio();
      authDataSourceRemote = AuthDataSourceRemote(mockDio);
    });

    group('login', () {
      test('should return ApiSuccess when login succeeds', () async {
        // Arrange
        final userCredentialsDto = UserCredentialsDto(
          email: 'test@example.com',
          password: 'password123',
        );

        // Act
        final result = await authDataSourceRemote.login(userCredentialsDto);

        // Assert
        expect(result, isA<ApiResponse<SessionDto>>());
      });

      test('should handle login with valid credentials', () async {
        // Arrange
        final userCredentialsDto = UserCredentialsDto(
          email: 'test@example.com',
          password: 'password123',
        );

        // Act
        final result = await authDataSourceRemote.login(userCredentialsDto);

        // Assert
        expect(result, isA<ApiResponse<SessionDto>>());
      });
    });

    group('register', () {
      test('should handle register with user data', () async {
        // Arrange
        const userData = {
          'email': 'test@example.com',
          'password': 'password123',
          'name': 'Test User',
        };

        // Act
        final result = await authDataSourceRemote.register(userData);

        // Assert
        expect(result, isA<ApiResponse<SessionDto>>());
      });
    });
  });
}
