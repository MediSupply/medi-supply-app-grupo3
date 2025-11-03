import 'package:equatable/equatable.dart';

import 'order_item.dart';

class Order extends Equatable {
  final String id;
  final double valor;
  final String estado;
  final String fechaCreacion;
  final String fechaEntregaEstimada;
  final String direccionEntrega;
  final List<OrderItem> items;

  const Order({
    this.id = '',
    this.items = const [],
    this.valor = 0.0,
    this.estado = '',
    this.fechaCreacion = '',
    this.fechaEntregaEstimada = '',
    this.direccionEntrega = '',
  });

  @override
  List<Object?> get props => [
    id,
    items,
    valor,
    estado,
    fechaCreacion,
    fechaEntregaEstimada,
    direccionEntrega,
  ];
}
