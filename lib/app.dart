import 'package:flutter/material.dart';
import 'package:sip_and_skip/auth_wrapper.dart';
import 'package:sip_and_skip/configs/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sip and Skip',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      home: const AuthWrapper(),
      routes: AppRoutes.getRoutes()
    );
  }
}