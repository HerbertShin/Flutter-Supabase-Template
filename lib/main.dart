import 'package:flutter/material.dart';
import 'package:sip_and_skip/app.dart';
import 'package:sip_and_skip/screens/error_screen.dart';
import 'package:sip_and_skip/configs/app_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Load the .env file
    await AppConfig.loadEnv();

    // Ensure the environment variables are available and initialize Supabase
    await AppConfig.initializeSupabase();

    runApp(const App());
  } catch (e) {
    runApp(MaterialApp(
      home: ErrorScreen(
        message: "An error occurred during initialization. Please try restarting the app.",
        resolutionMessage: "If the issue persists, it may be an ongoing problem that is being resolved. Please check back later.",
      ),
    ));
  }
}
