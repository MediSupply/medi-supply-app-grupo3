// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderItemDto _$OrderItemDtoFromJson(Map<String, dynamic> json) =>
    _OrderItemDto(
      producto: ProductDto.fromJson(json['producto'] as Map<String, dynamic>),
      cantidad: (json['cantidad'] as num).toInt(),
      precioUnitario: (json['precioUnitario'] as num).toDouble(),
      precioTotal: (json['precioTotal'] as num).toDouble(),
    );

Map<String, dynamic> _$OrderItemDtoToJson(_OrderItemDto instance) =>
    <String, dynamic>{
      'producto': instance.producto,
      'cantidad': instance.cantidad,
      'precioUnitario': instance.precioUnitario,
      'precioTotal': instance.precioTotal,
    };
