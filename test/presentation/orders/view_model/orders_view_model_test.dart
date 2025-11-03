import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medi_supply_app_grupo3/presentation/orders/view_model/orders_view_model.dart';

void main() {
  group('OrdersViewModel', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('Initial state is correct', () {
      final viewModel = container.read(ordersViewModelProvider.notifier);
      final state = viewModel.state;
      expect(state, isNotNull);
    });

    test('should be instantiable', () {
      final viewModel = container.read(ordersViewModelProvider.notifier);
      expect(viewModel, isA<OrdersViewModel>());
    });
  });
}
