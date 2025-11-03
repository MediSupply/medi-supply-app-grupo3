// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderDto _$OrderDtoFromJson(Map<String, dynamic> json) => _OrderDto(
  id: json['id'] as String,
  valor: (json['valor'] as num).toDouble(),
  estado: json['estado'] as String,
  fechaCreacion: json['fecha_creacion'] as String,
  fechaEntregaEstimada: json['fecha_entrega_estimada'] as String,
  direccionEntrega: json['direccion_entrega'] as String,
  items: (json['items'] as List<dynamic>)
      .map((e) => OrderItemDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$OrderDtoToJson(_OrderDto instance) => <String, dynamic>{
  'id': instance.id,
  'valor': instance.valor,
  'estado': instance.estado,
  'fecha_creacion': instance.fechaCreacion,
  'fecha_entrega_estimada': instance.fechaEntregaEstimada,
  'direccion_entrega': instance.direccionEntrega,
  'items': instance.items,
};
