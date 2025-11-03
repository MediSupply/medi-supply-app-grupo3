import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/networking/networking.dart';
import '../../../data/data_source/remote/client/client_data_source_remote.dart';
import '../../../data/data_source/remote/order/order_data_source_remote.dart';
import '../../../data/data_source/remote/product/product_data_source_remote.dart';
import '../../../data/repository/entity/client/client.dart';
import '../../../data/repository/entity/order/order.dart';
import '../../../data/repository/entity/order/order_item.dart';
import '../../../data/repository/entity/product/product.dart';
import '../../../data/repository/remote/client/client_repository_remote.dart';
import '../../../data/repository/remote/client/client_repository_remote_interface.dart';
import '../../../data/repository/remote/order/order_repository_remote.dart';
import '../../../data/repository/remote/order/order_repository_remote_interface.dart';
import '../../../data/repository/remote/product/product_repository_remote.dart';
import '../../../data/repository/remote/product/product_repository_remote_interface.dart';
import 'state/create_order_state.dart';

final createOrderViewModelProvider =
    NotifierProvider<CreateOrderViewModel, CreateOrderState>(
      () => CreateOrderViewModel(),
    );

class CreateOrderViewModel extends Notifier<CreateOrderState> {
  late ClientRepositoryRemoteInterface _clientRepositoryRemote;
  late ProductRepositoryRemoteInterface _productRepositoryRemote;
  late OrderRepositoryRemoteInterface _orderRepositoryRemote;

  @override
  CreateOrderState build() {
    _clientRepositoryRemote = ClientRepositoryRemote(
      ClientDataSourceRemote(Networking.instance.dio),
    );
    _productRepositoryRemote = ProductRepositoryRemote(
      ProductDataSourceRemote(Networking.instance.dio),
    );
    _orderRepositoryRemote = OrderRepositoryRemote(
      OrderDataSourceRemote(Networking.instance.dio),
    );
    return CreateOrderState();
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

  void addOrderItem(Product product, int cantidad) {
    if (cantidad > 0 && state.orderItems.isNotEmpty) {
      final orderItem = OrderItem(
        producto: product,
        cantidad: cantidad,
        precioUnitario: product.valorUnitario,
        precioTotal: product.valorUnitario * cantidad,
      );

      state.orderItems.removeWhere(
        (element) => element.producto.id == product.id,
      );

      state = state.copyWith(orderItems: [...state.orderItems, orderItem]);
    }

    if (cantidad > 0 && state.orderItems.isEmpty) {
      final orderItem = OrderItem(
        producto: product,
        cantidad: cantidad,
        precioUnitario: product.valorUnitario,
        precioTotal: product.valorUnitario * cantidad,
      );

      state = state.copyWith(orderItems: [...state.orderItems, orderItem]);
    }

    if (cantidad == 0 && state.orderItems.isNotEmpty) {
      state.orderItems.removeWhere(
        (element) => element.producto.id == product.id,
      );

      state = state.copyWith(orderItems: state.orderItems);
    }
  }

  double getTotalPrice() {
    return state.orderItems.fold(
      0.0,
      (previous, element) => previous + element.precioTotal,
    );
  }

  String getDeliveryDate() {
    return DateTime.now().add(const Duration(days: 3)).toIso8601String();
  }

  String getDeliveryAddress() {
    return state.selectedClient != null
        ? state.selectedClient!.direccion
        : 'Calle 1234 # 12-34';
  }

  String getDeliveryTimestamp() {
    final date = DateTime.now().add(const Duration(days: 3));
    return 'Dias ${date.day}';
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

  Future<bool> createOrder() async {
    state = state.copyWith(isLoading: true);

    final order = Order(
      items: state.orderItems,
      fechaEntregaEstimada: getDeliveryDate(),
      direccionEntrega: getDeliveryAddress(),
      valor: getTotalPrice(),
      estado: 'CREADO',
      fechaCreacion: DateTime.now().toIso8601String(),
    );

    final orderCreated = await AsyncValue.guard(
      () => _orderRepositoryRemote.createOrder(order),
    );
    orderCreated.when(
      data: (order) => state = state.copyWith(isLoading: false),
      error: (error, stackTrace) => state = state.copyWith(isLoading: false),
      loading: () => state = state.copyWith(isLoading: true),
    );

    return !orderCreated.hasError;
  }
}
