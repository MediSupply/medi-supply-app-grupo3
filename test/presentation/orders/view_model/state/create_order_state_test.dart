import 'package:flutter_test/flutter_test.dart';
import 'package:medi_supply_app_grupo3/presentation/orders/view_model/state/create_order_state.dart';
import 'package:medi_supply_app_grupo3/data/repository/entity/client/client.dart';
import 'package:medi_supply_app_grupo3/data/repository/entity/product/product.dart';
import 'package:medi_supply_app_grupo3/data/repository/entity/order/order_item.dart';

void main() {
  group('CreateOrderState', () {
    test('should create CreateOrderState with default values', () {
      // Arrange & Act
      const state = CreateOrderState();

      // Assert
      expect(state.orderItems, isEmpty);
      expect(state.clients, isEmpty);
      expect(state.products, isEmpty);
      expect(state.filteredProducts, isEmpty);
      expect(state.filterProductName, equals(''));
      expect(state.isLoading, isFalse);
    });

    test('should create CreateOrderState with custom values', () {
      // Arrange
      final orderItems = [
        const OrderItem(
          producto: Product(id: 'product-1'),
          cantidad: 2,
          precioUnitario: 25.0,
          precioTotal: 50.0,
        ),
      ];
      final clients = [const Client(id: 'client-1', nombre: 'Client 1')];
      final products = [const Product(id: 'product-1', nombre: 'Product 1')];

      // Act
      final state = CreateOrderState(
        orderItems: orderItems,
        clients: clients,
        products: products,
        filteredProducts: products,
        filterProductName: 'Product',
        isLoading: true,
      );

      // Assert
      expect(state.orderItems.length, equals(1));
      expect(state.clients.length, equals(1));
      expect(state.products.length, equals(1));
      expect(state.filteredProducts.length, equals(1));
      expect(state.filterProductName, equals('Product'));
      expect(state.isLoading, isTrue);
    });

    test('copyWith should create new state with updated values', () {
      // Arrange
      const initialState = CreateOrderState();
      final orderItems = [
        const OrderItem(producto: Product(id: 'product-1'), cantidad: 2),
      ];

      // Act
      final newState = initialState.copyWith(
        orderItems: orderItems,
        isLoading: true,
      );

      // Assert
      expect(newState.orderItems.length, equals(1));
      expect(newState.isLoading, isTrue);
      expect(newState.clients, equals(initialState.clients));
      expect(newState.products, equals(initialState.products));
    });

    test('copyWith should preserve unchanged values', () {
      // Arrange
      final clients = [const Client(id: 'client-1', nombre: 'Client 1')];
      final state = CreateOrderState(clients: clients);

      // Act
      final newState = state.copyWith(isLoading: true);

      // Assert
      expect(newState.isLoading, isTrue);
      expect(newState.clients, equals(clients));
      expect(newState.orderItems, equals(state.orderItems));
    });

    test('copyWith should update multiple fields', () {
      // Arrange
      const initialState = CreateOrderState();
      final products = [const Product(id: 'product-1', nombre: 'Product 1')];

      // Act
      final newState = initialState.copyWith(
        products: products,
        filteredProducts: products,
        filterProductName: 'Product',
      );

      // Assert
      expect(newState.products.length, equals(1));
      expect(newState.filteredProducts.length, equals(1));
      expect(newState.filterProductName, equals('Product'));
    });

    test('copyWith should handle null values', () {
      // Arrange
      final orderItems = [const OrderItem(producto: Product(id: 'product-1'))];
      final state = CreateOrderState(orderItems: orderItems);

      // Act
      final newState = state.copyWith(orderItems: null);

      // Assert
      expect(newState.orderItems, equals(orderItems));
    });

    test('copyWith should handle empty lists', () {
      // Arrange
      const initialState = CreateOrderState();

      // Act
      final newState = initialState.copyWith(
        orderItems: const [],
        clients: const [],
        products: const [],
      );

      // Assert
      expect(newState.orderItems, isEmpty);
      expect(newState.clients, isEmpty);
      expect(newState.products, isEmpty);
    });
  });
}
