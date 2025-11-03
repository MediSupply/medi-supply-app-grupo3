import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../data_source/dto/client/client_dto.dart';

part 'client_service.g.dart';

@RestApi()
abstract interface class ClientService {
  factory ClientService(Dio dio, {String baseUrl}) = _ClientService;

  @GET('/clientes')
  Future<List<ClientDto>> getClients();

  @POST('/clientes')
  Future<ClientDto> createClient({@Body() required ClientDto client});
}
