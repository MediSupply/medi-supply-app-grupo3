import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_dto.freezed.dart';
part 'product_dto.g.dart';

@freezed
abstract interface class ProductDto with _$ProductDto {
  const factory ProductDto({
    required String id,
    required String nombre,
    required String descripcion,
    required String categoria,
    @JsonKey(name: 'condiciones_almacenamiento')
    required String condicionesAlmacenamiento,
    @JsonKey(name: 'valor_unitario') required double valorUnitario,
    @JsonKey(name: 'fecha_vencimiento') DateTime? fechaVencimiento,
    required String lote,
    @JsonKey(name: 'tiempo_estimado_entrega') DateTime? tiempoEstimadoEntrega,
    @JsonKey(name: 'id_proveedor') required String idProveedor,
  }) = _ProductDto;

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);
}
