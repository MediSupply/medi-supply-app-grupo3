import '../../api/api_response.dart';
import '../../dto/order/order_dto.dart';

abstract interface class OrderDataSourceRemoteInterface {
  Future<ApiResponse<List<OrderDto>>> getOrders();
  Future<ApiResponse<OrderDto>> createOrder(OrderDto order);
}
