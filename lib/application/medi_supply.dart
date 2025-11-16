import 'package:flutter/material.dart';
import 'package:medi_supply_app_grupo3/application/navigation/navigation.dart';

class MediSupply extends StatelessWidget {
  const MediSupply({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'MediSupply App',
      routerConfig: MediSupplyNavigation.router,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
    );
  }
}
