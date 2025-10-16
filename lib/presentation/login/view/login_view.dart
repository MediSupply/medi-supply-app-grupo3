import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/navigation/navigation.dart';
import '../../../gen/assets.gen.dart';
import '../../design_system/components/button.dart';
import '../../design_system/components/input.dart';
import '../../design_system/components/snack_bar.dart';
import '../../design_system/tokens/colors.dart';
import '../view_model/login_view_model.dart';
import '../view_model/state/login_state.dart';

class LoginView extends ConsumerWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final LoginState state = ref.watch(loginViewModelProvider);

    return Scaffold(
      backgroundColor: ColorsTokens.background,
      body: Padding(
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
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorsTokens.lightBlue,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(32),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Input(
                      label: 'Correo electrónico',
                      hint: 'Ingresa tu correo electrónico',
                      readOnly: state.isLoading,
                      onChanged: ref
                          .read(loginViewModelProvider.notifier)
                          .setEmail,
                      validator: (_) => ref
                          .read(loginViewModelProvider.notifier)
                          .validateUserEmail(),
                    ),
                    const SizedBox(height: 32),
                    Input(
                      label: 'Contraseña',
                      obscureText: true,
                      hint: 'Ingresa tu contraseña',
                      readOnly: state.isLoading,
                      onChanged: ref
                          .read(loginViewModelProvider.notifier)
                          .setPassword,
                      validator: (_) => ref
                          .read(loginViewModelProvider.notifier)
                          .validateUserPassword(),
                    ),
                    const SizedBox(height: 32),
                    Button(
                      label: 'Iniciar sesión',
                      onPressed: () async => await _login(ref),
                      isLoading: state.isLoading,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _login(WidgetRef ref) async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (!_formKey.currentState!.validate()) return;
    final bool isLogged = await ref
        .read(loginViewModelProvider.notifier)
        .login();
    if (!ref.context.mounted) return;
    if (isLogged) {
      SuccessSnackbar(context: ref.context, label: 'Inicio de sesión exitoso');
      MediSupplyNavigation.goReplaceToHome(ref.context);
    } else {
      ErrorSnackbar(context: ref.context, label: 'Error al iniciar sesión');
    }
  }
}
