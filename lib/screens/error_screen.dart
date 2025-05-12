import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String message;
  final String? resolutionMessage;

  const ErrorScreen({
    super.key,
    required this.message,
    this.resolutionMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              message,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            if (resolutionMessage != null) ...[
              const SizedBox(height: 16),
              Text(
                resolutionMessage!,
                style: const TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ]
          ],
        ),
      ),
    );
  }
}
