import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_credentials_dto.g.dart';

@JsonSerializable()
class UserCredentialsDto {
  final String email;
  final String password;

  UserCredentialsDto({required this.email, required this.password});

  factory UserCredentialsDto.fromJson(Map<String, dynamic> json) =>
      _$UserCredentialsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserCredentialsDtoToJson(this);
}
