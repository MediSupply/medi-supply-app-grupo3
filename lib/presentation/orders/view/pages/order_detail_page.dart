import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_supply_app_grupo3/presentation/design_system/components/snack_bar.dart';

import '../../../design_system/components/button.dart';
import '../../../design_system/tokens/colors.dart';
import '../../view_model/create_order_view_model.dart';
import '../../view_model/state/create_order_state.dart';
import 'products_selector_page.dart';

class OrderDetailPage extends ConsumerWidget {
  const OrderDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CreateOrderState state = ref.watch(createOrderViewModelProvider);
    return Scaffold(
      backgroundColor: ColorsTokens.background,
      bottomNavigationBar: Container(
        color: ColorsTokens.background,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
        child: Button(
          label: 'Confirmar pedido',
          onPressed: () => _confirmOrder(context, ref),
          isLoading: state.isLoading,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                color: ColorsTokens.background,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Resumen de pedido para:'),
                    Text(
                      'Institucion 1',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.orderItems.length,
                  itemBuilder: (context, index) {
                    return ProductItem(
                      product: state.orderItems[index].producto,
                      cantidad: state.orderItems[index].cantidad,
                      onTap: ref
                          .read(createOrderViewModelProvider.notifier)
                          .addOrderItem,
                      readOnly: true,
                    );
                  },
                ),
              ),
              OrderSummary(
                totalPrice: ref
                    .read(createOrderViewModelProvider.notifier)
                    .getTotalPrice(),
                deliveryDate: ref
                    .read(createOrderViewModelProvider.notifier)
                    .getDeliveryDate(),
                deliveryAddress: ref
                    .read(createOrderViewModelProvider.notifier)
                    .getDeliveryAddress(),
                deliveryTimestamp: ref
                    .read(createOrderViewModelProvider.notifier)
                    .getDeliveryTimestamp(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _confirmOrder(BuildContext context, WidgetRef ref) async {
    final bool orderCreated = await ref
        .read(createOrderViewModelProvider.notifier)
        .createOrder();
    if (!context.mounted) return;

    if (orderCreated) {
      SuccessSnackbar(context: context, label: 'Pedido creado exitosamente');
      context.pop();
    } else {
      ErrorSnackbar(context: context, label: 'Error al crear pedido');
    }
  }
}

class OrderSummary extends StatelessWidget {
  final double totalPrice;
  final String deliveryDate;
  final String deliveryAddress;
  final String deliveryTimestamp;
  const OrderSummary({
    super.key,
    required this.totalPrice,
    required this.deliveryDate,
    required this.deliveryAddress,
    required this.deliveryTimestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsTokens.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Precio total: ${totalPrice.toStringAsFixed(2)}'),
          Text('Direccion de entrega: $deliveryAddress'),
          Text('Fecha de entrega: $deliveryDate'),
          Text('Timestamp de entrega calculado: $deliveryTimestamp'),
        ],
      ),
    );
  }
}
