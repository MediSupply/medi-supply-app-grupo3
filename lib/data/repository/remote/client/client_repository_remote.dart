import '../../../data_source/api/api_response.dart';
import '../../../data_source/dto/client/client_dto.dart';
import '../../../data_source/remote/client/client_data_source_remote_interface.dart';
import '../../entity/client/client.dart';
import '../../mappers/client_mapper.dart';

import 'client_repository_remote_interface.dart';

class ClientRepositoryRemote implements ClientRepositoryRemoteInterface {
  final ClientDataSourceRemoteInterface _clientDataSourceRemote;

  ClientRepositoryRemote(this._clientDataSourceRemote);

  @override
  Future<Client> createClient(Client client) async {
    final ApiResponse<ClientDto> response = await _clientDataSourceRemote
        .createClient(client.toDto());

    return response.when(
      onSuccess: (data) => data.toEntity(),
      onFailure: (error, statusCode, data) => throw Exception(error),
    );
  }

  @override
  Future<List<Client>> getClients() async {
    final ApiResponse<List<ClientDto>> response = await _clientDataSourceRemote
        .getClients();

    return response.when(
      onSuccess: (data) => data.map((dto) => dto.toEntity()).toList(),
      onFailure: (error, statusCode, data) => throw Exception(error),
    );
  }
}
