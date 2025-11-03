import '../../../../data/repository/entity/client/client.dart';
import '../../../../data/repository/entity/product/product.dart';
import '../../../../data/repository/entity/order/order_item.dart';

class CreateOrderState {
  final List<OrderItem> orderItems;
  final List<Client> clients;
  final List<Product> products;
  final List<Product> filteredProducts;
  final String filterProductName;
  final bool isLoading;

  const CreateOrderState({
    this.orderItems = const [],
    this.clients = const [],
    this.products = const [],
    this.filteredProducts = const [],
    this.filterProductName = '',
    this.isLoading = false,
  });

  CreateOrderState copyWith({
    List<OrderItem>? orderItems,
    List<Client>? clients,
    List<Product>? products,
    List<Product>? filteredProducts,
    String? filterProductName,
    bool? isLoading,
  }) {
    return CreateOrderState(
      orderItems: orderItems ?? this.orderItems,
      clients: clients ?? this.clients,
      products: products ?? this.products,
      filteredProducts: filteredProducts ?? this.filteredProducts,
      filterProductName: filterProductName ?? this.filterProductName,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
