import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../data_source/dto/product/product_dto.dart';

part 'product_service.g.dart';

@RestApi()
abstract interface class ProductService {
  factory ProductService(Dio dio, {String baseUrl}) = _ProductService;

  @GET('/productos')
  Future<List<ProductDto>> getProducts();

  @POST('/productos')
  Future<ProductDto> createProduct({@Body() required ProductDto product});
}
