import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/repository/entity/order/order_item.dart';
import '../../../../data/repository/entity/product/product.dart';
import '../../../design_system/components/button.dart';
import '../../../design_system/components/input.dart';
import '../../../design_system/tokens/colors.dart';
import '../../view_model/create_order_view_model.dart';
import '../../view_model/state/create_order_state.dart';

class ProductsSelectorPage extends ConsumerWidget {
  const ProductsSelectorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CreateOrderState state = ref.watch(createOrderViewModelProvider);
    return Scaffold(
      backgroundColor: ColorsTokens.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: ColorsTokens.background,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Selecciona los productos para:'),
                  Text(
                    'Institucion 1',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Input(
                    onChanged: ref
                        .read(createOrderViewModelProvider.notifier)
                        .setFilterProductName,
                    label: 'Nombre del producto',
                    hint: 'Filtra por el nombre del producto',
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: Button(
                      label: 'Filtrar ',
                      onPressed: ref
                          .read(createOrderViewModelProvider.notifier)
                          .filterProducts,
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: state.filteredProducts.length,
                itemBuilder: (context, index) {
                  final cantidad = state.orderItems
                      .firstWhere(
                        (element) =>
                            element.producto.id ==
                            state.filteredProducts[index].id,
                        orElse: () => OrderItem(),
                      )
                      .cantidad;
                  return ProductItem(
                    product: state.filteredProducts[index],
                    cantidad: cantidad == 0 ? null : cantidad,
                    onTap: ref
                        .read(createOrderViewModelProvider.notifier)
                        .addOrderItem,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;
  final int? cantidad;
  final Function(Product, int) onTap;
  final bool readOnly;
  const ProductItem({
    super.key,
    required this.product,
    this.cantidad,
    required this.onTap,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 200,
            child: ListTile(
              tileColor: (cantidad ?? 0) == 0
                  ? ColorsTokens.lightBlue
                  : ColorsTokens.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              title: Text(product.nombre),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.lote),
                  Text(product.descripcion),
                  Text(product.valorUnitario.toString()),
                ],
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Input(
              initialValue: cantidad?.toString(),
              onChanged: (value) =>
                  onTap(product, int.parse(value.isEmpty ? '0' : value)),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              label: 'Cantidad',
              hint: 'Cantidad',
              maxLength: 3,
              readOnly: readOnly,
            ),
          ),
        ],
      ),
    );
  }
}
