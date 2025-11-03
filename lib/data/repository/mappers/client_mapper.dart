import '../../data_source/dto/client/client_dto.dart';
import '../entity/client/client.dart';

extension ClientDtoMapper on ClientDto {
  Client toEntity() {
    return Client(
      id: id,
      nombre: nombre,
      email: email,
      telefono: telefono,
      direccion: direccion,
      razonSocial: razonSocial,
      nit: nit,
    );
  }
}

extension ClientEntityMapper on Client {
  ClientDto toDto() {
    return ClientDto(
      id: id,
      nombre: nombre,
      email: email,
      telefono: telefono,
      direccion: direccion,
      razonSocial: razonSocial,
      nit: nit,
    );
  }
}
