// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:password_manager/data/auth_repo/memory_auth.dart';
import 'package:password_manager/main.dart';
import 'package:password_manager/ui/screens/auth/auth_state.dart';
import 'package:password_manager/ui/screens/home/home_state.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MultiProvider(providers: [
      ChangeNotifierProvider(
          create: (_) => AuthState(authRepo: MemoryAuth.instance)),
      ChangeNotifierProvider(create: (_) => HomeState()),
    ], child: const MyApp()));

    // Verify that our counter starts at 0.
    final textFields = find.byType(TextField);
    final usernameT = textFields.first;
    final passwordT = textFields.last;
    await tester.enterText(usernameT, 'jonsnow@thewatch.com');
    await tester.enterText(passwordT, 'ygritte');
    await tester.pump();
    expect(find.text('HOME'), findsOneWidget);

    await tester.tap(find.text('HOME'));
    await tester.pumpAndSettle();
    expect(find.text('Your Passwords'), findsOneWidget);
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    final newTextFields = find.byType(TextField);
    await tester.enterText(newTextFields.first, 'Bitch.com');
    await tester.enterText(newTextFields.at(1), 'Bitch');
    await tester.enterText(newTextFields.first, 'Bitch.com');
    await tester.tap(find.text('Add'));
    await tester.pumpAndSettle();
    expect(find.text('Bitch.com'), findsOneWidget);
  });
}
