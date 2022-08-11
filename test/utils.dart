import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget createWidgetForTesting({required Widget child}) {
  return MaterialApp(
    home: child,
  );
}

Widget getWidget(WidgetTester tester, Finder finder) {
  return tester.widget(finder);
}

Widget getWidgetByKey(WidgetTester tester, Key key) {
  return getWidget(tester, find.byKey(key));
}

Widget getWidgetByType(WidgetTester tester, Type type) {
  return getWidget(tester, find.byType(type));
}

Finder getTypeDescentantByKey(Key key, Type type) {
  return find.descendant(of: find.byKey(key), matching: find.byType(type));
}
