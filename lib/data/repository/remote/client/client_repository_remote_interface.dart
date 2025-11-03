import '../../entity/client/client.dart';

abstract interface class ClientRepositoryRemoteInterface {
  Future<Client> createClient(Client client);
  Future<List<Client>> getClients();
}
