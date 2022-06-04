import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var welcomeBack = find.text("Welcome Back");
  testWidgets("Demo UI Test", (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Container(
          child: Text("Welcome Back"),
        ),
      ),
    );

    await tester.pump();

    expect(welcomeBack, findsOneWidget);
  });
}
