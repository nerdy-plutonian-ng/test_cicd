import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:password_manager/ui/screens/auth/auth.dart';
import 'package:password_manager/ui/screens/home/home.dart';

import '../../data/auth_repo/memory_auth.dart';

final routerConfig = GoRouter(
  errorBuilder: (_, __) => const Placeholder(),
  redirect: (_, routerState) {
    if (!MemoryAuth.instance.isAuthenticated) {
      return '/auth';
    }
    return routerState.location;
  },
  routes: [
    GoRoute(path: '/', builder: (_, __) => const HomeScreen()),
    GoRoute(path: '/auth', builder: (_, __) => const Auth()),
  ],
);
