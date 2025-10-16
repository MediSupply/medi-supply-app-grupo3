import 'package:equatable/equatable.dart';

class Session extends Equatable {
  final String id;
  final String token;
  final String expiresAt;
  final String userId;

  const Session({
    required this.id,
    required this.token,
    required this.expiresAt,
    required this.userId,
  });

  @override
  List<Object?> get props => [id, token, expiresAt, userId];
}
