import 'package:flutter/material.dart';
import 'package:sip_and_skip/configs/routes.dart';
import 'package:sip_and_skip/widgets/login_form.dart';
import 'package:sip_and_skip/widgets/custom_snackbar.dart';
import 'package:sip_and_skip/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _authService = AuthService();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    try {
      await _authService.signIn(email, password);

      if (!mounted) return;

      Navigator.pushNamedAndRemoveUntil(context, AppRoutes.home, (route) => false);
    } catch (e) {
      String errorMessage = _getErrorMessage(e.toString());
      CustomSnackbar.showError(context, errorMessage);
    }
  }

  String _getErrorMessage(String errorMsg) {
    if (errorMsg.contains('invalid_credentials')) {
      return 'Invalid email/password. Please try again.';
    } else if (errorMsg.contains('email_not_confirmed')) {
      return 'Email not confirmed. Please check your inbox.';
    } else {
      return 'Something unexpected happened. Please try again later.';
    }
  }

  void _navigateToForgotPassword() {
    Navigator.pushNamed(context, AppRoutes.forgotPassword);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Log in to your account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 36),
                LoginForm(
                  formKey: _formKey,
                  emailController: _emailController,
                  passwordController: _passwordController,
                  onLogin: _login,
                  onRegister: () {
                    Navigator.pushNamedAndRemoveUntil(context, AppRoutes.register, (route) => false);
                  },
                  textFieldDecoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(color: Colors.black87),
                    contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                  ),
                ),
                TextButton(
                  onPressed: _navigateToForgotPassword,
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(fontSize: 16, color: Colors.blueAccent),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'By logging in, you agree to our Terms of Service and Privacy Policy.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
