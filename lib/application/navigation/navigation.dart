import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/clients/view/register_client_view.dart';
import '../../presentation/home/view/home_view.dart';
import '../../presentation/login/view/login_view.dart';
import '../../presentation/register/view/register_view.dart';
import '../../presentation/splash_screen/view/splash_screen_view.dart';

class MediSupplyNavigation {
  static const String _splashScreen = '/';
  static const String _loginScreen = '/login';
  static const String _registerScreen = '/register';
  static const String _homeScreen = '/home';
  static const String _registerClientScreen = '/clients/register';

  static final GoRouter router = GoRouter(
    initialLocation: _splashScreen,
    routes: [
      GoRoute(
        path: _splashScreen,
        name: _splashScreen,
        builder: (context, state) => const SplashScreenView(),
      ),
      GoRoute(
        path: _loginScreen,
        name: _loginScreen,
        builder: (context, state) => LoginView(),
      ),
      GoRoute(
        path: _registerScreen,
        name: _registerScreen,
        builder: (context, state) => RegisterView(),
      ),
      GoRoute(
        path: _homeScreen,
        name: _homeScreen,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: _registerClientScreen,
        name: _registerClientScreen,
        builder: (context, state) => const RegisterClientView(),
      ),
    ],
  );

  static void goReplaceToLogin(BuildContext context) {
    context.pushReplacementNamed(_loginScreen);
  }

  static void goReplaceToRegister(BuildContext context) {
    context.pushReplacementNamed(_registerScreen);
  }

  static void goReplaceToHome(BuildContext context) {
    context.pushReplacementNamed(_homeScreen);
  }

  static void goToRegisterClient(BuildContext context) {
    context.pushNamed(_registerClientScreen);
  }
}
