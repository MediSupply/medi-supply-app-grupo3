import '../../data_source/dto/session/session_dto.dart';
import '../entity/session/session.dart';

extension SessionDtoMapper on SessionDto {
  Session toEntity() {
    return Session(id: id, token: token, expiresAt: expiresAt, userId: userId);
  }
}

extension SessionEntityMapper on Session {
  SessionDto toDto() {
    return SessionDto(
      id: id,
      token: token,
      expiresAt: expiresAt,
      userId: userId,
    );
  }
}
