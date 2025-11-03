import '../../api/api_response.dart';
import '../../dto/client/client_dto.dart';

abstract interface class ClientDataSourceRemoteInterface {
  Future<ApiResponse<ClientDto>> createClient(ClientDto client);
  Future<ApiResponse<List<ClientDto>>> getClients();
}
