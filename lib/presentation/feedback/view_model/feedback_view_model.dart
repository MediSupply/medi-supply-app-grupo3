import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/networking/networking.dart';
import '../../../data/data_source/remote/client/client_data_source_remote.dart';
import '../../../data/data_source/remote/product/product_data_source_remote.dart';
import '../../../data/repository/entity/client/client.dart';
import '../../../data/repository/entity/product/product.dart';
import '../../../data/repository/remote/client/client_repository_remote.dart';
import '../../../data/repository/remote/client/client_repository_remote_interface.dart';
import '../../../data/repository/remote/product/product_repository_remote.dart';
import '../../../data/repository/remote/product/product_repository_remote_interface.dart';
import 'state/feedback_state.dart';

final NotifierProvider<FeedbackViewModel, FeedbackState>
feedbackViewModelProvider = NotifierProvider<FeedbackViewModel, FeedbackState>(
  () => FeedbackViewModel(),
);

class FeedbackViewModel extends Notifier<FeedbackState> {
  late ClientRepositoryRemoteInterface _clientRepositoryRemote;
  late ProductRepositoryRemoteInterface _productRepositoryRemote;

  @override
  FeedbackState build() {
    _clientRepositoryRemote = ClientRepositoryRemote(
      ClientDataSourceRemote(Networking.instance.dio),
    );
    _productRepositoryRemote = ProductRepositoryRemote(
      ProductDataSourceRemote(Networking.instance.dio),
    );
    return FeedbackState();
  }

  void setFilterProductName(String filterProductName) {
    state = state.copyWith(filterProductName: filterProductName);
  }

  void setFilterClientName(String filterClientName) {
    state = state.copyWith(filterClientName: filterClientName);
  }

  void filterClients() {
    final List<Client> clients = state.clients
        .where(
          (element) => element.nombre.toUpperCase().contains(
            state.filterClientName.toUpperCase(),
          ),
        )
        .toList();

    state = state.copyWith(filteredClients: clients);
  }

  void filterProducts() {
    final List<Product> products = state.products
        .where(
          (element) => element.nombre.toUpperCase().contains(
            state.filterProductName.toUpperCase(),
          ),
        )
        .toList();

    state = state.copyWith(filteredProducts: products);
  }

  void selectClient(Client client) {
    state = state.copyWith(selectedClient: client);
  }

  void getClients() async {
    state = state.copyWith(isLoading: true);
    final clients = await AsyncValue.guard(
      () => _clientRepositoryRemote.getClients(),
    );
    clients.when(
      data: (clients) => state = state.copyWith(
        clients: clients,
        filteredClients: clients,
        isLoading: false,
      ),
      error: (error, stackTrace) => state = state.copyWith(isLoading: false),
      loading: () => state = state.copyWith(isLoading: true),
    );
  }

  void getProducts() async {
    state = state.copyWith(isLoading: true);
    final products = await AsyncValue.guard(
      () => _productRepositoryRemote.getProducts(),
    );
    products.when(
      data: (products) => state = state.copyWith(
        products: products,
        filteredProducts: products,
        isLoading: false,
      ),
      error: (error, stackTrace) => state = state.copyWith(isLoading: false),
      loading: () => state = state.copyWith(isLoading: true),
    );
  }

  Future<void> createFeedback() async {}
}
