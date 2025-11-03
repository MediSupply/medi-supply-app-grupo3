import '../../../data_source/api/api_response.dart';
import '../../../data_source/dto/order/order_dto.dart';
import '../../../data_source/remote/order/order_data_source_remote_interface.dart';
import '../../entity/order/order.dart';
import '../../mappers/order_mapper.dart';

import 'order_repository_remote_interface.dart';

class OrderRepositoryRemote implements OrderRepositoryRemoteInterface {
  final OrderDataSourceRemoteInterface _orderDataSourceRemote;

  OrderRepositoryRemote(this._orderDataSourceRemote);

  @override
  Future<List<Order>> getOrders() async {
    final ApiResponse<List<OrderDto>> response = await _orderDataSourceRemote
        .getOrders();

    return response.when(
      onSuccess: (data) => data.map((dto) => dto.toEntity()).toList(),
      onFailure: (error, statusCode, data) => throw Exception(error),
    );
  }

  @override
  Future<Order> createOrder(Order order) async {
    final ApiResponse<OrderDto> response = await _orderDataSourceRemote
        .createOrder(order.toDto());

    return response.when(
      onSuccess: (data) => data.toEntity(),
      onFailure: (error, statusCode, data) => throw Exception(error),
    );
  }
}
