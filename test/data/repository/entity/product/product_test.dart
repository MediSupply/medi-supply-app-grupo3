import 'package:flutter_test/flutter_test.dart';
import 'package:medi_supply_app_grupo3/data/repository/entity/product/product.dart';

void main() {
  group('Product', () {
    test('should create Product with default values', () {
      // Arrange & Act
      const product = Product();

      // Assert
      expect(product.id, equals(''));
      expect(product.nombre, equals(''));
      expect(product.descripcion, equals(''));
      expect(product.categoria, equals(''));
      expect(product.condicionesAlmacenamiento, equals(''));
      expect(product.valorUnitario, equals(0.0));
      expect(product.fechaVencimiento, isNull);
      expect(product.lote, equals(''));
      expect(product.tiempoEstimadoEntrega, isNull);
      expect(product.idProveedor, equals(''));
    });

    test('should create Product with all parameters', () {
      // Arrange
      final fechaVencimiento = DateTime(2025, 12, 31);
      final tiempoEstimadoEntrega = DateTime(2024, 7, 10);

      // Act
      final product = Product(
        id: 'product-1',
        nombre: 'Aspirina',
        descripcion: 'Medicamento para el dolor y la fiebre',
        categoria: 'Medicamento',
        condicionesAlmacenamiento: 'Lugar fresco y seco',
        valorUnitario: 25.5,
        fechaVencimiento: fechaVencimiento,
        lote: 'A1001',
        tiempoEstimadoEntrega: tiempoEstimadoEntrega,
        idProveedor: 'P001',
      );

      // Assert
      expect(product.id, equals('product-1'));
      expect(product.nombre, equals('Aspirina'));
      expect(
        product.descripcion,
        equals('Medicamento para el dolor y la fiebre'),
      );
      expect(product.categoria, equals('Medicamento'));
      expect(product.condicionesAlmacenamiento, equals('Lugar fresco y seco'));
      expect(product.valorUnitario, equals(25.5));
      expect(product.fechaVencimiento, equals(fechaVencimiento));
      expect(product.lote, equals('A1001'));
      expect(product.tiempoEstimadoEntrega, equals(tiempoEstimadoEntrega));
      expect(product.idProveedor, equals('P001'));
    });

    test('should have correct props for equality', () {
      // Arrange
      final fechaVencimiento = DateTime(2025, 12, 31);
      final tiempoEstimadoEntrega = DateTime(2024, 7, 10);

      final product1 = Product(
        id: 'product-1',
        nombre: 'Aspirina',
        descripcion: 'Description',
        categoria: 'Category',
        condicionesAlmacenamiento: 'Storage',
        valorUnitario: 25.5,
        fechaVencimiento: fechaVencimiento,
        lote: 'LOT001',
        tiempoEstimadoEntrega: tiempoEstimadoEntrega,
        idProveedor: 'P001',
      );

      final product2 = Product(
        id: 'product-1',
        nombre: 'Aspirina',
        descripcion: 'Description',
        categoria: 'Category',
        condicionesAlmacenamiento: 'Storage',
        valorUnitario: 25.5,
        fechaVencimiento: fechaVencimiento,
        lote: 'LOT001',
        tiempoEstimadoEntrega: tiempoEstimadoEntrega,
        idProveedor: 'P001',
      );

      // Act & Assert
      expect(product1, equals(product2));
      expect(product1.props, equals(product2.props));
    });

    test('should not be equal with different values', () {
      // Arrange
      const product1 = Product(
        id: 'product-1',
        nombre: 'Product 1',
        valorUnitario: 25.0,
      );

      const product2 = Product(
        id: 'product-2',
        nombre: 'Product 2',
        valorUnitario: 30.0,
      );

      // Act & Assert
      expect(product1, isNot(equals(product2)));
    });

    test('should handle null fechaVencimiento', () {
      // Arrange & Act
      const product = Product(
        id: 'product-1',
        nombre: 'Product without expiration',
        fechaVencimiento: null,
      );

      // Assert
      expect(product.fechaVencimiento, isNull);
    });

    test('should handle null tiempoEstimadoEntrega', () {
      // Arrange & Act
      const product = Product(
        id: 'product-1',
        nombre: 'Product without delivery estimate',
        tiempoEstimadoEntrega: null,
      );

      // Assert
      expect(product.tiempoEstimadoEntrega, isNull);
    });

    test('should handle zero valorUnitario', () {
      // Arrange & Act
      const product = Product(
        id: 'product-1',
        nombre: 'Free Product',
        valorUnitario: 0.0,
      );

      // Assert
      expect(product.valorUnitario, equals(0.0));
    });

    test('should handle large valorUnitario', () {
      // Arrange & Act
      const product = Product(
        id: 'product-1',
        nombre: 'Expensive Product',
        valorUnitario: 999999.99,
      );

      // Assert
      expect(product.valorUnitario, equals(999999.99));
    });

    test('should handle empty strings', () {
      // Arrange & Act
      const product = Product(
        id: '',
        nombre: '',
        descripcion: '',
        categoria: '',
        condicionesAlmacenamiento: '',
        lote: '',
        idProveedor: '',
      );

      // Assert
      expect(product.id, equals(''));
      expect(product.nombre, equals(''));
      expect(product.descripcion, equals(''));
      expect(product.categoria, equals(''));
      expect(product.condicionesAlmacenamiento, equals(''));
      expect(product.lote, equals(''));
      expect(product.idProveedor, equals(''));
    });

    test('should handle different categories', () {
      // Arrange & Act
      final categories = ['Medicamento', 'Insumos', 'Higiene', 'Equipos'];

      for (final categoria in categories) {
        final product = Product(
          id: 'product-1',
          nombre: 'Product',
          categoria: categoria,
        );

        // Assert
        expect(product.categoria, equals(categoria));
      }
    });
  });
}
