import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:therapyscale_offline/main.dart';

void main() {
  testWidgets('App should start without errors', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const TherapyScaleApp());

    // Verify that welcome screen loads
    expect(find.text('ScaleGift Massages'), findsOneWidget);
  });

  testWidgets('Welcome screen navigation', (WidgetTester tester) async {
    await tester.pumpWidget(const TherapyScaleApp());

    // Find continue button and tap it
    final continueButton = find.byType(ElevatedButton);
    expect(continueButton, findsOneWidget);

    await tester.tap(continueButton);
    await tester.pumpAndSettle();

    // Should navigate to authentication screen
    expect(find.byType(TextField), findsOneWidget); // PIN input
  });
}