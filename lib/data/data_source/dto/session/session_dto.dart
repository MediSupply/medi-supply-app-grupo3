import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_dto.freezed.dart';
part 'session_dto.g.dart';

@freezed
abstract interface class SessionDto with _$SessionDto {
  const factory SessionDto({
    required String id,
    required String token,
    @JsonKey(name: 'expires_at') required String expiresAt,
    @JsonKey(name: 'user_id') required String userId,
  }) = _SessionDto;

  factory SessionDto.fromJson(Map<String, dynamic> json) =>
      _$SessionDtoFromJson(json);
}
