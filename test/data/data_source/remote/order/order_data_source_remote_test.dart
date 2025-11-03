import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:medi_supply_app_grupo3/data/data_source/remote/order/order_data_source_remote.dart';
import 'package:medi_supply_app_grupo3/data/data_source/dto/order/order_dto.dart';
import 'package:medi_supply_app_grupo3/data/data_source/dto/order/order_item_dto.dart';
import 'package:medi_supply_app_grupo3/data/data_source/dto/product/product_dto.dart';
import 'package:medi_supply_app_grupo3/data/data_source/api/api_response.dart';

void main() {
  group('OrderDataSourceRemote', () {
    late OrderDataSourceRemote orderDataSourceRemote;
    late Dio mockDio;
    late DioAdapter dioAdapter;

    setUp(() {
      // Use a mock Dio with http_mock_adapter to intercept HTTP calls
      mockDio = Dio();
      mockDio.options.baseUrl = 'http://localhost:9999';
      dioAdapter = DioAdapter(dio: mockDio);
      orderDataSourceRemote = OrderDataSourceRemote(mockDio);
    });

    group('getOrders', () {
      test(
        'should return ApiSuccess with orders list when request succeeds',
        () async {
          // Arrange
          final mockOrders = [
            {
              'id': 'order-1',
              'valor': 100.0,
              'fecha_creacion': '2024-12-25T00:00:00Z',
              'fecha_entrega_estimada': '2024-12-31T00:00:00Z',
              'direccion_entrega': 'Address 1',
              'estado': 'PENDIENTE',
              'items': [],
            },
            {
              'id': 'order-2',
              'valor': 200.0,
              'fecha_creacion': '2024-12-24T00:00:00Z',
              'fecha_entrega_estimada': '2024-12-30T00:00:00Z',
              'direccion_entrega': 'Address 2',
              'estado': 'ENTREGADO',
              'items': [],
            },
          ];

          dioAdapter.onGet(
            '/ordenes',
            (server) => server.reply(200, mockOrders),
          );

          // Act
          final result = await orderDataSourceRemote.getOrders();

          // Assert
          expect(result, isA<ApiResponse<List<OrderDto>>>());
          result.when(
            onSuccess: (data) {
              expect(data, isA<List<OrderDto>>());
              expect(data.length, equals(2));
              expect(data[0].id, equals('order-1'));
              expect(data[1].id, equals('order-2'));
            },
            onFailure: (message, statusCode, error) =>
                fail('Expected success but got failure: $message'),
          );
        },
      );

      test('should return ApiFailure when request fails', () async {
        // Arrange
        dioAdapter.onGet(
          '/ordenes',
          (server) => server.reply(500, {'error': 'Internal Server Error'}),
        );

        // Act
        final result = await orderDataSourceRemote.getOrders();

        // Assert
        expect(result, isA<ApiResponse<List<OrderDto>>>());
        result.when(
          onSuccess: (data) => fail('Expected failure but got success'),
          onFailure: (message, statusCode, error) {
            expect(statusCode, equals(500));
            expect(message, isNotEmpty);
          },
        );
      });

      test('should return ApiFailure when connection error occurs', () async {
        // Arrange
        dioAdapter.onGet(
          '/ordenes',
          (server) => server.throws(
            0,
            DioException.connectionError(
              requestOptions: RequestOptions(path: '/ordenes'),
              reason: 'Connection failed',
            ),
          ),
        );

        // Act
        final result = await orderDataSourceRemote.getOrders();

        // Assert
        expect(result, isA<ApiResponse<List<OrderDto>>>());
        result.when(
          onSuccess: (data) => fail('Expected failure but got success'),
          onFailure: (message, statusCode, error) {
            expect(statusCode, equals(500));
          },
        );
      });
    });

    group('createOrder', () {
      test(
        'should return ApiSuccess with created order when request succeeds',
        () async {
          // Arrange
          final productDto = ProductDto(
            id: 'product-1',
            nombre: 'Product 1',
            descripcion: 'Description 1',
            categoria: 'Category 1',
            condicionesAlmacenamiento: 'Room temperature',
            valorUnitario: 25.0,
            lote: 'LOT001',
            idProveedor: 'provider-1',
          );

          final orderItemDto = OrderItemDto(
            producto: productDto,
            cantidad: 2,
            precioUnitario: 25.0,
            precioTotal: 50.0,
          );

          final orderDto = OrderDto(
            id: 'order-1',
            valor: 50.0,
            estado: 'PENDIENTE',
            fechaCreacion: DateTime.now().toIso8601String(),
            fechaEntregaEstimada: DateTime.now()
                .add(const Duration(days: 7))
                .toIso8601String(),
            direccionEntrega: 'Address 1',
            items: [orderItemDto],
          );

          // Create mock response with proper structure
          // ProductDto serializes directly, so we include it as an object
          final mockResponse = {
            'id': 'order-1',
            'valor': 50.0,
            'fecha_creacion': orderDto.fechaCreacion,
            'fecha_entrega_estimada': orderDto.fechaEntregaEstimada,
            'direccion_entrega': 'Address 1',
            'estado': 'PENDIENTE',
            'items': [
              {
                'producto': {
                  'id': 'product-1',
                  'nombre': 'Product 1',
                  'descripcion': 'Description 1',
                  'categoria': 'Category 1',
                  'condiciones_almacenamiento': 'Room temperature',
                  'valor_unitario': 25.0,
                  'lote': 'LOT001',
                  'id_proveedor': 'provider-1',
                },
                'cantidad': 2,
                'precioUnitario': 25.0,
                'precioTotal': 50.0,
              },
            ],
          };

          dioAdapter.onPost(
            '/ordenes',
            (server) => server.reply(201, mockResponse),
            data: Matchers.any,
          );

          // Act
          final result = await orderDataSourceRemote.createOrder(orderDto);

          // Assert
          expect(result, isA<ApiResponse<OrderDto>>());
          result.when(
            onSuccess: (data) {
              expect(data, isA<OrderDto>());
              expect(data.id, equals('order-1'));
              expect(data.valor, equals(50.0));
            },
            onFailure: (message, statusCode, error) => fail(
              'Expected success but got failure: $message (status: $statusCode)',
            ),
          );
        },
      );

      test('should return ApiFailure when create request fails', () async {
        // Arrange
        final productDto = ProductDto(
          id: 'product-1',
          nombre: 'Product 1',
          descripcion: 'Description 1',
          categoria: 'Category 1',
          condicionesAlmacenamiento: 'Room temperature',
          valorUnitario: 25.0,
          lote: 'LOT001',
          idProveedor: 'provider-1',
        );

        final orderItemDto = OrderItemDto(
          producto: productDto,
          cantidad: 2,
          precioUnitario: 25.0,
          precioTotal: 50.0,
        );

        final orderDto = OrderDto(
          id: 'order-1',
          valor: 50.0,
          estado: 'PENDIENTE',
          fechaCreacion: DateTime.now().toIso8601String(),
          fechaEntregaEstimada: DateTime.now()
              .add(const Duration(days: 7))
              .toIso8601String(),
          direccionEntrega: 'Address 1',
          items: [orderItemDto],
        );

        dioAdapter.onPost(
          '/ordenes',
          (server) => server.reply(400, {'error': 'Bad Request'}),
        );

        // Act
        final result = await orderDataSourceRemote.createOrder(orderDto);

        // Assert
        expect(result, isA<ApiResponse<OrderDto>>());
        result.when(
          onSuccess: (data) => fail('Expected failure but got success'),
          onFailure: (message, statusCode, error) {
            expect(statusCode, greaterThanOrEqualTo(400));
          },
        );
      });

      test('should return ApiFailure when request times out', () async {
        // Arrange
        final productDto = ProductDto(
          id: 'product-1',
          nombre: 'Product 1',
          descripcion: 'Description 1',
          categoria: 'Category 1',
          condicionesAlmacenamiento: 'Room temperature',
          valorUnitario: 25.0,
          lote: 'LOT001',
          idProveedor: 'provider-1',
        );

        final orderItemDto = OrderItemDto(
          producto: productDto,
          cantidad: 2,
          precioUnitario: 25.0,
          precioTotal: 50.0,
        );

        final orderDto = OrderDto(
          id: 'order-1',
          valor: 50.0,
          estado: 'PENDIENTE',
          fechaCreacion: DateTime.now().toIso8601String(),
          fechaEntregaEstimada: DateTime.now()
              .add(const Duration(days: 7))
              .toIso8601String(),
          direccionEntrega: 'Address 1',
          items: [orderItemDto],
        );

        dioAdapter.onPost(
          '/ordenes',
          (server) => server.throws(
            0,
            DioException.connectionTimeout(
              timeout: const Duration(milliseconds: 1),
              requestOptions: RequestOptions(path: '/ordenes'),
            ),
          ),
        );

        // Act
        final result = await orderDataSourceRemote.createOrder(orderDto);

        // Assert
        expect(result, isA<ApiResponse<OrderDto>>());
        result.when(
          onSuccess: (data) => fail('Expected failure but got success'),
          onFailure: (message, statusCode, error) {
            expect(statusCode, equals(500));
          },
        );
      });
    });
  });
}
