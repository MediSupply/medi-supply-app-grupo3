import 'package:flutter/material.dart';

import '../../../application/navigation/navigation.dart';
import '../../../data/repository/entity/user/user.dart';
import '../../../gen/assets.gen.dart';
import '../../design_system/components/button_icon.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final (label, icon, onPressed) = _buildOrderItem(index, context);
          return ButtonIcon(label: label, onPressed: onPressed, icon: icon);
        },
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemCount: 2,
      ),
    );
  }

  (String label, Widget icon, VoidCallback onPressed) _buildOrderItem(
    int index,
    BuildContext context,
  ) {
    switch (index) {
      case 0:
        return (
          'Crear pedido',
          Assets.icons.addUserIcon.svg(width: 24, height: 24),
          () => MediSupplyNavigation.goToCreateOrder(context, Role.USER),
        );
      case 1:
        return (
          'Seguimiento pedido',
          Assets.icons.searchIcon.svg(width: 24, height: 24),
          () {},
        );
      default:
        return ('', const SizedBox.shrink(), () {});
    }
  }
}
