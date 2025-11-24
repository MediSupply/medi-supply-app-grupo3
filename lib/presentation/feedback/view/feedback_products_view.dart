import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../data/repository/entity/product/product.dart';
import '../../../gen/assets.gen.dart';
import '../../design_system/components/button.dart';
import '../../design_system/components/input.dart';
import '../../design_system/tokens/colors.dart';
import '../view_model/feedback_view_model.dart';
import '../view_model/state/feedback_state.dart';

class FeedbackProductsView extends ConsumerStatefulWidget {
  const FeedbackProductsView({super.key});

  @override
  ConsumerState<FeedbackProductsView> createState() =>
      _FeedbackProductsViewState();
}

class _FeedbackProductsViewState extends ConsumerState<FeedbackProductsView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(feedbackViewModelProvider.notifier).getProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final FeedbackState state = ref.watch(feedbackViewModelProvider);
    return Scaffold(
      backgroundColor: ColorsTokens.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: ColorsTokens.background,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Selecciona los productos para:'),
                              Text(
                                state.selectedClient?.nombre ?? '',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Input(
                                onChanged: ref
                                    .read(feedbackViewModelProvider.notifier)
                                    .setFilterProductName,
                                label: 'Nombre del producto',
                                hint: 'Filtra por el nombre del producto',
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
                            itemCount: state.filteredProducts.length,
                            itemBuilder: (context, index) {
                              return ProductItem(
                                product: state.filteredProducts[index],
                                onTap: (_, _) {},
                              );
                            },
                          ),
                        ),
                      ],
                    ),
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
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;
  final int? cantidad;
  final Function(Product, int) onTap;
  final bool readOnly;
  const ProductItem({
    super.key,
    required this.product,
    this.cantidad,
    required this.onTap,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        child: ListTile(
          tileColor: (cantidad ?? 0) == 0
              ? ColorsTokens.lightBlue
              : ColorsTokens.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Text(product.nombre),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.lote),
              Text(product.descripcion),
              Text(product.valorUnitario.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
