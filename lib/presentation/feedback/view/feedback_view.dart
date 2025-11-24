import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/navigation/navigation.dart';
import '../../../data/repository/entity/client/client.dart';
import '../../design_system/components/button.dart';
import '../../design_system/components/input.dart';
import '../../design_system/tokens/colors.dart';
import '../view_model/feedback_view_model.dart';
import '../view_model/state/feedback_state.dart';

class FeedbackView extends ConsumerStatefulWidget {
  const FeedbackView({super.key});

  @override
  ConsumerState<FeedbackView> createState() => _FeedbackViewState();
}

class _FeedbackViewState extends ConsumerState<FeedbackView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(feedbackViewModelProvider.notifier).getClients();
    });
  }

  @override
  Widget build(BuildContext context) {
    final FeedbackState state = ref.watch(feedbackViewModelProvider);

    return Padding(
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
                      .read(feedbackViewModelProvider.notifier)
                      .setFilterClientName,
                  label: 'Nombre del cliente',
                  hint: 'Filtra por el nombre del cliente',
                ),
                SizedBox(height: 16),
                Center(
                  child: Button(
                    label: 'Filtrar ',
                    onPressed: ref
                        .read(feedbackViewModelProvider.notifier)
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
                  onTap: (client) {
                    ref
                        .read(feedbackViewModelProvider.notifier)
                        .selectClient(client);
                    MediSupplyNavigation.goToFeedbackProducts(context);
                  },
                );
              },
            ),
          ),
        ],
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
