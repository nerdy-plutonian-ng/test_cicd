import 'package:flutter/material.dart';
import 'package:password_manager/ui/screens/auth/auth_state.dart';
import 'package:password_manager/ui/screens/auth/auth_success.dart';
import 'package:provider/provider.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<AuthState>(
          builder: (context, authState, child) {
            if (authState.isAuthenticated) {
              return const AuthSuccess();
            } else {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Login',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Text(
                      (authState.email == null || authState.password == null) ||
                              (authState.email!.isEmpty &&
                                  authState.password!.isEmpty)
                          ? 'Please enter your email and password'
                          : (authState.email!.isEmpty)
                              ? 'Please enter your email'
                              : (authState.password!.isEmpty)
                                  ? 'Please enter your password'
                                  : 'Wrong email or password',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                      ),
                      onChanged: (email) {
                        authState.setEmail(email);
                      },
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                      onChanged: (password) {
                        authState.setPassword(password);
                      },
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
