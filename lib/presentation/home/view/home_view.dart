import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../clients/view/clients_view.dart';
import '../../design_system/tokens/colors.dart';
import '../../feedback/view/feedback_view.dart';
import '../../orders/view/orders_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 1;
  late PageController _pageController;

  @override
  initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTokens.background,
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: ColorsTokens.background,
          elevation: 8.0,
          indicatorColor: ColorsTokens.navigationBarBackground,
        ),
        child: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (index) => setState(() {
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
            _selectedIndex = index;
          }),
          destinations: [
            NavigationDestination(
              icon: Assets.icons.sheetIcon.svg(width: 24, height: 24),
              label: 'Pedidos',
            ),
            NavigationDestination(
              icon: Assets.icons.avatarIcon.svg(width: 24, height: 24),
              label: 'Clientes',
            ),
            NavigationDestination(
              icon: Assets.icons.keyIcon.svg(width: 24, height: 24),
              label: 'Recomendaciones',
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Assets.images.medisupplyLogoImage.image(
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const OrdersView(),
                  const ClientsView(),
                  const FeedbackView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
