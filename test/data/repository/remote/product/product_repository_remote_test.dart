import 'package:flutter_test/flutter_test.dart';
import 'package:medi_supply_app_grupo3/data/repository/remote/product/product_repository_remote.dart';
import 'package:medi_supply_app_grupo3/data/data_source/remote/product/product_data_source_remote_interface.dart';
import 'package:medi_supply_app_grupo3/data/data_source/dto/product/product_dto.dart';
import 'package:medi_supply_app_grupo3/data/data_source/api/api_response.dart';
import 'package:medi_supply_app_grupo3/data/repository/entity/product/product.dart';

// Enhanced mock implementation for testing
class TestProductDataSourceRemote implements ProductDataSourceRemoteInterface {
  bool _shouldReturnError = false;
  String _errorMessage = 'Test error';
  int _statusCode = 500;
  List<ProductDto> _products = [];

  void setErrorResponse({String? message, int? statusCode}) {
    _shouldReturnError = true;
    _errorMessage = message ?? 'Test error';
    _statusCode = statusCode ?? 500;
  }

  void setSuccessResponse() {
    _shouldReturnError = false;
  }

  void setProducts(List<ProductDto> products) {
    _products = products;
  }

  @override
  Future<ApiResponse<List<ProductDto>>> getProducts() async {
    if (_shouldReturnError) {
      return ApiFailure<List<ProductDto>>(
        message: _errorMessage,
        statusCode: _statusCode,
        error: {'code': 'TEST_ERROR'},
      );
    }

    return ApiSuccess<List<ProductDto>>(data: _products);
  }

  @override
  Future<ApiResponse<ProductDto>> createProduct(ProductDto product) async {
    if (_shouldReturnError) {
      return ApiFailure<ProductDto>(
        message: _errorMessage,
        statusCode: _statusCode,
        error: {'code': 'TEST_ERROR'},
      );
    }

    return ApiSuccess<ProductDto>(
      data: ProductDto(
        id: 'product-123',
        nombre: product.nombre,
        descripcion: product.descripcion,
        categoria: product.categoria,
        condicionesAlmacenamiento: product.condicionesAlmacenamiento,
        valorUnitario: product.valorUnitario,
        fechaVencimiento: product.fechaVencimiento,
        lote: product.lote,
        tiempoEstimadoEntrega: product.tiempoEstimadoEntrega,
        idProveedor: product.idProveedor,
      ),
    );
  }
}

void main() {
  group('ProductRepositoryRemote', () {
    late ProductRepositoryRemote productRepositoryRemote;
    late TestProductDataSourceRemote testProductDataSourceRemote;

    setUp(() {
      testProductDataSourceRemote = TestProductDataSourceRemote();
      productRepositoryRemote = ProductRepositoryRemote(
        testProductDataSourceRemote,
      );
    });

    group('getProducts', () {
      test('should return List<Product> when getProducts succeeds', () async {
        // Arrange
        testProductDataSourceRemote.setSuccessResponse();
        testProductDataSourceRemote.setProducts([
          ProductDto(
            id: 'product-1',
            nombre: 'Aspirina',
            descripcion: 'Medicamento para el dolor',
            categoria: 'Medicamento',
            condicionesAlmacenamiento: 'Lugar fresco y seco',
            valorUnitario: 25.5,
            lote: 'A1001',
            idProveedor: 'P001',
          ),
        ]);

        // Act
        final result = await productRepositoryRemote.getProducts();

        // Assert
        expect(result, isA<List<Product>>());
        expect(result.isNotEmpty, isTrue);
      });

      test('should throw Exception when getProducts fails', () async {
        // Arrange
        testProductDataSourceRemote.setErrorResponse(
          message: 'Failed to get products',
          statusCode: 500,
        );

        // Act & Assert
        expect(
          () => productRepositoryRemote.getProducts(),
          throwsA(isA<Exception>()),
        );
      });
    });

    group('createProduct', () {
      test('should return Product when createProduct succeeds', () async {
        // Arrange
        testProductDataSourceRemote.setSuccessResponse();
        final product = Product(
          id: '',
          nombre: 'Test Product',
          descripcion: 'Test Description',
          categoria: 'Test Category',
          condicionesAlmacenamiento: 'Room temperature',
          valorUnitario: 25.0,
          lote: 'LOT001',
          idProveedor: 'P001',
        );

        // Act
        final result = await productRepositoryRemote.createProduct(product);

        // Assert
        expect(result, isA<Product>());
        expect(result.nombre, equals('Test Product'));
        expect(result.valorUnitario, equals(25.0));
      });

      test('should throw Exception when createProduct fails', () async {
        // Arrange
        testProductDataSourceRemote.setErrorResponse(
          message: 'Product creation failed',
          statusCode: 400,
        );
        final product = Product(nombre: 'Test Product', valorUnitario: 25.0);

        // Act & Assert
        expect(
          () => productRepositoryRemote.createProduct(product),
          throwsA(isA<Exception>()),
        );
      });

      test('should convert Product to DTO correctly', () async {
        // Arrange
        testProductDataSourceRemote.setSuccessResponse();
        final product = Product(
          id: '',
          nombre: 'Aspirina',
          descripcion: 'Medicamento para el dolor',
          categoria: 'Medicamento',
          condicionesAlmacenamiento: 'Lugar fresco y seco',
          valorUnitario: 25.5,
          lote: 'A1001',
          idProveedor: 'P001',
        );

        // Act
        final result = await productRepositoryRemote.createProduct(product);

        // Assert
        expect(result, isA<Product>());
        expect(result.nombre, equals('Aspirina'));
      });

      test('should handle Product with optional fields', () async {
        // Arrange
        testProductDataSourceRemote.setSuccessResponse();
        final fechaVencimiento = DateTime(2025, 12, 31);
        final tiempoEstimadoEntrega = DateTime(2024, 7, 10);

        final product = Product(
          id: '',
          nombre: 'Product with dates',
          descripcion: 'Description',
          categoria: 'Category',
          condicionesAlmacenamiento: 'Storage',
          valorUnitario: 25.0,
          fechaVencimiento: fechaVencimiento,
          lote: 'LOT001',
          tiempoEstimadoEntrega: tiempoEstimadoEntrega,
          idProveedor: 'P001',
        );

        // Act
        final result = await productRepositoryRemote.createProduct(product);

        // Assert
        expect(result, isA<Product>());
        expect(result.fechaVencimiento, equals(fechaVencimiento));
        expect(result.tiempoEstimadoEntrega, equals(tiempoEstimadoEntrega));
      });
    });
  });
}
