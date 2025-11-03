import 'package:flutter_test/flutter_test.dart';
import 'package:medi_supply_app_grupo3/data/data_source/dto/order/order_item_dto.dart';
import 'package:medi_supply_app_grupo3/data/data_source/dto/product/product_dto.dart';
import 'package:medi_supply_app_grupo3/data/repository/entity/order/order_item.dart';
import 'package:medi_supply_app_grupo3/data/repository/entity/product/product.dart';
import 'package:medi_supply_app_grupo3/data/repository/mappers/order_item_mapper.dart';

void main() {
  group('OrderItemMapper', () {
    group('OrderItemDtoToEntityMapper', () {
      test('should convert OrderItemDto to OrderItem entity', () {
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

        final dto = OrderItemDto(
          producto: productDto,
          cantidad: 2,
          precioUnitario: 25.0,
          precioTotal: 50.0,
        );

        // Act
        final entity = dto.toEntity();

        // Assert
        expect(entity.producto.id, equals('product-1'));
        expect(entity.cantidad, equals(2));
        expect(entity.precioUnitario, equals(25.0));
        expect(entity.precioTotal, equals(50.0));
      });

      test(
        'should convert OrderItemDto with empty values to OrderItem entity',
        () {
          // Arrange
          final productDto = ProductDto(
            id: '',
            nombre: '',
            descripcion: '',
            categoria: '',
            condicionesAlmacenamiento: '',
            valorUnitario: 0.0,
            lote: '',
            idProveedor: '',
          );

          final dto = OrderItemDto(
            producto: productDto,
            cantidad: 0,
            precioUnitario: 0.0,
            precioTotal: 0.0,
          );

          // Act
          final entity = dto.toEntity();

          // Assert
          expect(entity.producto.id, equals(''));
          expect(entity.cantidad, equals(0));
          expect(entity.precioUnitario, equals(0.0));
          expect(entity.precioTotal, equals(0.0));
        },
      );
    });

    group('OrderItemEntityToDtoMapper', () {
      test('should convert OrderItem entity to OrderItemDto', () {
        // Arrange
        const entity = OrderItem(
          producto: Product(
            id: 'product-1',
            nombre: 'Product 1',
            valorUnitario: 25.0,
          ),
          cantidad: 2,
          precioUnitario: 25.0,
          precioTotal: 50.0,
        );

        // Act
        final dto = entity.toDto();

        // Assert
        expect(dto.producto.id, equals('product-1'));
        expect(dto.cantidad, equals(2));
        expect(dto.precioUnitario, equals(25.0));
        expect(dto.precioTotal, equals(50.0));
      });

      test(
        'should convert OrderItem entity with empty values to OrderItemDto',
        () {
          // Arrange
          const entity = OrderItem(
            producto: Product(),
            cantidad: 0,
            precioUnitario: 0.0,
            precioTotal: 0.0,
          );

          // Act
          final dto = entity.toDto();

          // Assert
          expect(dto.producto.id, equals(''));
          expect(dto.cantidad, equals(0));
          expect(dto.precioUnitario, equals(0.0));
          expect(dto.precioTotal, equals(0.0));
        },
      );
    });

    group('Round-trip conversion', () {
      test(
        'should maintain data integrity when converting DTO to Entity and back',
        () {
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

          final originalDto = OrderItemDto(
            producto: productDto,
            cantidad: 2,
            precioUnitario: 25.0,
            precioTotal: 50.0,
          );

          // Act
          final entity = originalDto.toEntity();
          final convertedDto = entity.toDto();

          // Assert
          expect(convertedDto.cantidad, equals(originalDto.cantidad));
          expect(
            convertedDto.precioUnitario,
            equals(originalDto.precioUnitario),
          );
          expect(convertedDto.precioTotal, equals(originalDto.precioTotal));
          expect(convertedDto.producto.id, equals(originalDto.producto.id));
        },
      );

      test(
        'should maintain data integrity when converting Entity to DTO and back',
        () {
          // Arrange
          const originalEntity = OrderItem(
            producto: Product(
              id: 'product-1',
              nombre: 'Product 1',
              valorUnitario: 25.0,
            ),
            cantidad: 2,
            precioUnitario: 25.0,
            precioTotal: 50.0,
          );

          // Act
          final dto = originalEntity.toDto();
          final convertedEntity = dto.toEntity();

          // Assert
          expect(convertedEntity.cantidad, equals(originalEntity.cantidad));
          expect(
            convertedEntity.precioUnitario,
            equals(originalEntity.precioUnitario),
          );
          expect(
            convertedEntity.precioTotal,
            equals(originalEntity.precioTotal),
          );
          expect(
            convertedEntity.producto.id,
            equals(originalEntity.producto.id),
          );
        },
      );
    });
  });
}
