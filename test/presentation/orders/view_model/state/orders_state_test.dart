import 'package:flutter_test/flutter_test.dart';
import 'package:medi_supply_app_grupo3/presentation/orders/view_model/state/orders_state.dart';

void main() {
  group('OrdersState', () {
    test('should create OrdersState with default values', () {
      // Arrange & Act
      const state = OrdersState();

      // Assert
      expect(state, isA<OrdersState>());
    });

    test('should create multiple instances', () {
      // Arrange & Act
      const state1 = OrdersState();
      const state2 = OrdersState();

      // Assert
      expect(state1, isA<OrdersState>());
      expect(state2, isA<OrdersState>());
    });
  });
}
