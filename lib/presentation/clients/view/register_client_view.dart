import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../gen/assets.gen.dart';
import '../../design_system/components/button.dart';
import '../../design_system/components/input.dart';
import '../../design_system/components/snack_bar.dart';
import '../../design_system/tokens/colors.dart';
import '../view_model/register_client_view_model.dart';
import '../view_model/state/register_client_state.dart';

class RegisterClientView extends ConsumerWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  RegisterClientView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final RegisterClientState registerClientViewModel = ref.watch(
      registerClientViewModelProvider,
    );

    return Scaffold(
      backgroundColor: ColorsTokens.background,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
        child: Button(
          label: 'Registrar cliente',
          onPressed: () => _registerClient(context, ref),
          isLoading: registerClientViewModel.isLoading,
        ),
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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Registro de cliente'),
                          const SizedBox(height: 16),
                          Input(
                            label: 'Nombre(s) y apellidos o razón social',
                            hint: 'Ingresa tu nombre o razón social',
                            validator: (_) => ref
                                .read(registerClientViewModelProvider.notifier)
                                .validateClientNombre(),
                            readOnly: registerClientViewModel.isLoading,
                            onChanged: ref
                                .read(registerClientViewModelProvider.notifier)
                                .setNombre,
                          ),
                          const SizedBox(height: 16),
                          Input(
                            label: 'Tipo de documento',
                            hint: 'Ingresa tu tipo de documento',
                            validator: (_) => ref
                                .read(registerClientViewModelProvider.notifier)
                                .validateClientRazonSocial(),
                            readOnly: registerClientViewModel.isLoading,
                            onChanged: ref
                                .read(registerClientViewModelProvider.notifier)
                                .setRazonSocial,
                          ),
                          const SizedBox(height: 16),
                          Input(
                            label: 'Número de documento',
                            hint: 'Ingresa tu número de documento',
                            validator: (_) => ref
                                .read(registerClientViewModelProvider.notifier)
                                .validateClientNit(),
                            readOnly: registerClientViewModel.isLoading,
                            onChanged: ref
                                .read(registerClientViewModelProvider.notifier)
                                .setNit,
                          ),
                          const SizedBox(height: 16),
                          Input(
                            label: 'Dirección principal',
                            hint: 'Ingresa tu dirección principal',
                            validator: (_) => ref
                                .read(registerClientViewModelProvider.notifier)
                                .validateClientDireccion(),
                            readOnly: registerClientViewModel.isLoading,
                            onChanged: ref
                                .read(registerClientViewModelProvider.notifier)
                                .setDireccion,
                          ),
                          const SizedBox(height: 16),
                          Input(
                            label: 'Teléfono de contacto',
                            hint: 'Ingresa tu teléfono de contacto',
                            validator: (_) => ref
                                .read(registerClientViewModelProvider.notifier)
                                .validateClientTelefono(),
                            readOnly: registerClientViewModel.isLoading,
                            onChanged: ref
                                .read(registerClientViewModelProvider.notifier)
                                .setTelefono,
                          ),
                          const SizedBox(height: 16),
                          Input(
                            label: 'Correo electrónico',
                            hint: 'Ingresa tu correo electrónico',
                            validator: (_) => ref
                                .read(registerClientViewModelProvider.notifier)
                                .validateClientEmail(),
                            readOnly: registerClientViewModel.isLoading,
                            onChanged: ref
                                .read(registerClientViewModelProvider.notifier)
                                .setEmail,
                          ),
                        ],
                      ),
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

  void _registerClient(BuildContext context, WidgetRef ref) async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (!_formKey.currentState!.validate()) return;
    final bool isRegistered = await ref
        .read(registerClientViewModelProvider.notifier)
        .registerClient();
    if (!context.mounted) return;
    if (isRegistered) {
      SuccessSnackbar(
        context: context,
        label: 'Cliente registrado exitosamente',
      );
      context.pop();
    } else {
      ErrorSnackbar(context: context, label: 'Error al registrar cliente');
    }
  }
}
