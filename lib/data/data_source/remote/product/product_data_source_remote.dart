import 'package:dio/dio.dart';
import 'package:medi_supply_app_grupo3/data/data_source/api/api_response.dart';
import 'package:medi_supply_app_grupo3/data/data_source/dto/product/product_dto.dart';

import '../../../services/product/product_service.dart';
import '../../api/mixin/api_response_handler_mixin.dart';

import 'product_data_source_remote_interface.dart';

class ProductDataSourceRemote
    with ApiResponseHandlerMixin
    implements ProductDataSourceRemoteInterface {
  final ProductService _productService;

  ProductDataSourceRemote(Dio dio) : _productService = ProductService(dio);

  @override
  Future<ApiResponse<List<ProductDto>>> getProducts() {
    return handleApiCall<List<ProductDto>>(_productService.getProducts());
  }

  @override
  Future<ApiResponse<ProductDto>> createProduct(ProductDto product) {
    return handleApiCall<ProductDto>(
      _productService.createProduct(product: product),
    );
  }
}
