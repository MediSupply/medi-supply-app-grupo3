import 'package:flutter_test/flutter_test.dart';
import 'package:medi_supply_app_grupo3/data/repository/remote/order/order_repository_remote.dart';
import 'package:medi_supply_app_grupo3/data/data_source/remote/order/order_data_source_remote_interface.dart';
import 'package:medi_supply_app_grupo3/data/data_source/dto/order/order_dto.dart';
import 'package:medi_supply_app_grupo3/data/data_source/api/api_response.dart';
import 'package:medi_supply_app_grupo3/data/repository/entity/order/order.dart';

// Enhanced mock implementation for testing
class TestOrderDataSourceRemote implements OrderDataSourceRemoteInterface {
  bool _shouldReturnError = false;
  String _errorMessage = 'Test error';
  int _statusCode = 500;
  List<OrderDto> _orders = [];

  void setErrorResponse({String? message, int? statusCode}) {
    _shouldReturnError = true;
    _errorMessage = message ?? 'Test error';
    _statusCode = statusCode ?? 500;
  }

  void setSuccessResponse() {
    _shouldReturnError = false;
  }

  void setOrders(List<OrderDto> orders) {
    _orders = orders;
  }

  @override
  Future<ApiResponse<List<OrderDto>>> getOrders() async {
    if (_shouldReturnError) {
      return ApiFailure<List<OrderDto>>(
        message: _errorMessage,
        statusCode: _statusCode,
        error: {'code': 'TEST_ERROR'},
      );
    }

    return ApiSuccess<List<OrderDto>>(data: _orders);
  }

  @override
  Future<ApiResponse<OrderDto>> createOrder(OrderDto order) async {
    if (_shouldReturnError) {
      return ApiFailure<OrderDto>(
        message: _errorMessage,
        statusCode: _statusCode,
        error: {'code': 'TEST_ERROR'},
      );
    }

    return ApiSuccess<OrderDto>(
      data: OrderDto(
        id: 'order-123',
        valor: order.valor,
        estado: order.estado,
        fechaCreacion: order.fechaCreacion,
        fechaEntregaEstimada: order.fechaEntregaEstimada,
        direccionEntrega: order.direccionEntrega,
        items: order.items,
      ),
    );
  }
}

void main() {
  group('OrderRepositoryRemote', () {
    late OrderRepositoryRemote orderRepositoryRemote;
    late TestOrderDataSourceRemote testOrderDataSourceRemote;

    setUp(() {
      testOrderDataSourceRemote = TestOrderDataSourceRemote();
      orderRepositoryRemote = OrderRepositoryRemote(testOrderDataSourceRemote);
    });

    group('getOrders', () {
      test('should return List<Order> when getOrders succeeds', () async {
        // Arrange
        testOrderDataSourceRemote.setSuccessResponse();
        testOrderDataSourceRemote.setOrders([
          OrderDto(
            id: 'order-1',
            valor: 150.0,
            estado: 'CREADO',
            fechaCreacion: '2024-01-01T00:00:00Z',
            fechaEntregaEstimada: '2024-01-04T00:00:00Z',
            direccionEntrega: 'Calle 123',
            items: [],
          ),
        ]);

        // Act
        final result = await orderRepositoryRemote.getOrders();

        // Assert
        expect(result, isA<List<Order>>());
        expect(result.length, equals(1));
        expect(result.first.id, equals('order-1'));
        expect(result.first.valor, equals(150.0));
      });

      test('should return empty list when no orders', () async {
        // Arrange
        testOrderDataSourceRemote.setSuccessResponse();
        testOrderDataSourceRemote.setOrders([]);

        // Act
        final result = await orderRepositoryRemote.getOrders();

        // Assert
        expect(result, isA<List<Order>>());
        expect(result, isEmpty);
      });

      test('should throw Exception when getOrders fails', () async {
        // Arrange
        testOrderDataSourceRemote.setErrorResponse(
          message: 'Failed to get orders',
          statusCode: 500,
        );

        // Act & Assert
        expect(
          () => orderRepositoryRemote.getOrders(),
          throwsA(isA<Exception>()),
        );
      });
    });

    group('createOrder', () {
      test('should return Order when createOrder succeeds', () async {
        // Arrange
        testOrderDataSourceRemote.setSuccessResponse();
        const order = Order(
          id: '',
          valor: 150.0,
          estado: 'CREADO',
          fechaCreacion: '2024-01-01T00:00:00Z',
          fechaEntregaEstimada: '2024-01-04T00:00:00Z',
          direccionEntrega: 'Calle 123 #45-67',
          items: [],
        );

        // Act
        final result = await orderRepositoryRemote.createOrder(order);

        // Assert
        expect(result, isA<Order>());
        expect(result.valor, equals(150.0));
        expect(result.estado, equals('CREADO'));
      });

      test('should throw Exception when createOrder fails', () async {
        // Arrange
        testOrderDataSourceRemote.setErrorResponse(
          message: 'Order creation failed',
          statusCode: 400,
        );
        const order = Order(valor: 150.0, estado: 'CREADO');

        // Act & Assert
        expect(
          () => orderRepositoryRemote.createOrder(order),
          throwsA(isA<Exception>()),
        );
      });

      test('should convert Order to DTO correctly', () async {
        // Arrange
        testOrderDataSourceRemote.setSuccessResponse();
        const order = Order(
          id: '',
          valor: 200.0,
          estado: 'CREADO',
          fechaCreacion: '2024-01-01T00:00:00Z',
          fechaEntregaEstimada: '2024-01-04T00:00:00Z',
          direccionEntrega: 'Test Address',
          items: [],
        );

        // Act
        final result = await orderRepositoryRemote.createOrder(order);

        // Assert
        expect(result, isA<Order>());
        expect(result.valor, equals(200.0));
      });

      test('should handle different order states', () async {
        // Arrange
        testOrderDataSourceRemote.setSuccessResponse();
        const order = Order(estado: 'CREADO');

        // Act
        final result = await orderRepositoryRemote.createOrder(order);

        // Assert
        expect(result, isA<Order>());
      });
    });
  });
}
