import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:template/widgets/custom_snackbar.dart';
import 'package:template/utils/validation.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    /// Need to have a web page for password reset
    Future<void> resetPassword() async {
      final email = emailController.text.trim();
    
      try {
        await Supabase.instance.client.auth.resetPasswordForEmail(email);

        if (context.mounted) {
          CustomSnackbar.show(context, 'Password reset link sent! Check your email.', backgroundColor: Colors.green);
        }
      } catch (e) {
        if (context.mounted) {
          CustomSnackbar.showError(context, 'Error: ${e.toString()}');
        }
      }
    }

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
                  'Forgot Password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),
                Form(
                  key: GlobalKey<FormState>(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Enter your email address to receive a password reset link. If valid, you will receive an email with instructions to reset your password.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          labelStyle: TextStyle(color: Colors.black87),
                          contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: Validation.validateEmail,
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: resetPassword,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                        child: const Text('Send Reset Link'),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Return to Login',
                          style: TextStyle(fontSize: 16, color: Colors.blueAccent),
                        ),
                      ),
                    ],
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