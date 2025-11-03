import 'package:equatable/equatable.dart';

import '../product/product.dart';

class OrderItem extends Equatable {
  final Product producto;
  final int cantidad;
  final double precioUnitario;
  final double precioTotal;

  const OrderItem({
    this.producto = const Product(),
    this.cantidad = 0,
    this.precioUnitario = 0.0,
    this.precioTotal = 0.0,
  });

  @override
  List<Object?> get props => [producto, cantidad, precioUnitario, precioTotal];
}
