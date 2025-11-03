import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String nombre;
  final String descripcion;
  final String categoria;
  final String condicionesAlmacenamiento;
  final double valorUnitario;
  final DateTime? fechaVencimiento;
  final String lote;
  final DateTime? tiempoEstimadoEntrega;
  final String idProveedor;

  const Product({
    this.id = '',
    this.nombre = '',
    this.descripcion = '',
    this.condicionesAlmacenamiento = '',
    this.valorUnitario = 0.0,
    this.fechaVencimiento,
    this.lote = '',
    this.tiempoEstimadoEntrega,
    this.idProveedor = '',
    this.categoria = '',
  });

  @override
  List<Object?> get props => [
    id,
    nombre,
    descripcion,
    condicionesAlmacenamiento,
    valorUnitario,
    fechaVencimiento,
    lote,
    tiempoEstimadoEntrega,
    idProveedor,
    categoria,
  ];
}
