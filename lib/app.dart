import 'package:flutter/material.dart';
import 'package:template/auth_wrapper.dart';
import 'package:template/configs/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Template App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      home: const AuthWrapper(),
      routes: AppRoutes.getRoutes()
    );
  }
}