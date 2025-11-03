import '../../../../data/repository/entity/client/client.dart';
import '../../../../data/repository/entity/product/product.dart';
import '../../../../data/repository/entity/order/order_item.dart';

class CreateOrderState {
  final List<OrderItem> orderItems;
  final List<Client> clients;
  final List<Client> filteredClients;
  final String filterClientName;
  final List<Product> products;
  final List<Product> filteredProducts;
  final Client? selectedClient;
  final String filterProductName;
  final bool isLoading;

  const CreateOrderState({
    this.orderItems = const [],
    this.clients = const [],
    this.products = const [],
    this.filteredClients = const [],
    this.filterClientName = '',
    this.filteredProducts = const [],
    this.selectedClient,
    this.filterProductName = '',
    this.isLoading = false,
  });

  CreateOrderState copyWith({
    List<OrderItem>? orderItems,
    List<Client>? clients,
    List<Product>? products,
    List<Client>? filteredClients,
    String? filterClientName,
    List<Product>? filteredProducts,
    String? filterProductName,
    bool? isLoading,
    Client? selectedClient,
  }) {
    return CreateOrderState(
      orderItems: orderItems ?? this.orderItems,
      clients: clients ?? this.clients,
      products: products ?? this.products,
      filteredClients: filteredClients ?? this.filteredClients,
      filterClientName: filterClientName ?? this.filterClientName,
      filteredProducts: filteredProducts ?? this.filteredProducts,
      filterProductName: filterProductName ?? this.filterProductName,
      isLoading: isLoading ?? this.isLoading,
      selectedClient: selectedClient ?? this.selectedClient,
    );
  }
}
