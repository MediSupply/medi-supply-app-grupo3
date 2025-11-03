import 'package:flutter_test/flutter_test.dart';
import 'package:medi_supply_app_grupo3/data/data_source/dto/product/product_dto.dart';

void main() {
  group('ProductDto', () {
    test('should create ProductDto with required parameters', () {
      // Arrange & Act
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

      // Assert
      expect(dto.id, equals('product-1'));
      expect(dto.nombre, equals('Aspirina'));
      expect(dto.descripcion, equals('Medicamento para el dolor'));
      expect(dto.categoria, equals('Medicamento'));
      expect(dto.condicionesAlmacenamiento, equals('Lugar fresco y seco'));
      expect(dto.valorUnitario, equals(25.5));
      expect(dto.lote, equals('A1001'));
      expect(dto.idProveedor, equals('P001'));
      expect(dto.fechaVencimiento, isNull);
      expect(dto.tiempoEstimadoEntrega, isNull);
    });

    test('should create ProductDto with optional parameters', () {
      // Arrange
      final fechaVencimiento = DateTime(2025, 12, 31);
      final tiempoEstimadoEntrega = DateTime(2024, 7, 10);

      // Act
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

      // Assert
      expect(dto.fechaVencimiento, equals(fechaVencimiento));
      expect(dto.tiempoEstimadoEntrega, equals(tiempoEstimadoEntrega));
    });

    test('should create from JSON', () {
      // Arrange
      final json = {
        'id': 'product-1',
        'nombre': 'Aspirina',
        'descripcion': 'Medicamento para el dolor',
        'categoria': 'Medicamento',
        'condiciones_almacenamiento': 'Lugar fresco y seco',
        'valor_unitario': 25.5,
        'lote': 'A1001',
        'id_proveedor': 'P001',
      };

      // Act
      final dto = ProductDto.fromJson(json);

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

    test('should create from JSON with optional fields', () {
      // Arrange
      final json = {
        'id': 'product-1',
        'nombre': 'Aspirina',
        'descripcion': 'Medicamento para el dolor',
        'categoria': 'Medicamento',
        'condiciones_almacenamiento': 'Lugar fresco y seco',
        'valor_unitario': 25.5,
        'fecha_vencimiento': '2025-12-31T00:00:00Z',
        'lote': 'A1001',
        'tiempo_estimado_entrega': '2024-07-10T00:00:00Z',
        'id_proveedor': 'P001',
      };

      // Act
      final dto = ProductDto.fromJson(json);

      // Assert
      expect(dto.fechaVencimiento, isNotNull);
      expect(dto.tiempoEstimadoEntrega, isNotNull);
    });

    test('should convert to JSON', () {
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
      final json = dto.toJson();

      // Assert
      expect(json['id'], equals('product-1'));
      expect(json['nombre'], equals('Aspirina'));
      expect(json['descripcion'], equals('Medicamento para el dolor'));
      expect(json['categoria'], equals('Medicamento'));
      expect(json['condiciones_almacenamiento'], equals('Lugar fresco y seco'));
      expect(json['valor_unitario'], equals(25.5));
      expect(json['lote'], equals('A1001'));
      expect(json['id_proveedor'], equals('P001'));
    });

    test('should maintain data integrity in round-trip conversion', () {
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
      final json = originalDto.toJson();
      final convertedDto = ProductDto.fromJson(json);

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
    });

    test('should handle zero valorUnitario', () {
      // Arrange & Act
      final dto = ProductDto(
        id: 'product-1',
        nombre: 'Free Product',
        descripcion: 'Description',
        categoria: 'Category',
        condicionesAlmacenamiento: 'Room temperature',
        valorUnitario: 0.0,
        lote: 'LOT001',
        idProveedor: 'P001',
      );

      // Assert
      expect(dto.valorUnitario, equals(0.0));
    });

    test('should handle large valorUnitario', () {
      // Arrange & Act
      final dto = ProductDto(
        id: 'product-1',
        nombre: 'Expensive Product',
        descripcion: 'Description',
        categoria: 'Category',
        condicionesAlmacenamiento: 'Room temperature',
        valorUnitario: 999999.99,
        lote: 'LOT001',
        idProveedor: 'P001',
      );

      // Assert
      expect(dto.valorUnitario, equals(999999.99));
    });

    test('should handle empty strings', () {
      // Arrange & Act
      final dto = ProductDto(
        id: '',
        nombre: '',
        descripcion: '',
        categoria: '',
        condicionesAlmacenamiento: '',
        valorUnitario: 0.0,
        lote: '',
        idProveedor: '',
      );

      // Assert
      expect(dto.id, equals(''));
      expect(dto.nombre, equals(''));
      expect(dto.descripcion, equals(''));
      expect(dto.categoria, equals(''));
      expect(dto.condicionesAlmacenamiento, equals(''));
      expect(dto.lote, equals(''));
      expect(dto.idProveedor, equals(''));
    });
  });
}
