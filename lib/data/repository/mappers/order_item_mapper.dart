import 'package:medi_supply_app_grupo3/data/repository/mappers/product_mapper.dart';

import '../../data_source/dto/order/order_item_dto.dart';
import '../entity/order/order_item.dart';

extension OrderItemDtoMapper on OrderItemDto {
  OrderItem toEntity() {
    return OrderItem(
      producto: producto.toEntity(),
      cantidad: cantidad,
      precioUnitario: precioUnitario,
      precioTotal: precioTotal,
    );
  }
}

extension OrderItemEntityMapper on OrderItem {
  OrderItemDto toDto() {
    return OrderItemDto(
      producto: producto.toDto(),
      cantidad: cantidad,
      precioUnitario: precioUnitario,
      precioTotal: precioTotal,
    );
  }
}
