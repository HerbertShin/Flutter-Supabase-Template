import 'package:flutter/material.dart';
import 'package:template/utils/validation.dart';

class RegistrationForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onRegister;
  final VoidCallback onLogin;
  final InputDecoration? textFieldDecoration;

  const RegistrationForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.onRegister,
    required this.onLogin,
    this.textFieldDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          /** Email Textfield */
          TextFormField(
            controller: emailController,
            decoration: textFieldDecoration?.copyWith(labelText: 'Email') ?? const InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
            validator: Validation.validateEmail,
          ),
          const SizedBox(height: 15),
          /** Password Textfield */
          TextFormField(
            controller: passwordController,
            decoration: textFieldDecoration?.copyWith(labelText: 'Password') ?? const InputDecoration(labelText: 'Password'),
            obscureText: true,
            validator: Validation.validatePassword,
          ),
          const SizedBox(height: 20),

          /** Register Button */
          ElevatedButton(
            onPressed: onRegister,
            child: const Text('Register'),
          ),

          /** Login Button */
          TextButton(
            onPressed: onLogin,
            child: const Text('Already have an account? Login'),
          ),
        ],
      ),
    );
  }
}
