import 'package:dio/dio.dart';
import '../api_response.dart';

mixin ApiResponseHandlerMixin {
  Future<ApiResponse<T>> handleApiCall<T>(Future<T> apiRequest) async {
    try {
      final T response = await apiRequest;
      return ApiSuccess<T>(data: response);
    } on DioException catch (dioException) {
      final Map<String, dynamic> error =
          dioException.response?.data is Map<String, dynamic>
          ? dioException.response!.data as Map<String, dynamic>
          : <String, dynamic>{};
      return switch (dioException.type) {
        DioExceptionType.badResponse => ApiFailure(
          message: dioException.message ?? '',
          statusCode: dioException.response?.statusCode ?? 500,
          error: error,
        ),
        DioExceptionType.connectionError => ApiFailure(
          message: dioException.message ?? '',
          statusCode: dioException.response?.statusCode ?? 500,
          error: error,
        ),
        DioExceptionType.connectionTimeout => ApiFailure(
          message: dioException.message ?? '',
          statusCode: dioException.response?.statusCode ?? 500,
          error: error,
        ),
        DioExceptionType.sendTimeout => ApiFailure(
          message: dioException.message ?? '',
          statusCode: dioException.response?.statusCode ?? 500,
          error: error,
        ),
        DioExceptionType.receiveTimeout => ApiFailure(
          message: dioException.message ?? '',
          statusCode: dioException.response?.statusCode ?? 500,
          error: error,
        ),
        DioExceptionType.badCertificate => ApiFailure(
          message: dioException.message ?? '',
          statusCode: dioException.response?.statusCode ?? 500,
          error: error,
        ),
        DioExceptionType.cancel => ApiFailure(
          message: dioException.message ?? '',
          statusCode: dioException.response?.statusCode ?? 500,
          error: error,
        ),
        DioExceptionType.unknown => ApiFailure(
          message: dioException.message ?? '',
          statusCode: dioException.response?.statusCode ?? 500,
          error: error,
        ),
      };
    }
  }
}
