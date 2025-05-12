import 'package:flutter/material.dart';
import 'package:template/screens/confirmation_screen.dart';
import 'package:template/screens/login_screen.dart';
import 'package:template/screens/registration_screen.dart';
import 'package:template/screens/home_screen.dart';
import 'package:template/screens/forgot_password_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String confirmation = '/confirmation';
  static const String forgotPassword = '/forgot-password';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      login: (context) => const LoginScreen(),
      register: (context) => const RegisterScreen(),
      home: (context) => const HomeScreen(),
      confirmation: (context) => const ConfirmationScreen(),
      forgotPassword: (context) => const ForgotPasswordScreen(),
    };
  }
}
