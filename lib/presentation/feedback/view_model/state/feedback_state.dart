import '../../../../data/repository/entity/client/client.dart';
import '../../../../data/repository/entity/product/product.dart';

class FeedbackState {
  final List<Client> clients;
  final List<Client> filteredClients;
  final String filterClientName;
  final List<Product> products;
  final List<Product> filteredProducts;
  final String filterProductName;
  final bool isLoading;

  final Client? selectedClient;
  const FeedbackState({
    this.clients = const [],
    this.filteredClients = const [],
    this.filterClientName = '',
    this.products = const [],
    this.filteredProducts = const [],
    this.filterProductName = '',
    this.isLoading = false,
    this.selectedClient,
  });

  FeedbackState copyWith({
    List<Client>? clients,
    List<Client>? filteredClients,
    String? filterClientName,
    List<Product>? products,
    List<Product>? filteredProducts,
    String? filterProductName,
    bool? isLoading,
    Client? selectedClient,
  }) {
    return FeedbackState(
      clients: clients ?? this.clients,
      filteredClients: filteredClients ?? this.filteredClients,
      filterClientName: filterClientName ?? this.filterClientName,
      products: products ?? this.products,
      filteredProducts: filteredProducts ?? this.filteredProducts,
      filterProductName: filterProductName ?? this.filterProductName,
      isLoading: isLoading ?? this.isLoading,
      selectedClient: selectedClient ?? this.selectedClient,
    );
  }
}
