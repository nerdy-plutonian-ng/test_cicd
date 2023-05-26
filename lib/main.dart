import 'package:flutter/material.dart';
import 'package:password_manager/data/auth_repo/memory_auth.dart';
import 'package:password_manager/ui/screens/auth/auth_state.dart';
import 'package:password_manager/ui/screens/home/home_state.dart';
import 'package:password_manager/ui/utilities/router_config.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (_) => AuthState(authRepo: MemoryAuth.instance)),
    ChangeNotifierProvider(create: (_) => HomeState()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Password Manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF901403),
        ),
        useMaterial3: true,
      ),
      routerConfig: routerConfig,
    );
  }
}
