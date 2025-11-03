import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:medi_supply_app_grupo3/data/data_source/remote/product/product_data_source_remote.dart';
import 'package:medi_supply_app_grupo3/data/data_source/dto/product/product_dto.dart';
import 'package:medi_supply_app_grupo3/data/data_source/api/api_response.dart';

void main() {
  group('ProductDataSourceRemote', () {
    late ProductDataSourceRemote productDataSourceRemote;
    late Dio mockDio;
    late DioAdapter dioAdapter;

    setUp(() {
      // Use a mock Dio with http_mock_adapter to intercept HTTP calls
      mockDio = Dio();
      mockDio.options.baseUrl = 'http://localhost:9999';
      dioAdapter = DioAdapter(dio: mockDio);
      productDataSourceRemote = ProductDataSourceRemote(mockDio);
    });

    group('getProducts', () {
      test(
        'should return ApiSuccess with products list when request succeeds',
        () async {
          // Arrange
          final mockProducts = [
            {
              'id': 'product-1',
              'nombre': 'Product 1',
              'descripcion': 'Description 1',
              'categoria': 'Category 1',
              'condiciones_almacenamiento': 'Room temperature',
              'valor_unitario': 25.0,
              'lote': 'LOT001',
              'id_proveedor': 'provider-1',
            },
            {
              'id': 'product-2',
              'nombre': 'Product 2',
              'descripcion': 'Description 2',
              'categoria': 'Category 2',
              'condiciones_almacenamiento': 'Cold',
              'valor_unitario': 50.0,
              'lote': 'LOT002',
              'id_proveedor': 'provider-2',
            },
          ];

          dioAdapter.onGet(
            '/productos',
            (server) => server.reply(200, mockProducts),
          );

          // Act
          final result = await productDataSourceRemote.getProducts();

          // Assert
          expect(result, isA<ApiResponse<List<ProductDto>>>());
          result.when(
            onSuccess: (data) {
              expect(data, isA<List<ProductDto>>());
              expect(data.length, equals(2));
              expect(data[0].id, equals('product-1'));
              expect(data[1].id, equals('product-2'));
            },
            onFailure: (message, statusCode, error) =>
                fail('Expected success but got failure: $message'),
          );
        },
      );

      test(
        'should return ApiFailure when request fails with bad response',
        () async {
          // Arrange
          dioAdapter.onGet(
            '/productos',
            (server) => server.reply(500, {'error': 'Internal Server Error'}),
          );

          // Act
          final result = await productDataSourceRemote.getProducts();

          // Assert
          expect(result, isA<ApiResponse<List<ProductDto>>>());
          result.when(
            onSuccess: (data) => fail('Expected failure but got success'),
            onFailure: (message, statusCode, error) {
              expect(statusCode, equals(500));
              expect(message, isNotEmpty);
            },
          );
        },
      );

      test(
        'should return ApiFailure when request fails with connection error',
        () async {
          // Arrange
          dioAdapter.onGet(
            '/productos',
            (server) => server.throws(
              0,
              DioException.connectionError(
                requestOptions: RequestOptions(path: '/productos'),
                reason: 'Connection failed',
              ),
            ),
          );

          // Act
          final result = await productDataSourceRemote.getProducts();

          // Assert
          expect(result, isA<ApiResponse<List<ProductDto>>>());
          result.when(
            onSuccess: (data) => fail('Expected failure but got success'),
            onFailure: (message, statusCode, error) {
              expect(statusCode, equals(500));
              // Message may be empty for connection errors
            },
          );
        },
      );
    });

    group('createProduct', () {
      test(
        'should return ApiSuccess with created product when request succeeds',
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

          final mockResponse = {
            'id': 'product-1',
            'nombre': 'Product 1',
            'descripcion': 'Description 1',
            'categoria': 'Category 1',
            'condiciones_almacenamiento': 'Room temperature',
            'valor_unitario': 25.0,
            'lote': 'LOT001',
            'id_proveedor': 'provider-1',
          };

          dioAdapter.onPost(
            '/productos',
            (server) => server.reply(200, mockResponse),
            data: Matchers.any,
          );

          // Act
          final result = await productDataSourceRemote.createProduct(
            productDto,
          );

          // Assert
          expect(result, isA<ApiResponse<ProductDto>>());
          result.when(
            onSuccess: (data) {
              expect(data, isA<ProductDto>());
              expect(data.id, equals('product-1'));
              expect(data.nombre, equals('Product 1'));
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

        dioAdapter.onPost(
          '/productos',
          (server) => server.reply(400, {'error': 'Bad Request'}),
        );

        // Act
        final result = await productDataSourceRemote.createProduct(productDto);

        // Assert
        expect(result, isA<ApiResponse<ProductDto>>());
        result.when(
          onSuccess: (data) => fail('Expected failure but got success'),
          onFailure: (message, statusCode, error) {
            // Status code may be 500 if Dio converts 400 to exception
            expect(statusCode, greaterThanOrEqualTo(400));
          },
        );
      });

      test('should return ApiFailure when create request times out', () async {
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

        dioAdapter.onPost(
          '/productos',
          (server) => server.throws(
            0,
            DioException.connectionTimeout(
              timeout: const Duration(milliseconds: 1),
              requestOptions: RequestOptions(path: '/productos'),
            ),
          ),
        );

        // Act
        final result = await productDataSourceRemote.createProduct(productDto);

        // Assert
        expect(result, isA<ApiResponse<ProductDto>>());
        result.when(
          onSuccess: (data) => fail('Expected failure but got success'),
          onFailure: (message, statusCode, error) {
            expect(statusCode, equals(500));
            // Message may be empty for timeout errors
          },
        );
      });
    });
  });
}
