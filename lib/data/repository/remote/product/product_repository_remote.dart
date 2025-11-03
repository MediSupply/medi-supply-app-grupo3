import '../../../data_source/api/api_response.dart';
import '../../../data_source/dto/product/product_dto.dart';
import '../../../data_source/remote/product/product_data_source_remote_interface.dart';
import '../../entity/product/product.dart';
import '../../mappers/product_mapper.dart';

import 'product_repository_remote_interface.dart';

class ProductRepositoryRemote implements ProductRepositoryRemoteInterface {
  final ProductDataSourceRemoteInterface _productDataSourceRemote;

  ProductRepositoryRemote(this._productDataSourceRemote);

  @override
  Future<List<Product>> getProducts() async {
    final ApiResponse<List<ProductDto>> response =
        await _productDataSourceRemote.getProducts();

    return response.when(
      onSuccess: (data) => data.map((dto) => dto.toEntity()).toList(),
      onFailure: (error, statusCode, data) => throw Exception(error),
    );
  }

  @override
  Future<Product> createProduct(Product product) async {
    final ApiResponse<ProductDto> response = await _productDataSourceRemote
        .createProduct(product.toDto());

    return response.when(
      onSuccess: (data) => data.toEntity(),
      onFailure: (error, statusCode, data) => throw Exception(error),
    );
  }
}
