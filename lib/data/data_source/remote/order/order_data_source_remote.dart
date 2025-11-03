import 'package:dio/dio.dart';
import 'package:medi_supply_app_grupo3/data/data_source/api/api_response.dart';
import 'package:medi_supply_app_grupo3/data/data_source/dto/order/order_dto.dart';

import '../../../services/order/order_service.dart';
import '../../api/mixin/api_response_handler_mixin.dart';

import 'order_data_source_remote_interface.dart';

class OrderDataSourceRemote
    with ApiResponseHandlerMixin
    implements OrderDataSourceRemoteInterface {
  final OrderService _orderService;

  OrderDataSourceRemote(Dio dio) : _orderService = OrderService(dio);

  @override
  Future<ApiResponse<List<OrderDto>>> getOrders() {
    return handleApiCall<List<OrderDto>>(_orderService.getOrders());
  }

  @override
  Future<ApiResponse<OrderDto>> createOrder(OrderDto order) {
    return handleApiCall<OrderDto>(_orderService.createOrder(order: order));
  }
}
