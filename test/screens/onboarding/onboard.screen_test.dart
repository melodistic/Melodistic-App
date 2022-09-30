import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:melodistic/screens/onboarding/onboard.screen.dart';
import 'package:melodistic/singleton/controller.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';

import '../../utils.dart';

void main() {
  testWidgets('Onboarding Screen is rendered correctly',
      (WidgetTester tester) async {
    Controller.setup();
    await tester
        .pumpWidget(createWidgetForTesting(child: const OnboardingScreen()));
    expect(find.byType(ScreenWrapper), findsOneWidget);
    expect(getWidgetByKey(tester, const Key('onboarding-container')),
        isA<Container>());
    expect(
        getWidgetByKey(tester, const Key('onboarding-column')), isA<Column>());
    expect(getTypeDescentantByKey(const Key('onboarding-container'), Text),
        findsNWidgets(5));
    expect(getTypeDescentantByKey(const Key('onboarding-container'), Container),
        findsNWidgets(2));
    expect(
        getTypeDescentantByKey(const Key('onboarding-container'), TextButton),
        findsOneWidget);
    expect(getTypeDescentantByKey(const Key('onboarding-container'), Row),
        findsNWidgets(2));
  });
}
