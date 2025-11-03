import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/networking/networking.dart';
import '../../../data/data_source/remote/client/client_data_source_remote.dart';
import '../../../data/repository/entity/client/client.dart';
import '../../../data/repository/remote/client/client_repository_remote.dart';
import '../../../data/repository/remote/client/client_repository_remote_interface.dart';
import 'state/register_client_state.dart';

final NotifierProvider<RegisterClientViewModel, RegisterClientState>
registerClientViewModelProvider =
    NotifierProvider<RegisterClientViewModel, RegisterClientState>(
      () => RegisterClientViewModel(),
    );

class RegisterClientViewModel extends Notifier<RegisterClientState> {
  late ClientRepositoryRemoteInterface _clientRepositoryRemote;

  @override
  RegisterClientState build() {
    _clientRepositoryRemote = ClientRepositoryRemote(
      ClientDataSourceRemote(Networking.instance.dio),
    );
    return RegisterClientState();
  }

  void setNombre(String nombre) {
    final Client client = Client(
      nombre: nombre,
      email: state.client.email,
      telefono: state.client.telefono,
      direccion: state.client.direccion,
      razonSocial: state.client.razonSocial,
      nit: state.client.nit,
    );
    state = state.copyWith(client: client);
  }

  void setEmail(String email) {
    final Client client = Client(
      email: email,
      nombre: state.client.nombre,
      telefono: state.client.telefono,
      direccion: state.client.direccion,
      razonSocial: state.client.razonSocial,
      nit: state.client.nit,
    );
    state = state.copyWith(client: client);
  }

  void setTelefono(String telefono) {
    final Client client = Client(
      telefono: telefono,
      nombre: state.client.nombre,
      email: state.client.email,
      direccion: state.client.direccion,
      razonSocial: state.client.razonSocial,
      nit: state.client.nit,
    );
    state = state.copyWith(client: client);
  }

  void setDireccion(String direccion) {
    final Client client = Client(
      direccion: direccion,
      nombre: state.client.nombre,
      email: state.client.email,
      telefono: state.client.telefono,
      razonSocial: state.client.razonSocial,
      nit: state.client.nit,
    );
    state = state.copyWith(client: client);
  }

  void setRazonSocial(String razonSocial) {
    final Client client = Client(
      razonSocial: razonSocial,
      nombre: state.client.nombre,
      email: state.client.email,
      telefono: state.client.telefono,
      direccion: state.client.direccion,
      nit: state.client.nit,
    );
    state = state.copyWith(client: client);
  }

  void setNit(String nit) {
    final Client client = Client(
      nit: nit,
      nombre: state.client.nombre,
      email: state.client.email,
      telefono: state.client.telefono,
      direccion: state.client.direccion,
      razonSocial: state.client.razonSocial,
    );
    state = state.copyWith(client: client);
  }

  String? validateClientNombre() {
    return state.client.validateNombre();
  }

  String? validateClientEmail() {
    return state.client.validateEmail();
  }

  String? validateClientTelefono() {
    return state.client.validatePhone();
  }

  String? validateClientDireccion() {
    return state.client.validateDireccion();
  }

  String? validateClientRazonSocial() {
    return state.client.validateRazonSocial();
  }

  String? validateClientNit() {
    return state.client.validateNit();
  }

  Future<bool> registerClient() async {
    state = state.copyWith(isLoading: true);
    final AsyncValue<Client> client = await AsyncValue.guard(
      () => _clientRepositoryRemote.createClient(state.client),
    );
    client.when(
      data: (client) =>
          state = state.copyWith(isLoading: false, client: client),
      error: (error, stackTrace) => state = state.copyWith(isLoading: false),
      loading: () => state = state.copyWith(isLoading: true),
    );

    return !client.hasError;
  }
}
