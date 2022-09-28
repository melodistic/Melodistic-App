import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:melodistic/singleton/controller.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';

import '../../utils.dart';

void main() {
  Controller.setup();
  testWidgets('Screen wrapper render correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
        createWidgetForTesting(child: const ScreenWrapper(child: SizedBox())));
    expect(find.byType(AppBar), findsOneWidget);
    expect(
        getWidget(
            tester,
            getTypeDescentantByKey(const Key('melodistic-appbar'), Padding)
                .at(1)),
        isA<Padding>().having((Padding padding) => padding.child == null,
            'Padding child should be null', true));
  });
}
