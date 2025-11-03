import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medi_supply_app_grupo3/data/services/product/product_service.dart';

void main() {
  group('ProductService', () {
    late ProductService productService;
    late Dio dio;

    setUp(() {
      // Create Dio with non-existent baseUrl to prevent real HTTP calls
      dio = Dio();
      dio.options.baseUrl = 'http://localhost:9999';
      dio.options.connectTimeout = const Duration(milliseconds: 1);
      productService = ProductService(dio);
    });

    test('should be instantiable', () {
      // Arrange & Act
      final service = ProductService(dio);

      // Assert
      expect(service, isA<ProductService>());
    });

    test('should create service with Dio instance', () {
      // Arrange & Act
      final service = ProductService(dio);

      // Assert
      expect(service, isA<ProductService>());
    });

    test('should create service with custom baseUrl', () {
      // Arrange & Act
      final service = ProductService(dio, baseUrl: 'https://api.example.com');

      // Assert
      expect(service, isA<ProductService>());
    });

    test('should be instantiable multiple times', () {
      // Arrange & Act
      final service1 = ProductService(dio);
      final service2 = ProductService(dio);

      // Assert
      expect(service1, isA<ProductService>());
      expect(service2, isA<ProductService>());
      // They should be different instances
      expect(service1, isNot(same(service2)));
    });

    group('getProducts', () {
      test('should have getProducts method defined', () {
        // Arrange & Act & Assert
        expect(productService.getProducts, isA<Function>());
        expect(
          productService.getProducts,
          isA<Future<List<dynamic>> Function()>(),
        );
      });
    });

    group('createProduct', () {
      test('should have createProduct method defined', () {
        // Arrange & Act & Assert
        expect(productService.createProduct, isA<Function>());
      });
    });
  });
}
