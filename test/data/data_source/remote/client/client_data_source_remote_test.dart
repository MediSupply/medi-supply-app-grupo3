import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:medi_supply_app_grupo3/data/data_source/remote/client/client_data_source_remote.dart';
import 'package:medi_supply_app_grupo3/data/data_source/dto/client/client_dto.dart';
import 'package:medi_supply_app_grupo3/data/data_source/api/api_response.dart';

void main() {
  group('ClientDataSourceRemote', () {
    late ClientDataSourceRemote clientDataSourceRemote;
    late Dio mockDio;
    late DioAdapter dioAdapter;

    setUp(() {
      // Use a mock Dio with http_mock_adapter to intercept HTTP calls
      mockDio = Dio();
      mockDio.options.baseUrl = 'http://localhost:9999';
      dioAdapter = DioAdapter(dio: mockDio);
      clientDataSourceRemote = ClientDataSourceRemote(mockDio);
    });

    group('createClient', () {
      test(
        'should return ApiSuccess with created client when request succeeds',
        () async {
          // Arrange
          final clientDto = ClientDto(
            id: 'client-1',
            nombre: 'Client 1',
            email: 'client1@example.com',
            telefono: '123456789',
            direccion: 'Address 1',
            razonSocial: 'Company 1',
            nit: 'NIT001',
          );

          final mockResponse = {
            'id': 'client-1',
            'nombre': 'Client 1',
            'email': 'client1@example.com',
            'telefono': '123456789',
            'direccion': 'Address 1',
            'razon_social': 'Company 1',
            'nit': 'NIT001',
          };

          dioAdapter.onPost(
            '/clientes',
            (server) => server.reply(201, mockResponse),
            data: Matchers.any,
          );

          // Act
          final result = await clientDataSourceRemote.createClient(clientDto);

          // Assert
          expect(result, isA<ApiResponse<ClientDto>>());
          result.when(
            onSuccess: (data) {
              expect(data, isA<ClientDto>());
              expect(data.id, equals('client-1'));
              expect(data.nombre, equals('Client 1'));
            },
            onFailure: (message, statusCode, error) => fail(
              'Expected success but got failure: $message (status: $statusCode)',
            ),
          );
        },
      );

      test('should return ApiFailure when create request fails', () async {
        // Arrange
        final clientDto = ClientDto(
          id: 'client-1',
          nombre: 'Client 1',
          email: 'client1@example.com',
          telefono: '123456789',
          direccion: 'Address 1',
          razonSocial: 'Company 1',
          nit: 'NIT001',
        );

        dioAdapter.onPost(
          '/clientes',
          (server) => server.reply(400, {'error': 'Bad Request'}),
        );

        // Act
        final result = await clientDataSourceRemote.createClient(clientDto);

        // Assert
        expect(result, isA<ApiResponse<ClientDto>>());
        result.when(
          onSuccess: (data) => fail('Expected failure but got success'),
          onFailure: (message, statusCode, error) {
            expect(statusCode, greaterThanOrEqualTo(400));
          },
        );
      });

      test('should return ApiFailure when request times out', () async {
        // Arrange
        final clientDto = ClientDto(
          id: 'client-1',
          nombre: 'Client 1',
          email: 'client1@example.com',
          telefono: '123456789',
          direccion: 'Address 1',
          razonSocial: 'Company 1',
          nit: 'NIT001',
        );

        dioAdapter.onPost(
          '/clientes',
          (server) => server.throws(
            0,
            DioException.connectionTimeout(
              timeout: const Duration(milliseconds: 1),
              requestOptions: RequestOptions(path: '/clientes'),
            ),
          ),
        );

        // Act
        final result = await clientDataSourceRemote.createClient(clientDto);

        // Assert
        expect(result, isA<ApiResponse<ClientDto>>());
        result.when(
          onSuccess: (data) => fail('Expected failure but got success'),
          onFailure: (message, statusCode, error) {
            expect(statusCode, equals(500));
          },
        );
      });
    });

    group('getClients', () {
      test(
        'should return ApiSuccess with clients list when request succeeds',
        () async {
          // Arrange
          final mockClients = [
            {
              'id': 'client-1',
              'nombre': 'Client 1',
              'email': 'client1@example.com',
              'telefono': '123456789',
              'direccion': 'Address 1',
              'razon_social': 'Company 1',
              'nit': 'NIT001',
            },
            {
              'id': 'client-2',
              'nombre': 'Client 2',
              'email': 'client2@example.com',
              'telefono': '987654321',
              'direccion': 'Address 2',
              'razon_social': 'Company 2',
              'nit': 'NIT002',
            },
          ];

          dioAdapter.onGet(
            '/clientes',
            (server) => server.reply(200, mockClients),
          );

          // Act
          final result = await clientDataSourceRemote.getClients();

          // Assert
          expect(result, isA<ApiResponse<List<ClientDto>>>());
          result.when(
            onSuccess: (data) {
              expect(data, isA<List<ClientDto>>());
              expect(data.length, equals(2));
              expect(data[0].id, equals('client-1'));
              expect(data[1].id, equals('client-2'));
            },
            onFailure: (message, statusCode, error) =>
                fail('Expected success but got failure: $message'),
          );
        },
      );

      test('should return ApiFailure when request fails', () async {
        // Arrange
        dioAdapter.onGet(
          '/clientes',
          (server) => server.reply(500, {'error': 'Internal Server Error'}),
        );

        // Act
        final result = await clientDataSourceRemote.getClients();

        // Assert
        expect(result, isA<ApiResponse<List<ClientDto>>>());
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
          '/clientes',
          (server) => server.throws(
            0,
            DioException.connectionError(
              requestOptions: RequestOptions(path: '/clientes'),
              reason: 'Connection failed',
            ),
          ),
        );

        // Act
        final result = await clientDataSourceRemote.getClients();

        // Assert
        expect(result, isA<ApiResponse<List<ClientDto>>>());
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
