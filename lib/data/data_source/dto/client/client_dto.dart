import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_dto.freezed.dart';
part 'client_dto.g.dart';

@freezed
abstract interface class ClientDto with _$ClientDto {
  const factory ClientDto({
    required String id,
    required String nombre,
    required String email,
    required String telefono,
    required String direccion,
    @JsonKey(name: 'razon_social') required String razonSocial,
    required String nit,
  }) = _ClientDto;

  factory ClientDto.fromJson(Map<String, dynamic> json) =>
      _$ClientDtoFromJson(json);
}
