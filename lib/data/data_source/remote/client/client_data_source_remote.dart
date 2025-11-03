import 'package:dio/dio.dart';
import 'package:medi_supply_app_grupo3/data/data_source/api/api_response.dart';
import 'package:medi_supply_app_grupo3/data/data_source/dto/client/client_dto.dart';

import '../../../services/client/client_service.dart';
import '../../api/mixin/api_response_handler_mixin.dart';

import 'client_data_source_remote_interface.dart';

class ClientDataSourceRemote
    with ApiResponseHandlerMixin
    implements ClientDataSourceRemoteInterface {
  final ClientService _clientService;

  ClientDataSourceRemote(Dio dio) : _clientService = ClientService(dio);

  @override
  Future<ApiResponse<ClientDto>> createClient(ClientDto client) {
    return handleApiCall<ClientDto>(
      _clientService.createClient(client: client),
    );
  }

  @override
  Future<ApiResponse<List<ClientDto>>> getClients() {
    return handleApiCall<List<ClientDto>>(_clientService.getClients());
  }
}
