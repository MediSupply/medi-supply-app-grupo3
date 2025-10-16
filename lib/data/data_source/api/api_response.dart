sealed class ApiResponse<T> {
  const ApiResponse();

  R when<R>({
    R Function(T data)? onSuccess,
    R Function(String message, int statusCode, Map<String, dynamic> error)?
    onFailure,
  });
}

class ApiSuccess<T> extends ApiResponse<T> {
  final T data;

  const ApiSuccess({required this.data});

  @override
  R when<R>({
    R Function(T data)? onSuccess,
    R Function(String message, int statusCode, Map<String, dynamic> error)?
    onFailure,
  }) {
    return onSuccess != null
        ? onSuccess(data)
        : throw UnimplementedError('ApiSuccess: onSuccess is required');
  }
}

class ApiFailure<T> extends ApiResponse<T> {
  final String message;
  final int statusCode;
  final Map<String, dynamic> error;

  const ApiFailure({
    required this.message,
    required this.statusCode,
    required this.error,
  });

  @override
  R when<R>({
    R Function(T data)? onSuccess,
    R Function(String message, int statusCode, Map<String, dynamic> error)?
    onFailure,
  }) {
    return onFailure != null
        ? onFailure(message, statusCode, error)
        : throw UnimplementedError('ApiFailure: onFailure is required');
  }
}
