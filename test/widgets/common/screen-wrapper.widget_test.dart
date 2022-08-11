import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';
import 'package:melodistic/widgets/common/type/screen.type.dart';

import '../../utils.dart';

void main() {
  testWidgets('Screen wrapper render correctly when screen type is noTitle',
      (WidgetTester tester) async {
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
  testWidgets('Screen wrapper render correctly when screen type is withTitle',
      (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(
        child: const ScreenWrapper(
      child: SizedBox(),
      screen: ScreenType.withTitle,
    )));
    expect(find.byType(AppBar), findsOneWidget);
    expect(
        getWidget(tester,
            getTypeDescentantByKey(const Key('melodistic-appbar'), Text)),
        isA<Text>().having((Text padding) => padding.data == 'Melodistic',
            'Title text should be Melodistic', true));
  });
  testWidgets('Screen wrapper render correctly when screen type is withBack',
      (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(
        child: const ScreenWrapper(
      child: SizedBox(),
      screen: ScreenType.withBack,
    )));
    expect(find.byType(AppBar), findsOneWidget);
    expect(getTypeDescentantByKey(const Key('melodistic-appbar'), BackButton),
        findsOneWidget);
  });
}
