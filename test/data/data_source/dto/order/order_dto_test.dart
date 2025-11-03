import 'package:flutter_test/flutter_test.dart';
import 'package:medi_supply_app_grupo3/data/data_source/dto/order/order_dto.dart';
import 'package:medi_supply_app_grupo3/data/data_source/dto/order/order_item_dto.dart';
import 'package:medi_supply_app_grupo3/data/data_source/dto/product/product_dto.dart';

void main() {
  group('OrderDto', () {
    test('should create OrderDto with required parameters', () {
      // Arrange & Act
      final dto = OrderDto(
        id: 'order-123',
        valor: 150.0,
        estado: 'CREADO',
        fechaCreacion: '2024-01-01T00:00:00Z',
        fechaEntregaEstimada: '2024-01-04T00:00:00Z',
        direccionEntrega: 'Calle 123 #45-67',
        items: [],
      );

      // Assert
      expect(dto.id, equals('order-123'));
      expect(dto.valor, equals(150.0));
      expect(dto.estado, equals('CREADO'));
      expect(dto.fechaCreacion, equals('2024-01-01T00:00:00Z'));
      expect(dto.fechaEntregaEstimada, equals('2024-01-04T00:00:00Z'));
      expect(dto.direccionEntrega, equals('Calle 123 #45-67'));
      expect(dto.items, isEmpty);
    });

    test('should create OrderDto with items', () {
      // Arrange
      final items = [
        OrderItemDto(
          producto: ProductDto(
            id: 'product-1',
            nombre: 'Product 1',
            descripcion: 'Description 1',
            categoria: 'Category 1',
            condicionesAlmacenamiento: 'Room temperature',
            valorUnitario: 25.0,
            lote: 'LOT001',
            idProveedor: 'provider-1',
          ),
          cantidad: 2,
          precioUnitario: 25.0,
          precioTotal: 50.0,
        ),
      ];

      // Act
      final dto = OrderDto(
        id: 'order-123',
        valor: 50.0,
        estado: 'CREADO',
        fechaCreacion: '2024-01-01T00:00:00Z',
        fechaEntregaEstimada: '2024-01-04T00:00:00Z',
        direccionEntrega: 'Calle 123',
        items: items,
      );

      // Assert
      expect(dto.items.length, equals(1));
      expect(dto.items.first.cantidad, equals(2));
    });

    test('should create from JSON', () {
      // Arrange
      final json = {
        'id': 'order-123',
        'valor': 150.0,
        'estado': 'CREADO',
        'fecha_creacion': '2024-01-01T00:00:00Z',
        'fecha_entrega_estimada': '2024-01-04T00:00:00Z',
        'direccion_entrega': 'Calle 123 #45-67',
        'items': [],
      };

      // Act
      final dto = OrderDto.fromJson(json);

      // Assert
      expect(dto.id, equals('order-123'));
      expect(dto.valor, equals(150.0));
      expect(dto.estado, equals('CREADO'));
      expect(dto.fechaCreacion, equals('2024-01-01T00:00:00Z'));
      expect(dto.fechaEntregaEstimada, equals('2024-01-04T00:00:00Z'));
      expect(dto.direccionEntrega, equals('Calle 123 #45-67'));
    });

    test('should convert to JSON', () {
      // Arrange
      final dto = OrderDto(
        id: 'order-123',
        valor: 150.0,
        estado: 'CREADO',
        fechaCreacion: '2024-01-01T00:00:00Z',
        fechaEntregaEstimada: '2024-01-04T00:00:00Z',
        direccionEntrega: 'Calle 123 #45-67',
        items: [],
      );

      // Act
      final json = dto.toJson();

      // Assert
      expect(json['id'], equals('order-123'));
      expect(json['valor'], equals(150.0));
      expect(json['estado'], equals('CREADO'));
      expect(json['fecha_creacion'], equals('2024-01-01T00:00:00Z'));
      expect(json['fecha_entrega_estimada'], equals('2024-01-04T00:00:00Z'));
      expect(json['direccion_entrega'], equals('Calle 123 #45-67'));
    });

    test('should maintain data integrity in round-trip conversion', () {
      // Arrange
      final originalDto = OrderDto(
        id: 'order-123',
        valor: 150.0,
        estado: 'CREADO',
        fechaCreacion: '2024-01-01T00:00:00Z',
        fechaEntregaEstimada: '2024-01-04T00:00:00Z',
        direccionEntrega: 'Calle 123 #45-67',
        items: [],
      );

      // Act
      final json = originalDto.toJson();
      final convertedDto = OrderDto.fromJson(json);

      // Assert
      expect(convertedDto.id, equals(originalDto.id));
      expect(convertedDto.valor, equals(originalDto.valor));
      expect(convertedDto.estado, equals(originalDto.estado));
      expect(convertedDto.fechaCreacion, equals(originalDto.fechaCreacion));
      expect(
        convertedDto.fechaEntregaEstimada,
        equals(originalDto.fechaEntregaEstimada),
      );
      expect(
        convertedDto.direccionEntrega,
        equals(originalDto.direccionEntrega),
      );
    });

    test('should handle different order states', () {
      // Arrange & Act
      final estados = ['CREADO', 'EN_PROCESO', 'ENVIADO', 'ENTREGADO'];

      for (final estado in estados) {
        final dto = OrderDto(
          id: 'order-123',
          valor: 150.0,
          estado: estado,
          fechaCreacion: '2024-01-01T00:00:00Z',
          fechaEntregaEstimada: '2024-01-04T00:00:00Z',
          direccionEntrega: 'Calle 123',
          items: [],
        );

        // Assert
        expect(dto.estado, equals(estado));
      }
    });

    test('should handle zero value', () {
      // Arrange & Act
      final dto = OrderDto(
        id: 'order-123',
        valor: 0.0,
        estado: 'CREADO',
        fechaCreacion: '2024-01-01T00:00:00Z',
        fechaEntregaEstimada: '2024-01-04T00:00:00Z',
        direccionEntrega: 'Calle 123',
        items: [],
      );

      // Assert
      expect(dto.valor, equals(0.0));
    });

    test('should handle large values', () {
      // Arrange & Act
      final dto = OrderDto(
        id: 'order-123',
        valor: 999999.99,
        estado: 'CREADO',
        fechaCreacion: '2024-01-01T00:00:00Z',
        fechaEntregaEstimada: '2024-01-04T00:00:00Z',
        direccionEntrega: 'Calle 123',
        items: [],
      );

      // Assert
      expect(dto.valor, equals(999999.99));
    });
  });
}
