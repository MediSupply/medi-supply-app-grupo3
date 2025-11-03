import 'package:freezed_annotation/freezed_annotation.dart';

import 'order_item_dto.dart';

part 'order_dto.freezed.dart';
part 'order_dto.g.dart';

@freezed
abstract interface class OrderDto with _$OrderDto {
  const factory OrderDto({
    required String id,
    required double valor,
    required String estado,
    @JsonKey(name: 'fecha_creacion') required String fechaCreacion,
    @JsonKey(name: 'fecha_entrega_estimada')
    required String fechaEntregaEstimada,
    @JsonKey(name: 'direccion_entrega') required String direccionEntrega,
    required List<OrderItemDto> items,
  }) = _OrderDto;

  factory OrderDto.fromJson(Map<String, dynamic> json) =>
      _$OrderDtoFromJson(json);
}
