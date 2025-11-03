import '../../entity/order/order.dart';

abstract interface class OrderRepositoryRemoteInterface {
  Future<List<Order>> getOrders();
  Future<Order> createOrder(Order order);
}
