// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:excellent_games_2024/main.dart';

void main() {
  testWidgets('Check if the app displays the correct title',
      (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(const ExcellentGamesApp());

    // Check if "2024 Excellent Games" appears on the screen
    expect(find.text('2024 Excellent Games'), findsOneWidget);

    // Check that "Hey you, you're finally awake? It's 2024 now!" is displayed
    expect(find.text("Hey you, you're finally awake? It's 2024 now!"),
        findsOneWidget);
  });
}
