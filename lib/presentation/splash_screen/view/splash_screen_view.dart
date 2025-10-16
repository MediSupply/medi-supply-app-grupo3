import 'package:flutter/material.dart';

import '../../../application/navigation/navigation.dart';
import '../../../gen/assets.gen.dart';
import '../../design_system/tokens/colors.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  static const Duration _splashScreenDuration = Duration(seconds: 2);

  @override
  void initState() {
    super.initState();
    Future.delayed(_splashScreenDuration, () {
      if (mounted) MediSupplyNavigation.goReplaceToLogin(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTokens.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Assets.images.medisupplyLogoImage.image(
              width: 280,
              height: 280,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
