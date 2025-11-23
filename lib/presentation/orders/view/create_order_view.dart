import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_supply_app_grupo3/data/repository/entity/user/user.dart';

import '../../../gen/assets.gen.dart';
import '../../design_system/components/button_icon.dart';
import '../../design_system/tokens/colors.dart';
import '../view_model/create_order_view_model.dart';
import 'pages/client_selector_page.dart';
import 'pages/order_detail_page.dart';
import 'pages/products_selector_page.dart';

class PagesBuilder {
  List<Widget> pages = [];

  static List<Widget> makePages(Role role) {
    return switch (role) {
      Role.admin => [
        const ClientSelectorPage(),
        const ProductsSelectorPage(),
        const OrderDetailPage(),
      ],
      Role.user => [const ProductsSelectorPage(), const OrderDetailPage()],
    };
  }
}

class CreateOrderView extends ConsumerStatefulWidget {
  final List<Widget> pages;

  final Role role;
  CreateOrderView({required this.role, super.key})
    : pages = PagesBuilder.makePages(role);

  @override
  ConsumerState<CreateOrderView> createState() => _CreateOrderViewState();
}

class _CreateOrderViewState extends ConsumerState<CreateOrderView> {
  late PageController _pageController;
  int _currentPage = 1;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.role == Role.admin) {
        ref.read(createOrderViewModelProvider.notifier).getClients();
      }
      ref.read(createOrderViewModelProvider.notifier).getProducts();
    });
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
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Assets.images.medisupplyLogoImage.image(
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,

                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index + 1;
                      });
                    },
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => widget.pages[index],
                    itemCount: widget.pages.length,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonIcon(
                      icon: Assets.icons.nextArrowIcon.svg(
                        width: 24,
                        height: 24,
                      ),
                      onPressed: () => _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text('$_currentPage de ${widget.pages.length}'),
                    const SizedBox(width: 16),
                    ButtonIcon(
                      icon: Assets.icons.previousArrowIcon.svg(
                        width: 24,
                        height: 24,
                      ),
                      onPressed: () => _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              top: 32,
              left: 32,
              child: IconButton(
                onPressed: () => context.pop(),
                icon: Icon(Icons.arrow_back),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
