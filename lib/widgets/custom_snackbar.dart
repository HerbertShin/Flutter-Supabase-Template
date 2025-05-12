import 'package:flutter/material.dart';

class CustomSnackbar {
  static void show(BuildContext context, String message, {Color backgroundColor = Colors.green}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        backgroundColor: backgroundColor,
        duration: Duration(seconds: 3),
      ),
    );
  }

  static void showError(BuildContext context, String errorMessage) {
    show(context, errorMessage, backgroundColor: Colors.red);
  }
}
