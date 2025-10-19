import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../gen/assets.gen.dart';
import '../../design_system/components/button.dart';
import '../../design_system/components/input.dart';
import '../../design_system/tokens/colors.dart';

class RegisterClientView extends ConsumerWidget {
  const RegisterClientView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorsTokens.background,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
        child: Button(label: 'Registrar cliente', onPressed: () {}),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Assets.images.medisupplyLogoImage.image(
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 32),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Registro de cliente'),
                        const SizedBox(height: 16),
                        Input(
                          label: 'Nombre(s) y apellidos o razón social',
                          hint: 'Ingresa tu nombre o razón social',
                          onChanged: (value) {},
                        ),
                        const SizedBox(height: 16),
                        Input(
                          label: 'Tipo de documento',
                          hint: 'Ingresa tu tipo de documento',
                          onChanged: (value) {},
                        ),
                        const SizedBox(height: 16),
                        Input(
                          label: 'Número de documento',
                          hint: 'Ingresa tu número de documento',
                          onChanged: (value) {},
                        ),
                        const SizedBox(height: 16),
                        Input(
                          label: 'Dirección principal',
                          hint: 'Ingresa tu dirección principal',
                          onChanged: (value) {},
                        ),
                        const SizedBox(height: 16),
                        Input(
                          label: 'Teléfono de contacto',
                          hint: 'Ingresa tu teléfono de contacto',
                          onChanged: (value) {},
                        ),
                        const SizedBox(height: 16),
                        Input(
                          label: 'Correo electrónico',
                          hint: 'Ingresa tu correo electrónico',
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 32,
                left: 0,
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
