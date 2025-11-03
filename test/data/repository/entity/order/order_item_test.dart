import 'package:flutter_test/flutter_test.dart';
import 'package:medi_supply_app_grupo3/data/repository/entity/order/order_item.dart';
import 'package:medi_supply_app_grupo3/data/repository/entity/product/product.dart';

void main() {
  group('OrderItem', () {
    test('should create OrderItem with default values', () {
      // Arrange & Act
      const orderItem = OrderItem();

      // Assert
      expect(orderItem.producto, equals(const Product()));
      expect(orderItem.cantidad, equals(0));
      expect(orderItem.precioUnitario, equals(0.0));
      expect(orderItem.precioTotal, equals(0.0));
    });

    test('should create OrderItem with all parameters', () {
      // Arrange
      const product = Product(
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
      const orderItem = OrderItem(
        producto: product,
        cantidad: 2,
        precioUnitario: 25.5,
        precioTotal: 51.0,
      );

      // Assert
      expect(orderItem.producto.id, equals('product-1'));
      expect(orderItem.producto.nombre, equals('Aspirina'));
      expect(orderItem.cantidad, equals(2));
      expect(orderItem.precioUnitario, equals(25.5));
      expect(orderItem.precioTotal, equals(51.0));
    });

    test('should have correct props for equality', () {
      // Arrange
      const product = Product(id: 'product-1');
      const orderItem1 = OrderItem(
        producto: product,
        cantidad: 2,
        precioUnitario: 25.0,
        precioTotal: 50.0,
      );

      const orderItem2 = OrderItem(
        producto: product,
        cantidad: 2,
        precioUnitario: 25.0,
        precioTotal: 50.0,
      );

      // Act & Assert
      expect(orderItem1, equals(orderItem2));
      expect(orderItem1.props, equals(orderItem2.props));
    });

    test('should not be equal with different values', () {
      // Arrange
      const product = Product(id: 'product-1');
      const orderItem1 = OrderItem(
        producto: product,
        cantidad: 2,
        precioUnitario: 25.0,
        precioTotal: 50.0,
      );

      const orderItem2 = OrderItem(
        producto: product,
        cantidad: 3,
        precioUnitario: 25.0,
        precioTotal: 75.0,
      );

      // Act & Assert
      expect(orderItem1, isNot(equals(orderItem2)));
    });

    test('should handle zero cantidad', () {
      // Arrange
      const product = Product(id: 'product-1');

      // Act
      const orderItem = OrderItem(
        producto: product,
        cantidad: 0,
        precioUnitario: 25.0,
        precioTotal: 0.0,
      );

      // Assert
      expect(orderItem.cantidad, equals(0));
      expect(orderItem.precioTotal, equals(0.0));
    });

    test('should handle large cantidad', () {
      // Arrange
      const product = Product(id: 'product-1');

      // Act
      const orderItem = OrderItem(
        producto: product,
        cantidad: 1000,
        precioUnitario: 25.0,
        precioTotal: 25000.0,
      );

      // Assert
      expect(orderItem.cantidad, equals(1000));
      expect(orderItem.precioTotal, equals(25000.0));
    });

    test('should handle decimal prices', () {
      // Arrange
      const product = Product(id: 'product-1');

      // Act
      const orderItem = OrderItem(
        producto: product,
        cantidad: 3,
        precioUnitario: 25.99,
        precioTotal: 77.97,
      );

      // Assert
      expect(orderItem.precioUnitario, equals(25.99));
      expect(orderItem.precioTotal, equals(77.97));
    });

    test('should handle different products', () {
      // Arrange
      const product1 = Product(id: 'product-1', nombre: 'Product 1');
      const product2 = Product(id: 'product-2', nombre: 'Product 2');

      // Act
      const orderItem1 = OrderItem(
        producto: product1,
        cantidad: 2,
        precioUnitario: 25.0,
        precioTotal: 50.0,
      );

      const orderItem2 = OrderItem(
        producto: product2,
        cantidad: 2,
        precioUnitario: 30.0,
        precioTotal: 60.0,
      );

      // Assert
      expect(orderItem1.producto.id, equals('product-1'));
      expect(orderItem2.producto.id, equals('product-2'));
      expect(orderItem1, isNot(equals(orderItem2)));
    });
  });
}
