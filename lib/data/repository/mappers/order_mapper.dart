import '../../data_source/dto/order/order_dto.dart';
import '../entity/order/order.dart';

import 'order_item_mapper.dart';

extension OrderDtoMapper on OrderDto {
  Order toEntity() {
    return Order(
      id: id,
      items: items.map((item) => item.toEntity()).toList(),
      valor: valor,
      estado: estado,
      fechaCreacion: fechaCreacion,
      fechaEntregaEstimada: fechaEntregaEstimada,
      direccionEntrega: direccionEntrega,
    );
  }
}

extension OrderEntityMapper on Order {
  OrderDto toDto() {
    return OrderDto(
      id: id,
      items: items.map((item) => item.toDto()).toList(),
      valor: valor,
      estado: estado,
      fechaCreacion: fechaCreacion,
      fechaEntregaEstimada: fechaEntregaEstimada,
      direccionEntrega: direccionEntrega,
    );
  }
}
