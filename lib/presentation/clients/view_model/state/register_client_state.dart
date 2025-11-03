import '../../../../data/repository/entity/client/client.dart';

class RegisterClientState {
  final Client client;
  final bool isLoading;

  const RegisterClientState({
    this.client = const Client(),
    this.isLoading = false,
  });

  RegisterClientState copyWith({Client? client, bool? isLoading}) {
    return RegisterClientState(
      client: client ?? this.client,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
