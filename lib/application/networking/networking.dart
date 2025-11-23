import 'package:dio/dio.dart';

class Networking {
  static final Networking _instance = Networking._internal();
  factory Networking() => _instance;
  late final Dio dio;
  Networking._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://127.0.0.1:5001',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
  }

  static Networking get instance => _instance;

  static void addAuthorizationHeader(String token) {
    _instance.dio.options.headers.addAll({
      'User-Agent': 'MediSupplyApp/1.0.0',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
  }

  static void removeAuthorizationHeader() {
    _instance.dio.options.headers.clear();
  }
}
