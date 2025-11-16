import 'package:flutter/material.dart';

import '../../../application/navigation/navigation.dart';
import '../../../gen/assets.gen.dart';
import '../../design_system/components/button_icon.dart';

class ClientsView extends StatelessWidget {
  const ClientsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final (label, icon, onPressed) = _buildClientItem(index, context);
          return ButtonIcon(label: label, onPressed: onPressed, icon: icon);
        },
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemCount: 4,
      ),
    );
  }

  (String label, Widget icon, VoidCallback onPressed) _buildClientItem(
    int index,
    BuildContext context,
  ) {
    switch (index) {
      case 0:
        return (
          'Cliente nuevo',
          Assets.icons.addUserIcon.svg(width: 24, height: 24),
          () => MediSupplyNavigation.goToRegisterClient(context),
        );
      case 1:
        return (
          'Consultar cliente',
          Assets.icons.searchIcon.svg(width: 24, height: 24),
          () => MediSupplyNavigation.goToClientDetail(context),
        );
      case 2:
        return (
          'Registar visita',
          Assets.icons.usersIcon.svg(width: 24, height: 24),
          () {},
        );
      case 3:
        return (
          'Consultar visita',
          Assets.icons.searchIcon.svg(width: 24, height: 24),
          () {},
        );
      default:
        return ('', const SizedBox.shrink(), () {});
    }
  }
}
