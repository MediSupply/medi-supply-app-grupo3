import '../../entity/product/product.dart';

abstract interface class ProductRepositoryRemoteInterface {
  Future<List<Product>> getProducts();
  Future<Product> createProduct(Product product);
}
