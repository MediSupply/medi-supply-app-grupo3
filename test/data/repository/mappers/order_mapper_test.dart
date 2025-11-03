import 'package:flutter_test/flutter_test.dart';
import 'package:medi_supply_app_grupo3/data/data_source/dto/order/order_dto.dart';
import 'package:medi_supply_app_grupo3/data/data_source/dto/order/order_item_dto.dart';
import 'package:medi_supply_app_grupo3/data/data_source/dto/product/product_dto.dart';
import 'package:medi_supply_app_grupo3/data/repository/entity/order/order.dart';
import 'package:medi_supply_app_grupo3/data/repository/entity/order/order_item.dart';
import 'package:medi_supply_app_grupo3/data/repository/entity/product/product.dart';
import 'package:medi_supply_app_grupo3/data/repository/mappers/order_mapper.dart';

void main() {
  group('OrderMapper', () {
    group('OrderDtoToEntityMapper', () {
      test('should convert OrderDto to Order entity', () {
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
        final entity = dto.toEntity();

        // Assert
        expect(entity.id, equals('order-123'));
        expect(entity.valor, equals(150.0));
        expect(entity.estado, equals('CREADO'));
        expect(entity.fechaCreacion, equals('2024-01-01T00:00:00Z'));
        expect(entity.fechaEntregaEstimada, equals('2024-01-04T00:00:00Z'));
        expect(entity.direccionEntrega, equals('Calle 123 #45-67'));
        expect(entity.items, isEmpty);
      });

      test('should convert OrderDto with items to Order entity', () {
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

        final dto = OrderDto(
          id: 'order-123',
          valor: 50.0,
          estado: 'CREADO',
          fechaCreacion: '2024-01-01T00:00:00Z',
          fechaEntregaEstimada: '2024-01-04T00:00:00Z',
          direccionEntrega: 'Calle 123',
          items: items,
        );

        // Act
        final entity = dto.toEntity();

        // Assert
        expect(entity.items.length, equals(1));
        expect(entity.items.first.cantidad, equals(2));
        expect(entity.items.first.precioUnitario, equals(25.0));
        expect(entity.items.first.precioTotal, equals(50.0));
      });
    });

    group('OrderEntityToDtoMapper', () {
      test('should convert Order entity to OrderDto', () {
        // Arrange
        const entity = Order(
          id: 'order-123',
          valor: 150.0,
          estado: 'CREADO',
          fechaCreacion: '2024-01-01T00:00:00Z',
          fechaEntregaEstimada: '2024-01-04T00:00:00Z',
          direccionEntrega: 'Calle 123 #45-67',
          items: [],
        );

        // Act
        final dto = entity.toDto();

        // Assert
        expect(dto.id, equals('order-123'));
        expect(dto.valor, equals(150.0));
        expect(dto.estado, equals('CREADO'));
        expect(dto.fechaCreacion, equals('2024-01-01T00:00:00Z'));
        expect(dto.fechaEntregaEstimada, equals('2024-01-04T00:00:00Z'));
        expect(dto.direccionEntrega, equals('Calle 123 #45-67'));
        expect(dto.items, isEmpty);
      });

      test('should convert Order entity with items to OrderDto', () {
        // Arrange
        final items = [
          const OrderItem(
            producto: Product(
              id: 'product-1',
              nombre: 'Product 1',
              valorUnitario: 25.0,
            ),
            cantidad: 2,
            precioUnitario: 25.0,
            precioTotal: 50.0,
          ),
        ];

        final entity = Order(
          id: 'order-123',
          valor: 50.0,
          estado: 'CREADO',
          fechaCreacion: '2024-01-01T00:00:00Z',
          fechaEntregaEstimada: '2024-01-04T00:00:00Z',
          direccionEntrega: 'Calle 123',
          items: items,
        );

        // Act
        final dto = entity.toDto();

        // Assert
        expect(dto.items.length, equals(1));
        expect(dto.items.first.cantidad, equals(2));
        expect(dto.items.first.precioUnitario, equals(25.0));
        expect(dto.items.first.precioTotal, equals(50.0));
      });
    });

    group('Round-trip conversion', () {
      test(
        'should maintain data integrity when converting DTO to Entity and back',
        () {
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
          final entity = originalDto.toEntity();
          final convertedDto = entity.toDto();

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
        },
      );

      test(
        'should maintain data integrity when converting Entity to DTO and back',
        () {
          // Arrange
          const originalEntity = Order(
            id: 'order-123',
            valor: 150.0,
            estado: 'CREADO',
            fechaCreacion: '2024-01-01T00:00:00Z',
            fechaEntregaEstimada: '2024-01-04T00:00:00Z',
            direccionEntrega: 'Calle 123 #45-67',
            items: [],
          );

          // Act
          final dto = originalEntity.toDto();
          final convertedEntity = dto.toEntity();

          // Assert
          expect(convertedEntity.id, equals(originalEntity.id));
          expect(convertedEntity.valor, equals(originalEntity.valor));
          expect(convertedEntity.estado, equals(originalEntity.estado));
          expect(
            convertedEntity.fechaCreacion,
            equals(originalEntity.fechaCreacion),
          );
          expect(
            convertedEntity.fechaEntregaEstimada,
            equals(originalEntity.fechaEntregaEstimada),
          );
          expect(
            convertedEntity.direccionEntrega,
            equals(originalEntity.direccionEntrega),
          );
        },
      );
    });
  });
}
