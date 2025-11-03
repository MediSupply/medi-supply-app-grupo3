import 'package:flutter_test/flutter_test.dart';
import 'package:medi_supply_app_grupo3/data/data_source/dto/product/product_dto.dart';
import 'package:medi_supply_app_grupo3/data/repository/entity/product/product.dart';
import 'package:medi_supply_app_grupo3/data/repository/mappers/product_mapper.dart';

void main() {
  group('ProductMapper', () {
    group('ProductDtoToEntityMapper', () {
      test('should convert ProductDto to Product entity', () {
        // Arrange
        final dto = ProductDto(
          id: 'product-1',
          nombre: 'Aspirina',
          descripcion: 'Medicamento para el dolor',
          categoria: 'Medicamento',
          condicionesAlmacenamiento: 'Lugar fresco y seco',
          valorUnitario: 25.5,
          lote: 'A1001',
          idProveedor: 'P001',
        );

        // Act
        final entity = dto.toEntity();

        // Assert
        expect(entity.id, equals('product-1'));
        expect(entity.nombre, equals('Aspirina'));
        expect(entity.descripcion, equals('Medicamento para el dolor'));
        expect(entity.categoria, equals('Medicamento'));
        expect(entity.condicionesAlmacenamiento, equals('Lugar fresco y seco'));
        expect(entity.valorUnitario, equals(25.5));
        expect(entity.lote, equals('A1001'));
        expect(entity.idProveedor, equals('P001'));
      });

      test(
        'should convert ProductDto with optional fields to Product entity',
        () {
          // Arrange
          final fechaVencimiento = DateTime(2025, 12, 31);
          final tiempoEstimadoEntrega = DateTime(2024, 7, 10);

          final dto = ProductDto(
            id: 'product-1',
            nombre: 'Aspirina',
            descripcion: 'Medicamento para el dolor',
            categoria: 'Medicamento',
            condicionesAlmacenamiento: 'Lugar fresco y seco',
            valorUnitario: 25.5,
            fechaVencimiento: fechaVencimiento,
            lote: 'A1001',
            tiempoEstimadoEntrega: tiempoEstimadoEntrega,
            idProveedor: 'P001',
          );

          // Act
          final entity = dto.toEntity();

          // Assert
          expect(entity.fechaVencimiento, equals(fechaVencimiento));
          expect(entity.tiempoEstimadoEntrega, equals(tiempoEstimadoEntrega));
        },
      );

      test('should convert ProductDto with null optional fields', () {
        // Arrange
        final dto = ProductDto(
          id: 'product-1',
          nombre: 'Product without dates',
          descripcion: 'Description',
          categoria: 'Category',
          condicionesAlmacenamiento: 'Storage',
          valorUnitario: 25.5,
          fechaVencimiento: null,
          lote: 'LOT001',
          tiempoEstimadoEntrega: null,
          idProveedor: 'P001',
        );

        // Act
        final entity = dto.toEntity();

        // Assert
        expect(entity.fechaVencimiento, isNull);
        expect(entity.tiempoEstimadoEntrega, isNull);
      });
    });

    group('ProductEntityToDtoMapper', () {
      test('should convert Product entity to ProductDto', () {
        // Arrange
        final entity = Product(
          id: 'product-1',
          nombre: 'Aspirina',
          descripcion: 'Medicamento para el dolor',
          categoria: 'Medicamento',
          condicionesAlmacenamiento: 'Lugar fresco y seco',
          valorUnitario: 25.5,
          lote: 'A1001',
          idProveedor: 'P001',
        );

        // Act
        final dto = entity.toDto();

        // Assert
        expect(dto.id, equals('product-1'));
        expect(dto.nombre, equals('Aspirina'));
        expect(dto.descripcion, equals('Medicamento para el dolor'));
        expect(dto.categoria, equals('Medicamento'));
        expect(dto.condicionesAlmacenamiento, equals('Lugar fresco y seco'));
        expect(dto.valorUnitario, equals(25.5));
        expect(dto.lote, equals('A1001'));
        expect(dto.idProveedor, equals('P001'));
      });

      test(
        'should convert Product entity with optional fields to ProductDto',
        () {
          // Arrange
          final fechaVencimiento = DateTime(2025, 12, 31);
          final tiempoEstimadoEntrega = DateTime(2024, 7, 10);

          final entity = Product(
            id: 'product-1',
            nombre: 'Aspirina',
            descripcion: 'Medicamento para el dolor',
            categoria: 'Medicamento',
            condicionesAlmacenamiento: 'Lugar fresco y seco',
            valorUnitario: 25.5,
            fechaVencimiento: fechaVencimiento,
            lote: 'A1001',
            tiempoEstimadoEntrega: tiempoEstimadoEntrega,
            idProveedor: 'P001',
          );

          // Act
          final dto = entity.toDto();

          // Assert
          expect(dto.fechaVencimiento, equals(fechaVencimiento));
          expect(dto.tiempoEstimadoEntrega, equals(tiempoEstimadoEntrega));
        },
      );

      test('should convert Product entity with null optional fields', () {
        // Arrange
        const entity = Product(
          id: 'product-1',
          nombre: 'Product without dates',
          descripcion: 'Description',
          categoria: 'Category',
          condicionesAlmacenamiento: 'Storage',
          valorUnitario: 25.5,
          fechaVencimiento: null,
          lote: 'LOT001',
          tiempoEstimadoEntrega: null,
          idProveedor: 'P001',
        );

        // Act
        final dto = entity.toDto();

        // Assert
        expect(dto.fechaVencimiento, isNull);
        expect(dto.tiempoEstimadoEntrega, isNull);
      });
    });

    group('Round-trip conversion', () {
      test(
        'should maintain data integrity when converting DTO to Entity and back',
        () {
          // Arrange
          final fechaVencimiento = DateTime(2025, 12, 31);
          final tiempoEstimadoEntrega = DateTime(2024, 7, 10);

          final originalDto = ProductDto(
            id: 'product-1',
            nombre: 'Aspirina',
            descripcion: 'Medicamento para el dolor',
            categoria: 'Medicamento',
            condicionesAlmacenamiento: 'Lugar fresco y seco',
            valorUnitario: 25.5,
            fechaVencimiento: fechaVencimiento,
            lote: 'A1001',
            tiempoEstimadoEntrega: tiempoEstimadoEntrega,
            idProveedor: 'P001',
          );

          // Act
          final entity = originalDto.toEntity();
          final convertedDto = entity.toDto();

          // Assert
          expect(convertedDto.id, equals(originalDto.id));
          expect(convertedDto.nombre, equals(originalDto.nombre));
          expect(convertedDto.descripcion, equals(originalDto.descripcion));
          expect(convertedDto.categoria, equals(originalDto.categoria));
          expect(
            convertedDto.condicionesAlmacenamiento,
            equals(originalDto.condicionesAlmacenamiento),
          );
          expect(convertedDto.valorUnitario, equals(originalDto.valorUnitario));
          expect(convertedDto.lote, equals(originalDto.lote));
          expect(convertedDto.idProveedor, equals(originalDto.idProveedor));
          expect(
            convertedDto.fechaVencimiento,
            equals(originalDto.fechaVencimiento),
          );
          expect(
            convertedDto.tiempoEstimadoEntrega,
            equals(originalDto.tiempoEstimadoEntrega),
          );
        },
      );

      test(
        'should maintain data integrity when converting Entity to DTO and back',
        () {
          // Arrange
          final fechaVencimiento = DateTime(2025, 12, 31);
          final tiempoEstimadoEntrega = DateTime(2024, 7, 10);

          final originalEntity = Product(
            id: 'product-1',
            nombre: 'Aspirina',
            descripcion: 'Medicamento para el dolor',
            categoria: 'Medicamento',
            condicionesAlmacenamiento: 'Lugar fresco y seco',
            valorUnitario: 25.5,
            fechaVencimiento: fechaVencimiento,
            lote: 'A1001',
            tiempoEstimadoEntrega: tiempoEstimadoEntrega,
            idProveedor: 'P001',
          );

          // Act
          final dto = originalEntity.toDto();
          final convertedEntity = dto.toEntity();

          // Assert
          expect(convertedEntity.id, equals(originalEntity.id));
          expect(convertedEntity.nombre, equals(originalEntity.nombre));
          expect(
            convertedEntity.descripcion,
            equals(originalEntity.descripcion),
          );
          expect(convertedEntity.categoria, equals(originalEntity.categoria));
          expect(
            convertedEntity.condicionesAlmacenamiento,
            equals(originalEntity.condicionesAlmacenamiento),
          );
          expect(
            convertedEntity.valorUnitario,
            equals(originalEntity.valorUnitario),
          );
          expect(convertedEntity.lote, equals(originalEntity.lote));
          expect(
            convertedEntity.idProveedor,
            equals(originalEntity.idProveedor),
          );
          expect(
            convertedEntity.fechaVencimiento,
            equals(originalEntity.fechaVencimiento),
          );
          expect(
            convertedEntity.tiempoEstimadoEntrega,
            equals(originalEntity.tiempoEstimadoEntrega),
          );
        },
      );
    });
  });
}
