import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('This route does not exist.'),
          const SizedBox(height: 16),
          FilledButton(
              onPressed: () {
                context.go('/');
              },
              child: const Text('Go to home')),
        ],
      )),
    );
  }
}
