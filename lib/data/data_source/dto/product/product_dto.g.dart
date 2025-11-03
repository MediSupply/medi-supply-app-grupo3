// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductDto _$ProductDtoFromJson(Map<String, dynamic> json) => _ProductDto(
  id: json['id'] as String,
  nombre: json['nombre'] as String,
  descripcion: json['descripcion'] as String,
  categoria: json['categoria'] as String,
  condicionesAlmacenamiento: json['condiciones_almacenamiento'] as String,
  valorUnitario: (json['valor_unitario'] as num).toDouble(),
  fechaVencimiento: json['fecha_vencimiento'] == null
      ? null
      : DateTime.parse(json['fecha_vencimiento'] as String),
  lote: json['lote'] as String,
  tiempoEstimadoEntrega: json['tiempo_estimado_entrega'] == null
      ? null
      : DateTime.parse(json['tiempo_estimado_entrega'] as String),
  idProveedor: json['id_proveedor'] as String,
);

Map<String, dynamic> _$ProductDtoToJson(
  _ProductDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'nombre': instance.nombre,
  'descripcion': instance.descripcion,
  'categoria': instance.categoria,
  'condiciones_almacenamiento': instance.condicionesAlmacenamiento,
  'valor_unitario': instance.valorUnitario,
  'fecha_vencimiento': instance.fechaVencimiento?.toIso8601String(),
  'lote': instance.lote,
  'tiempo_estimado_entrega': instance.tiempoEstimadoEntrega?.toIso8601String(),
  'id_proveedor': instance.idProveedor,
};
