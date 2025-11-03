import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/repository/entity/client/client.dart';
import '../../../design_system/components/button.dart';
import '../../../design_system/components/input.dart';
import '../../../design_system/tokens/colors.dart';
import '../../view_model/create_order_view_model.dart';
import '../../view_model/state/create_order_state.dart';

class ClientSelectorPage extends ConsumerWidget {
  const ClientSelectorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CreateOrderState state = ref.watch(createOrderViewModelProvider);
    return Scaffold(
      backgroundColor: ColorsTokens.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: ColorsTokens.background,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Selecciona el cliente para:'),

                  Input(
                    onChanged: ref
                        .read(createOrderViewModelProvider.notifier)
                        .setFilterClientName,
                    label: 'Nombre del cliente',
                    hint: 'Filtra por el nombre del cliente',
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
                itemCount: state.filteredClients.length,
                itemBuilder: (context, index) {
                  return ClientItem(
                    client: state.filteredClients[index],
                    isSelected:
                        state.selectedClient == state.filteredClients[index],
                    onTap: ref
                        .read(createOrderViewModelProvider.notifier)
                        .selectClient,
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

class ClientItem extends StatelessWidget {
  final Client client;
  final bool isSelected;
  final Function(Client) onTap;
  const ClientItem({
    super.key,
    required this.client,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: isSelected ? ColorsTokens.blue : ColorsTokens.lightBlue,
        title: Text(
          client.nombre,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(client.direccion),
        onTap: () => onTap(client),
      ),
    );
  }
}
