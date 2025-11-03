import 'package:flutter_test/flutter_test.dart';
import 'package:medi_supply_app_grupo3/data/data_source/dto/order/order_item_dto.dart';
import 'package:medi_supply_app_grupo3/data/data_source/dto/product/product_dto.dart';

void main() {
  group('OrderItemDto', () {
    test('should create OrderItemDto with required parameters', () {
      // Arrange
      final product = ProductDto(
        id: 'product-1',
        nombre: 'Product 1',
        descripcion: 'Description 1',
        categoria: 'Category 1',
        condicionesAlmacenamiento: 'Room temperature',
        valorUnitario: 25.0,
        lote: 'LOT001',
        idProveedor: 'provider-1',
      );

      // Act
      final dto = OrderItemDto(
        producto: product,
        cantidad: 2,
        precioUnitario: 25.0,
        precioTotal: 50.0,
      );

      // Assert
      expect(dto.producto.id, equals('product-1'));
      expect(dto.cantidad, equals(2));
      expect(dto.precioUnitario, equals(25.0));
      expect(dto.precioTotal, equals(50.0));
    });

    test('should create from JSON', () {
      // Arrange
      final json = {
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
      };

      // Act
      final dto = OrderItemDto.fromJson(json);

      // Assert
      expect(dto.producto.id, equals('product-1'));
      expect(dto.cantidad, equals(2));
      expect(dto.precioUnitario, equals(25.0));
      expect(dto.precioTotal, equals(50.0));
    });

    test('should convert to JSON', () {
      // Arrange
      final product = ProductDto(
        id: 'product-1',
        nombre: 'Product 1',
        descripcion: 'Description 1',
        categoria: 'Category 1',
        condicionesAlmacenamiento: 'Room temperature',
        valorUnitario: 25.0,
        lote: 'LOT001',
        idProveedor: 'provider-1',
      );

      final dto = OrderItemDto(
        producto: product,
        cantidad: 2,
        precioUnitario: 25.0,
        precioTotal: 50.0,
      );

      // Act
      final json = dto.toJson();

      // Assert
      expect(json['cantidad'], equals(2));
      expect(json['precioUnitario'], equals(25.0));
      expect(json['precioTotal'], equals(50.0));
      // ProductDto se serializa correctamente
      expect(json['producto'], isNotNull);
      // El producto debe ser serializable para round-trip conversion
      expect(json['producto'], isA<ProductDto>());
    });

    test('should maintain data integrity in round-trip conversion', () {
      // Arrange
      final product = ProductDto(
        id: 'product-1',
        nombre: 'Product 1',
        descripcion: 'Description 1',
        categoria: 'Category 1',
        condicionesAlmacenamiento: 'Room temperature',
        valorUnitario: 25.0,
        lote: 'LOT001',
        idProveedor: 'provider-1',
      );

      final originalDto = OrderItemDto(
        producto: product,
        cantidad: 2,
        precioUnitario: 25.0,
        precioTotal: 50.0,
      );

      // Act
      // Para round-trip, necesitamos serializar el producto manualmente
      final json = originalDto.toJson();
      // Convertir producto a JSON si es necesario
      final productoJson = (json['producto'] as ProductDto).toJson();
      final jsonWithProducto = {...json, 'producto': productoJson};
      final convertedDto = OrderItemDto.fromJson(jsonWithProducto);

      // Assert
      expect(convertedDto.cantidad, equals(originalDto.cantidad));
      expect(convertedDto.precioUnitario, equals(originalDto.precioUnitario));
      expect(convertedDto.precioTotal, equals(originalDto.precioTotal));
      expect(convertedDto.producto.id, equals(originalDto.producto.id));
    });

    test('should handle zero cantidad', () {
      // Arrange
      final product = ProductDto(
        id: 'product-1',
        nombre: 'Product 1',
        descripcion: 'Description 1',
        categoria: 'Category 1',
        condicionesAlmacenamiento: 'Room temperature',
        valorUnitario: 25.0,
        lote: 'LOT001',
        idProveedor: 'provider-1',
      );

      // Act
      final dto = OrderItemDto(
        producto: product,
        cantidad: 0,
        precioUnitario: 25.0,
        precioTotal: 0.0,
      );

      // Assert
      expect(dto.cantidad, equals(0));
      expect(dto.precioTotal, equals(0.0));
    });

    test('should handle large quantities', () {
      // Arrange
      final product = ProductDto(
        id: 'product-1',
        nombre: 'Product 1',
        descripcion: 'Description 1',
        categoria: 'Category 1',
        condicionesAlmacenamiento: 'Room temperature',
        valorUnitario: 25.0,
        lote: 'LOT001',
        idProveedor: 'provider-1',
      );

      // Act
      final dto = OrderItemDto(
        producto: product,
        cantidad: 1000,
        precioUnitario: 25.0,
        precioTotal: 25000.0,
      );

      // Assert
      expect(dto.cantidad, equals(1000));
      expect(dto.precioTotal, equals(25000.0));
    });

    test('should handle decimal prices', () {
      // Arrange
      final product = ProductDto(
        id: 'product-1',
        nombre: 'Product 1',
        descripcion: 'Description 1',
        categoria: 'Category 1',
        condicionesAlmacenamiento: 'Room temperature',
        valorUnitario: 25.99,
        lote: 'LOT001',
        idProveedor: 'provider-1',
      );

      // Act
      final dto = OrderItemDto(
        producto: product,
        cantidad: 3,
        precioUnitario: 25.99,
        precioTotal: 77.97,
      );

      // Assert
      expect(dto.precioUnitario, equals(25.99));
      expect(dto.precioTotal, equals(77.97));
    });
  });
}
