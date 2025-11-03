import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'state/orders_state.dart';

final ordersViewModelProvider = NotifierProvider<OrdersViewModel, OrdersState>(
  () => OrdersViewModel(),
);

class OrdersViewModel extends Notifier<OrdersState> {
  @override
  OrdersState build() {
    return OrdersState();
  }
}
