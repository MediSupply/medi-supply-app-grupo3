import 'package:flutter_test/flutter_test.dart';
import 'package:medi_supply_app_grupo3/data/repository/entity/order/order.dart';
import 'package:medi_supply_app_grupo3/data/repository/entity/order/order_item.dart';
import 'package:medi_supply_app_grupo3/data/repository/entity/product/product.dart';

void main() {
  group('Order', () {
    test('should create Order with default values', () {
      // Arrange & Act
      const order = Order();

      // Assert
      expect(order.id, equals(''));
      expect(order.valor, equals(0.0));
      expect(order.estado, equals(''));
      expect(order.fechaCreacion, equals(''));
      expect(order.fechaEntregaEstimada, equals(''));
      expect(order.direccionEntrega, equals(''));
      expect(order.items, isEmpty);
    });

    test('should create Order with all parameters', () {
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

      // Act
      final order = Order(
        id: 'order-123',
        valor: 150.0,
        estado: 'CREADO',
        fechaCreacion: '2024-01-01T00:00:00Z',
        fechaEntregaEstimada: '2024-01-04T00:00:00Z',
        direccionEntrega: 'Calle 123 #45-67',
        items: items,
      );

      // Assert
      expect(order.id, equals('order-123'));
      expect(order.valor, equals(150.0));
      expect(order.estado, equals('CREADO'));
      expect(order.fechaCreacion, equals('2024-01-01T00:00:00Z'));
      expect(order.fechaEntregaEstimada, equals('2024-01-04T00:00:00Z'));
      expect(order.direccionEntrega, equals('Calle 123 #45-67'));
      expect(order.items.length, equals(1));
    });

    test('should have correct props for equality', () {
      // Arrange
      final items = [
        const OrderItem(
          producto: Product(id: 'product-1'),
          cantidad: 2,
          precioUnitario: 25.0,
          precioTotal: 50.0,
        ),
      ];

      final order1 = Order(
        id: 'order-123',
        valor: 150.0,
        estado: 'CREADO',
        fechaCreacion: '2024-01-01T00:00:00Z',
        fechaEntregaEstimada: '2024-01-04T00:00:00Z',
        direccionEntrega: 'Calle 123',
        items: items,
      );

      final order2 = Order(
        id: 'order-123',
        valor: 150.0,
        estado: 'CREADO',
        fechaCreacion: '2024-01-01T00:00:00Z',
        fechaEntregaEstimada: '2024-01-04T00:00:00Z',
        direccionEntrega: 'Calle 123',
        items: items,
      );

      // Act & Assert
      expect(order1, equals(order2));
      expect(order1.props, equals(order2.props));
    });

    test('should not be equal with different values', () {
      // Arrange
      const order1 = Order(id: 'order-123', valor: 150.0, estado: 'CREADO');

      const order2 = Order(id: 'order-456', valor: 200.0, estado: 'ENVIADO');

      // Act & Assert
      expect(order1, isNot(equals(order2)));
    });

    test('should handle empty items list', () {
      // Arrange & Act
      const order = Order(
        id: 'order-123',
        valor: 150.0,
        estado: 'CREADO',
        items: [],
      );

      // Assert
      expect(order.items, isEmpty);
    });

    test('should handle multiple items', () {
      // Arrange
      final items = [
        const OrderItem(
          producto: Product(id: 'product-1'),
          cantidad: 2,
          precioUnitario: 25.0,
          precioTotal: 50.0,
        ),
        const OrderItem(
          producto: Product(id: 'product-2'),
          cantidad: 3,
          precioUnitario: 30.0,
          precioTotal: 90.0,
        ),
      ];

      // Act
      final order = Order(id: 'order-123', items: items);

      // Assert
      expect(order.items.length, equals(2));
    });

    test('should handle different order states', () {
      // Arrange & Act
      final estados = ['CREADO', 'EN_PROCESO', 'ENVIADO', 'ENTREGADO'];

      for (final estado in estados) {
        final order = Order(id: 'order-123', estado: estado);

        // Assert
        expect(order.estado, equals(estado));
      }
    });

    test('should handle zero valor', () {
      // Arrange & Act
      const order = Order(id: 'order-123', valor: 0.0);

      // Assert
      expect(order.valor, equals(0.0));
    });

    test('should handle large valor', () {
      // Arrange & Act
      const order = Order(id: 'order-123', valor: 999999.99);

      // Assert
      expect(order.valor, equals(999999.99));
    });
  });
}
