import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:melodistic/app.dart';

void main() {
  testWidgets('Render correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MelodisticApp());
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
