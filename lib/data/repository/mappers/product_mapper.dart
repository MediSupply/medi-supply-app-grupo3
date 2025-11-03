import '../../data_source/dto/product/product_dto.dart';
import '../entity/product/product.dart';

extension ProductDtoMapper on ProductDto {
  Product toEntity() {
    return Product(
      id: id,
      nombre: nombre,
      descripcion: descripcion,
      condicionesAlmacenamiento: condicionesAlmacenamiento,
      valorUnitario: valorUnitario,
      fechaVencimiento: fechaVencimiento,
      lote: lote,
      tiempoEstimadoEntrega: tiempoEstimadoEntrega,
      idProveedor: idProveedor,
      categoria: categoria,
    );
  }
}

extension ProductEntityMapper on Product {
  ProductDto toDto() {
    return ProductDto(
      id: id,
      nombre: nombre,
      descripcion: descripcion,
      condicionesAlmacenamiento: condicionesAlmacenamiento,
      valorUnitario: valorUnitario,
      fechaVencimiento: fechaVencimiento,
      lote: lote,
      tiempoEstimadoEntrega: tiempoEstimadoEntrega,
      idProveedor: idProveedor,
      categoria: categoria,
    );
  }
}
