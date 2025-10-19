import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medi_supply_app_grupo3/application/networking/networking.dart';

void main() {
  group('Networking', () {
    test('should be a singleton', () {
      // Act
      final instance1 = Networking();
      final instance2 = Networking();
      final instance3 = Networking.instance;

      // Assert
      expect(instance1, same(instance2));
      expect(instance1, same(instance3));
      expect(instance2, same(instance3));
    });

    test('should have Dio instance configured', () {
      // Arrange
      final networking = Networking();

      // Act
      final dio = networking.dio;

      // Assert
      expect(dio, isA<Dio>());
      expect(dio.options.baseUrl, equals('http://127.0.0.1:5001'));
      expect(dio.options.connectTimeout, equals(const Duration(seconds: 10)));
      expect(dio.options.receiveTimeout, equals(const Duration(seconds: 10)));
    });

    test('should have correct base URL', () {
      // Arrange
      final networking = Networking();

      // Act
      final baseUrl = networking.dio.options.baseUrl;

      // Assert
      expect(baseUrl, equals('http://127.0.0.1:5001'));
    });

    test('should have correct timeout configuration', () {
      // Arrange
      final networking = Networking();

      // Act
      final connectTimeout = networking.dio.options.connectTimeout;
      final receiveTimeout = networking.dio.options.receiveTimeout;

      // Assert
      expect(connectTimeout, equals(const Duration(seconds: 10)));
      expect(receiveTimeout, equals(const Duration(seconds: 10)));
    });

    test('should maintain same Dio instance across multiple calls', () {
      // Arrange
      final networking1 = Networking();
      final networking2 = Networking();

      // Act
      final dio1 = networking1.dio;
      final dio2 = networking2.dio;

      // Assert
      expect(dio1, same(dio2));
    });

    test('should have instance getter return same instance', () {
      // Arrange
      final networking = Networking();

      // Act
      final instance = Networking.instance;

      // Assert
      expect(networking, same(instance));
    });

    test('should configure Dio with BaseOptions', () {
      // Arrange
      final networking = Networking();

      // Act
      final options = networking.dio.options;

      // Assert
      expect(options, isA<BaseOptions>());
      expect(options.baseUrl, equals('http://127.0.0.1:5001'));
      expect(options.connectTimeout, equals(const Duration(seconds: 10)));
      expect(options.receiveTimeout, equals(const Duration(seconds: 10)));
    });

    test('should be late initialized', () {
      // Arrange
      final networking = Networking();

      // Act & Assert
      expect(() => networking.dio, returnsNormally);
      expect(networking.dio, isNotNull);
    });

    test('should have private constructor', () {
      // This test verifies that the private constructor exists
      // by ensuring the singleton pattern works correctly

      // Arrange & Act
      final instance1 = Networking();
      final instance2 = Networking();

      // Assert
      expect(instance1, same(instance2));
    });

    test('should have static instance getter', () {
      // Arrange & Act
      final instance = Networking.instance;

      // Assert
      expect(instance, isA<Networking>());
    });

    test(
      'should maintain singleton behavior across multiple instantiations',
      () {
        // Arrange
        final instances = <Networking>[];

        // Act
        for (int i = 0; i < 5; i++) {
          instances.add(Networking());
        }

        // Assert
        for (int i = 1; i < instances.length; i++) {
          expect(instances[0], same(instances[i]));
        }
      },
    );
  });
}
