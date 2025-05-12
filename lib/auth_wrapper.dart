import 'package:flutter/material.dart';
import 'package:sip_and_skip/screens/home_screen.dart';
import 'package:sip_and_skip/screens/login_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  bool _isLoading = true;
  User? _user;

  @override
  void initState() {
    super.initState();
    _checkUser();
  }

  Future<void> _checkUser() async {
    final supabase = Supabase.instance.client;

    // Check if a user is already logged in
    setState(() {
      _user = supabase.auth.currentUser;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_user != null) {
      return const HomeScreen();
    } else {
      return const LoginScreen();
    }
  }
}