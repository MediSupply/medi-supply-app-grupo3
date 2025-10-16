import 'package:flutter_test/flutter_test.dart';
import 'package:medi_supply_app_grupo3/data/data_source/api/api_response.dart';

void main() {
  group('ApiResponse', () {
    group('ApiSuccess', () {
      test('should create ApiSuccess with data', () {
        // Arrange & Act
        const apiSuccess = ApiSuccess<String>(data: 'test data');

        // Assert
        expect(apiSuccess.data, equals('test data'));
      });

      test('should call onSuccess callback when when is called', () {
        // Arrange
        const apiSuccess = ApiSuccess<String>(data: 'test data');
        String? result;

        // Act
        apiSuccess.when(onSuccess: (data) => result = data);

        // Assert
        expect(result, equals('test data'));
      });

      test('should throw UnimplementedError when onSuccess is null', () {
        // Arrange
        const apiSuccess = ApiSuccess<String>(data: 'test data');

        // Act & Assert
        expect(() => apiSuccess.when(), throwsA(isA<UnimplementedError>()));
      });
    });

    group('ApiFailure', () {
      test('should create ApiFailure with required parameters', () {
        // Arrange & Act
        const apiFailure = ApiFailure<String>(
          message: 'Error message',
          statusCode: 400,
          error: {'code': 'BAD_REQUEST'},
        );

        // Assert
        expect(apiFailure.message, equals('Error message'));
        expect(apiFailure.statusCode, equals(400));
        expect(apiFailure.error, equals({'code': 'BAD_REQUEST'}));
      });

      test('should call onFailure callback when when is called', () {
        // Arrange
        const apiFailure = ApiFailure<String>(
          message: 'Error message',
          statusCode: 400,
          error: {'code': 'BAD_REQUEST'},
        );
        String? message;
        int? statusCode;
        Map<String, dynamic>? error;

        // Act
        apiFailure.when(
          onFailure: (msg, code, err) {
            message = msg;
            statusCode = code;
            error = err;
          },
        );

        // Assert
        expect(message, equals('Error message'));
        expect(statusCode, equals(400));
        expect(error, equals({'code': 'BAD_REQUEST'}));
      });

      test('should throw UnimplementedError when onFailure is null', () {
        // Arrange
        const apiFailure = ApiFailure<String>(
          message: 'Error message',
          statusCode: 400,
          error: {'code': 'BAD_REQUEST'},
        );

        // Act & Assert
        expect(() => apiFailure.when(), throwsA(isA<UnimplementedError>()));
      });
    });
  });
}
