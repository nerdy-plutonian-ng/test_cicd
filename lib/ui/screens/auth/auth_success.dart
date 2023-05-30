import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'auth_state.dart';

class AuthSuccess extends StatelessWidget {
  const AuthSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // const Icon(Icons.check_circle, color: Colors.green, size: 128)
        //     .animate(
        //       onPlay: (controller) => controller.repeat(reverse: false),
        //     )
        //     .shimmer(duration: const Duration(milliseconds: 1000)),
        TextButton(
            onPressed: () {
              context.read<AuthState>().setAuthenticated(true);
              context.go('/');
            },
            child: const Text('HOME'))
      ],
    ));
  }
}
