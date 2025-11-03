import '../../../data_source/api/api_response.dart';
import '../../../data_source/dto/product/product_dto.dart';
import '../../../data_source/remote/product/product_data_source_remote_interface.dart';
import '../../entity/product/product.dart';
import '../../mappers/product_mapper.dart';

import 'product_repository_remote_interface.dart';

class ProductRepositoryRemote implements ProductRepositoryRemoteInterface {
  final ProductDataSourceRemoteInterface _productDataSourceRemote;

  ProductRepositoryRemote(this._productDataSourceRemote);

  @override
  Future<List<Product>> getProducts() async {
    final ApiResponse<List<ProductDto>> response =
        await _productDataSourceRemote.getProducts();

    return response.when(
      onSuccess: (data) => data.map((dto) => dto.toEntity()).toList(),
      onFailure: (error, statusCode, data) => throw Exception(error),
    );
  }

  @override
  Future<Product> createProduct(Product product) async {
    final ApiResponse<ProductDto> response = await _productDataSourceRemote
        .createProduct(product.toDto());

    return response.when(
      onSuccess: (data) => data.toEntity(),
      onFailure: (error, statusCode, data) => throw Exception(error),
    );
  }
}

final List<Product> mockProducts = [
  Product(
    id: '1',
    nombre: 'Aspirina',
    descripcion: 'Medicamento para el dolor y la fiebre',
    categoria: 'Medicamento',
    condicionesAlmacenamiento: 'Lugar fresco y seco',
    valorUnitario: 25.5,
    fechaVencimiento: DateTime(2025, 12, 31),
    lote: 'A1001',
    tiempoEstimadoEntrega: DateTime(2024, 7, 10),
    idProveedor: 'P001',
  ),
  Product(
    id: '2',
    nombre: 'Paracetamol',
    descripcion: 'Analgésico y antipirético',
    categoria: 'Medicamento',
    condicionesAlmacenamiento: 'Mantener cerrado',
    valorUnitario: 15.0,
    fechaVencimiento: DateTime(2026, 1, 20),
    lote: 'B2002',
    tiempoEstimadoEntrega: DateTime(2024, 7, 12),
    idProveedor: 'P002',
  ),
  Product(
    id: '3',
    nombre: 'Guantes de látex',
    descripcion: 'Guantes desechables para exámenes médicos',
    categoria: 'Insumos',
    condicionesAlmacenamiento: 'Sin exposición al sol',
    valorUnitario: 40.2,
    fechaVencimiento: DateTime(2028, 8, 15),
    lote: 'C3003',
    tiempoEstimadoEntrega: DateTime(2024, 7, 15),
    idProveedor: 'P003',
  ),
  Product(
    id: '4',
    nombre: 'Alcohol en gel',
    descripcion: 'Gel antiséptico para manos',
    categoria: 'Higiene',
    condicionesAlmacenamiento: 'Ambiente cerrado',
    valorUnitario: 8.8,
    fechaVencimiento: DateTime(2025, 3, 10),
    lote: 'D4004',
    tiempoEstimadoEntrega: DateTime(2024, 7, 18),
    idProveedor: 'P004',
  ),
  Product(
    id: '5',
    nombre: 'Termómetro digital',
    descripcion: 'Termómetro para medir temperatura corporal',
    categoria: 'Equipos',
    condicionesAlmacenamiento: 'Evitar humedad',
    valorUnitario: 120.9,
    fechaVencimiento: null,
    lote: 'E5005',
    tiempoEstimadoEntrega: DateTime(2024, 7, 20),
    idProveedor: 'P005',
  ),
  Product(
    id: '6',
    nombre: 'Jeringas 5ml',
    descripcion: 'Jeringas desechables de 5 ml',
    categoria: 'Insumos',
    condicionesAlmacenamiento: 'Lugar oscuro',
    valorUnitario: 3.0,
    fechaVencimiento: DateTime(2027, 2, 11),
    lote: 'F6006',
    tiempoEstimadoEntrega: DateTime(2024, 7, 11),
    idProveedor: 'P006',
  ),
  Product(
    id: '7',
    nombre: 'Betadine',
    descripcion: 'Antiséptico tópico',
    categoria: 'Medicamento',
    condicionesAlmacenamiento: 'Temperatura ambiente',
    valorUnitario: 18.5,
    fechaVencimiento: DateTime(2024, 11, 17),
    lote: 'G7007',
    tiempoEstimadoEntrega: DateTime(2024, 7, 19),
    idProveedor: 'P001',
  ),
  Product(
    id: '8',
    nombre: 'Gasas estériles',
    descripcion: 'Paquete de gasas para curaciones',
    categoria: 'Insumos',
    condicionesAlmacenamiento: 'Seco y ventilado',
    valorUnitario: 10.0,
    fechaVencimiento: DateTime(2029, 6, 1),
    lote: 'H8008',
    tiempoEstimadoEntrega: DateTime(2024, 7, 14),
    idProveedor: 'P003',
  ),
  Product(
    id: '9',
    nombre: 'Mascarillas N95',
    descripcion: 'Mascarillas de protección respiratoria N95',
    categoria: 'Insumos',
    condicionesAlmacenamiento: 'Empaque cerrado',
    valorUnitario: 22.0,
    fechaVencimiento: DateTime(2026, 9, 25),
    lote: 'I9009',
    tiempoEstimadoEntrega: DateTime(2024, 7, 22),
    idProveedor: 'P002',
  ),
  Product(
    id: '10',
    nombre: 'Suero fisiológico',
    descripcion: 'Solución estéril para limpieza de heridas',
    categoria: 'Medicamento',
    condicionesAlmacenamiento: 'Entre 10-25°C',
    valorUnitario: 6.5,
    fechaVencimiento: DateTime(2027, 12, 8),
    lote: 'J1010',
    tiempoEstimadoEntrega: DateTime(2024, 7, 21),
    idProveedor: 'P005',
  ),
  Product(
    id: '11',
    nombre: 'Tensiometro',
    descripcion: 'Equipo para medir presión arterial',
    categoria: 'Equipos',
    condicionesAlmacenamiento: 'Libre de polvo',
    valorUnitario: 400.0,
    fechaVencimiento: null,
    lote: 'K1111',
    tiempoEstimadoEntrega: DateTime(2024, 7, 25),
    idProveedor: 'P006',
  ),
  Product(
    id: '12',
    nombre: 'Esparadrapo',
    descripcion: 'Cinta adhesiva para fijar vendajes',
    categoria: 'Insumos',
    condicionesAlmacenamiento: 'Lugar seco',
    valorUnitario: 5.5,
    fechaVencimiento: DateTime(2030, 4, 14),
    lote: 'L1212',
    tiempoEstimadoEntrega: DateTime(2024, 7, 28),
    idProveedor: 'P004',
  ),
  Product(
    id: '13',
    nombre: 'Lampara de exploración',
    descripcion: 'Lámpara portátil para exámenes médicos',
    categoria: 'Equipos',
    condicionesAlmacenamiento: 'Proteger de caídas',
    valorUnitario: 899.99,
    fechaVencimiento: null,
    lote: 'M1313',
    tiempoEstimadoEntrega: DateTime(2024, 8, 2),
    idProveedor: 'P003',
  ),
  Product(
    id: '14',
    nombre: 'Venda elástica',
    descripcion: 'Venda para inmovilización o soporte',
    categoria: 'Insumos',
    condicionesAlmacenamiento: 'Temperatura ambiente',
    valorUnitario: 14.0,
    fechaVencimiento: DateTime(2028, 5, 22),
    lote: 'N1414',
    tiempoEstimadoEntrega: DateTime(2024, 8, 1),
    idProveedor: 'P005',
  ),
  Product(
    id: '15',
    nombre: 'Oxímetro de pulso',
    descripcion: 'Dispositivo para medir saturación de oxígeno',
    categoria: 'Equipos',
    condicionesAlmacenamiento: 'Guardar en estuche',
    valorUnitario: 320.0,
    fechaVencimiento: null,
    lote: 'O1515',
    tiempoEstimadoEntrega: DateTime(2024, 8, 3),
    idProveedor: 'P002',
  ),
];
