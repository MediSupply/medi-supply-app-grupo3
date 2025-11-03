import 'package:freezed_annotation/freezed_annotation.dart';

import '../product/product_dto.dart';

part 'order_item_dto.freezed.dart';
part 'order_item_dto.g.dart';

@freezed
abstract interface class OrderItemDto with _$OrderItemDto {
  const factory OrderItemDto({
    required ProductDto producto,
    required int cantidad,
    required double precioUnitario,
    required double precioTotal,
  }) = _OrderItemDto;

  factory OrderItemDto.fromJson(Map<String, dynamic> json) =>
      _$OrderItemDtoFromJson(json);
}
