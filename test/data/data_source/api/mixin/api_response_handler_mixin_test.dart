import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:medi_supply_app_grupo3/data/data_source/api/mixin/api_response_handler_mixin.dart';
import 'package:medi_supply_app_grupo3/data/data_source/api/api_response.dart';

class TestApiResponseHandler with ApiResponseHandlerMixin {}

void main() {
  group('ApiResponseHandlerMixin', () {
    late TestApiResponseHandler handler;

    setUp(() {
      handler = TestApiResponseHandler();
    });

    group('handleApiCall', () {
      test('should return ApiSuccess when API call succeeds', () async {
        // Arrange
        Future<String> successfulApiCall() async {
          return 'success data';
        }

        // Act
        final result = await handler.handleApiCall(successfulApiCall());

        // Assert
        expect(result, isA<ApiSuccess<String>>());
        result.when(
          onSuccess: (data) => expect(data, equals('success data')),
          onFailure: (message, statusCode, error) =>
              fail('Should not call onFailure'),
        );
      });

      test(
        'should return ApiFailure when DioException with badResponse occurs',
        () async {
          // Arrange
          Future<String> failingApiCall() async {
            throw DioException(
              requestOptions: RequestOptions(path: '/test'),
              response: Response(
                requestOptions: RequestOptions(path: '/test'),
                statusCode: 400,
                data: {'error': 'Bad Request'},
              ),
              type: DioExceptionType.badResponse,
              message: 'Bad Request',
            );
          }

          // Act
          final result = await handler.handleApiCall(failingApiCall());

          // Assert
          expect(result, isA<ApiFailure<String>>());
          result.when(
            onSuccess: (data) => fail('Should not call onSuccess'),
            onFailure: (message, statusCode, error) {
              expect(message, equals('Bad Request'));
              expect(statusCode, equals(400));
              expect(error, equals({'error': 'Bad Request'}));
            },
          );
        },
      );

      test(
        'should return ApiFailure when DioException with connectionError occurs',
        () async {
          // Arrange
          Future<String> failingApiCall() async {
            throw DioException(
              requestOptions: RequestOptions(path: '/test'),
              type: DioExceptionType.connectionError,
              message: 'Connection Error',
            );
          }

          // Act
          final result = await handler.handleApiCall(failingApiCall());

          // Assert
          expect(result, isA<ApiFailure<String>>());
          result.when(
            onSuccess: (data) => fail('Should not call onSuccess'),
            onFailure: (message, statusCode, error) {
              expect(message, equals('Connection Error'));
              expect(statusCode, equals(500));
              expect(error, isA<Map<String, dynamic>>());
            },
          );
        },
      );

      test(
        'should return ApiFailure when DioException with connectionTimeout occurs',
        () async {
          // Arrange
          Future<String> failingApiCall() async {
            throw DioException(
              requestOptions: RequestOptions(path: '/test'),
              type: DioExceptionType.connectionTimeout,
              message: 'Connection Timeout',
            );
          }

          // Act
          final result = await handler.handleApiCall(failingApiCall());

          // Assert
          expect(result, isA<ApiFailure<String>>());
          result.when(
            onSuccess: (data) => fail('Should not call onSuccess'),
            onFailure: (message, statusCode, error) {
              expect(message, equals('Connection Timeout'));
              expect(statusCode, equals(500));
              expect(error, isA<Map<String, dynamic>>());
            },
          );
        },
      );

      test(
        'should return ApiFailure when DioException with sendTimeout occurs',
        () async {
          // Arrange
          Future<String> failingApiCall() async {
            throw DioException(
              requestOptions: RequestOptions(path: '/test'),
              type: DioExceptionType.sendTimeout,
              message: 'Send Timeout',
            );
          }

          // Act
          final result = await handler.handleApiCall(failingApiCall());

          // Assert
          expect(result, isA<ApiFailure<String>>());
          result.when(
            onSuccess: (data) => fail('Should not call onSuccess'),
            onFailure: (message, statusCode, error) {
              expect(message, equals('Send Timeout'));
              expect(statusCode, equals(500));
              expect(error, isA<Map<String, dynamic>>());
            },
          );
        },
      );

      test(
        'should return ApiFailure when DioException with receiveTimeout occurs',
        () async {
          // Arrange
          Future<String> failingApiCall() async {
            throw DioException(
              requestOptions: RequestOptions(path: '/test'),
              type: DioExceptionType.receiveTimeout,
              message: 'Receive Timeout',
            );
          }

          // Act
          final result = await handler.handleApiCall(failingApiCall());

          // Assert
          expect(result, isA<ApiFailure<String>>());
          result.when(
            onSuccess: (data) => fail('Should not call onSuccess'),
            onFailure: (message, statusCode, error) {
              expect(message, equals('Receive Timeout'));
              expect(statusCode, equals(500));
              expect(error, isA<Map<String, dynamic>>());
            },
          );
        },
      );

      test(
        'should return ApiFailure when DioException with badCertificate occurs',
        () async {
          // Arrange
          Future<String> failingApiCall() async {
            throw DioException(
              requestOptions: RequestOptions(path: '/test'),
              type: DioExceptionType.badCertificate,
              message: 'Bad Certificate',
            );
          }

          // Act
          final result = await handler.handleApiCall(failingApiCall());

          // Assert
          expect(result, isA<ApiFailure<String>>());
          result.when(
            onSuccess: (data) => fail('Should not call onSuccess'),
            onFailure: (message, statusCode, error) {
              expect(message, equals('Bad Certificate'));
              expect(statusCode, equals(500));
              expect(error, isA<Map<String, dynamic>>());
            },
          );
        },
      );

      test(
        'should return ApiFailure when DioException with cancel occurs',
        () async {
          // Arrange
          Future<String> failingApiCall() async {
            throw DioException(
              requestOptions: RequestOptions(path: '/test'),
              type: DioExceptionType.cancel,
              message: 'Request Cancelled',
            );
          }

          // Act
          final result = await handler.handleApiCall(failingApiCall());

          // Assert
          expect(result, isA<ApiFailure<String>>());
          result.when(
            onSuccess: (data) => fail('Should not call onSuccess'),
            onFailure: (message, statusCode, error) {
              expect(message, equals('Request Cancelled'));
              expect(statusCode, equals(500));
              expect(error, isA<Map<String, dynamic>>());
            },
          );
        },
      );

      test(
        'should return ApiFailure when DioException with unknown occurs',
        () async {
          // Arrange
          Future<String> failingApiCall() async {
            throw DioException(
              requestOptions: RequestOptions(path: '/test'),
              type: DioExceptionType.unknown,
              message: 'Unknown Error',
            );
          }

          // Act
          final result = await handler.handleApiCall(failingApiCall());

          // Assert
          expect(result, isA<ApiFailure<String>>());
          result.when(
            onSuccess: (data) => fail('Should not call onSuccess'),
            onFailure: (message, statusCode, error) {
              expect(message, equals('Unknown Error'));
              expect(statusCode, equals(500));
              expect(error, isA<Map<String, dynamic>>());
            },
          );
        },
      );

      test('should handle DioException with null message', () async {
        // Arrange
        Future<String> failingApiCall() async {
          throw DioException(
            requestOptions: RequestOptions(path: '/test'),
            type: DioExceptionType.badResponse,
            message: null,
          );
        }

        // Act
        final result = await handler.handleApiCall(failingApiCall());

        // Assert
        expect(result, isA<ApiFailure<String>>());
        result.when(
          onSuccess: (data) => fail('Should not call onSuccess'),
          onFailure: (message, statusCode, error) {
            expect(message, equals(''));
            expect(statusCode, equals(500));
            expect(error, isA<Map<String, dynamic>>());
          },
        );
      });
    });
  });
}
