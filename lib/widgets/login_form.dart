import 'package:flutter/material.dart';
import 'package:sip_and_skip/utils/validation.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onLogin;
  final VoidCallback onRegister;
  final InputDecoration? textFieldDecoration;

  const LoginForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.onLogin,
    required this.onRegister,
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

          /** Login Button */
          ElevatedButton(
            onPressed: onLogin,
            child: const Text('Login'),
          ),

          /** Registration Button */
          TextButton(
            onPressed: onRegister,
            child: const Text('Don\'t have an account? Register'),
          ),
        ],
      ),
    );
  }
}