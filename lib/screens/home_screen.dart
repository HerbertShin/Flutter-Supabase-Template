import 'package:sip_and_skip/configs/routes.dart';
import 'package:sip_and_skip/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:sip_and_skip/widgets/custom_snackbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _signOut(BuildContext context) async {
    final authService = AuthService();

    try {
      await authService.signOut();

      if (context.mounted) {
        // Navigate to the login screen and remove all previous routes
        Navigator.pushNamedAndRemoveUntil(context, AppRoutes.login, (route) => false);
      }
    } catch (e) {
      if (context.mounted) {
        CustomSnackbar.showError(context, 'Error during sign out, please try again.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _signOut(context),
          ),
        ],
      ),
      body: const Center(
        child: Text('Welcome to the Home Screen!'),
      ),
    );
  }
}
