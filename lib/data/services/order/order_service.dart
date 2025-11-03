import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../data_source/dto/order/order_dto.dart';

part 'order_service.g.dart';

@RestApi()
abstract interface class OrderService {
  factory OrderService(Dio dio, {String baseUrl}) = _OrderService;

  @GET('/ordenes')
  Future<List<OrderDto>> getOrders();

  @POST('/ordenes')
  Future<OrderDto> createOrder({@Body() required OrderDto order});
}
