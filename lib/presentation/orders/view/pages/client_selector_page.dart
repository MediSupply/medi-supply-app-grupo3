import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../view_model/create_order_view_model.dart';
import '../../view_model/state/create_order_state.dart';

class ClientSelectorPage extends ConsumerWidget {
  const ClientSelectorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CreateOrderState createOrderViewModel = ref.watch(
      createOrderViewModelProvider,
    );
    return Expanded(
      child: Column(
        children: [
          ListView.builder(
            itemCount: createOrderViewModel.clients.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  ref.watch(createOrderViewModelProvider).clients[index].nombre,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
