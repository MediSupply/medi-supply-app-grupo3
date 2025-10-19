import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/navigation/navigation.dart';
import '../../../gen/assets.gen.dart';
import '../../design_system/components/button.dart';
import '../../design_system/components/input.dart';
import '../../design_system/components/snack_bar.dart';
import '../../design_system/tokens/colors.dart';
import '../view_model/register_view_model.dart';
import '../view_model/state/register_state.dart';

class RegisterView extends ConsumerWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  RegisterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final RegisterState state = ref.watch(registerViewModelProvider);

    return Scaffold(
      backgroundColor: ColorsTokens.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Assets.images.medisupplyLogoImage.image(
                width: 190,
                height: 190,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ColorsTokens.lightBlue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(32),
                  margin: const EdgeInsets.only(bottom: 24),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Input(
                            label: 'Nombre(s) y apellidos o razón social',
                            hint: 'Ingresa tu nombre o razón social',
                            readOnly: state.isLoading,
                            onChanged: ref
                                .read(registerViewModelProvider.notifier)
                                .setName,
                            validator: (_) => ref
                                .read(registerViewModelProvider.notifier)
                                .validateUserName(),
                          ),
                          const SizedBox(height: 32),
                          Input(
                            label: 'Tipo de documento',
                            hint: 'Ingresa tu tipo de documento',
                            readOnly: state.isLoading,
                            onChanged: ref
                                .read(registerViewModelProvider.notifier)
                                .setDocumentType,
                            validator: (_) => ref
                                .read(registerViewModelProvider.notifier)
                                .validateUserDocumentType(),
                          ),
                          const SizedBox(height: 32),
                          Input(
                            label: 'Número de documento',
                            hint: 'Ingresa tu número de documento',
                            readOnly: state.isLoading,
                            onChanged: (value) => ref
                                .read(registerViewModelProvider.notifier)
                                .setDocumentNumber(int.tryParse(value) ?? 0),
                            validator: (_) => ref
                                .read(registerViewModelProvider.notifier)
                                .validateUserDocumentNumber(),
                          ),
                          const SizedBox(height: 32),
                          Input(
                            label: 'Dirección principal',
                            hint: 'Ingresa tu dirección principal',
                            readOnly: state.isLoading,
                            onChanged: ref
                                .read(registerViewModelProvider.notifier)
                                .setAddress,
                            validator: (_) => ref
                                .read(registerViewModelProvider.notifier)
                                .validateUserAddress(),
                          ),
                          const SizedBox(height: 32),
                          Input(
                            label: 'Teléfono de contacto',
                            hint: 'Ingresa tu teléfono de contacto',
                            readOnly: state.isLoading,
                            onChanged: ref
                                .read(registerViewModelProvider.notifier)
                                .setPhone,
                            validator: (_) => ref
                                .read(registerViewModelProvider.notifier)
                                .validateUserPhone(),
                          ),
                          const SizedBox(height: 32),
                          Input(
                            label: 'Correo electrónico',
                            hint: 'Ingresa tu correo electrónico',
                            readOnly: state.isLoading,
                            onChanged: ref
                                .read(registerViewModelProvider.notifier)
                                .setEmail,
                            validator: (_) => ref
                                .read(registerViewModelProvider.notifier)
                                .validateUserEmail(),
                          ),
                          const SizedBox(height: 32),
                          Input(
                            label: 'Contraseña',
                            hint: 'Ingresa tu contraseña',
                            obscureText: true,
                            readOnly: state.isLoading,
                            onChanged: ref
                                .read(registerViewModelProvider.notifier)
                                .setPassword,
                            validator: (_) => ref
                                .read(registerViewModelProvider.notifier)
                                .validateUserPassword(),
                          ),
                          const SizedBox(height: 32),
                          Button(
                            label: 'Registrar usuario',
                            onPressed: () async => await _register(ref),
                            isLoading: state.isLoading,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('¿Ya tienes una cuenta?'),
                  const SizedBox(width: 4),
                  TextButton(
                    onPressed: () =>
                        MediSupplyNavigation.goReplaceToLogin(context),
                    child: Text('Inicia sesión'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _register(WidgetRef ref) async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (!_formKey.currentState!.validate()) return;
    final bool isRegistered = await ref
        .read(registerViewModelProvider.notifier)
        .register();
    if (!ref.context.mounted) return;
    if (isRegistered) {
      SuccessSnackbar(context: ref.context, label: 'Registro exitoso');
      MediSupplyNavigation.goReplaceToHome(ref.context);
    } else {
      ErrorSnackbar(context: ref.context, label: 'Error al registrar usuario');
    }
  }
}
