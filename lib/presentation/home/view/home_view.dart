import 'package:flutter/material.dart';

import '../../design_system/tokens/colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTokens.background,
      body: Center(child: Text('Home')),
    );
  }
}
