import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medi_supply_app_grupo3/data/services/order/order_service.dart';

void main() {
  group('OrderService', () {
    late OrderService orderService;
    late Dio dio;

    setUp(() {
      // Create Dio with non-existent baseUrl to prevent real HTTP calls
      dio = Dio();
      dio.options.baseUrl = 'http://localhost:9999';
      dio.options.connectTimeout = const Duration(milliseconds: 1);
      orderService = OrderService(dio);
    });

    test('should be instantiable', () {
      // Arrange & Act
      final service = OrderService(dio);

      // Assert
      expect(service, isA<OrderService>());
    });

    test('should create service with Dio instance', () {
      // Arrange & Act
      final service = OrderService(dio);

      // Assert
      expect(service, isA<OrderService>());
    });

    test('should create service with custom baseUrl', () {
      // Arrange & Act
      final service = OrderService(dio, baseUrl: 'https://api.example.com');

      // Assert
      expect(service, isA<OrderService>());
    });

    test('should be instantiable multiple times', () {
      // Arrange & Act
      final service1 = OrderService(dio);
      final service2 = OrderService(dio);

      // Assert
      expect(service1, isA<OrderService>());
      expect(service2, isA<OrderService>());
      // They should be different instances
      expect(service1, isNot(same(service2)));
    });

    group('getOrders', () {
      test('should have getOrders method defined', () {
        // Arrange & Act & Assert
        expect(orderService.getOrders, isA<Function>());
        expect(orderService.getOrders, isA<Future<List<dynamic>> Function()>());
      });
    });

    group('createOrder', () {
      test('should have createOrder method defined', () {
        // Arrange & Act & Assert
        expect(orderService.createOrder, isA<Function>());
      });
    });
  });
}
