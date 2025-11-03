import '../../api/api_response.dart';
import '../../dto/product/product_dto.dart';

abstract interface class ProductDataSourceRemoteInterface {
  Future<ApiResponse<List<ProductDto>>> getProducts();
  Future<ApiResponse<ProductDto>> createProduct(ProductDto product);
}
