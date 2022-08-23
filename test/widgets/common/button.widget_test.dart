import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/widgets/common/button.widget.dart';
import 'package:melodistic/widgets/common/floating-button.widget.dart';
import 'package:melodistic/widgets/common/type/screen.type.dart';

import '../../utils.dart';

void main() {
  testWidgets('Button render correctly when use normal main button',
      (WidgetTester tester) async {
    await tester.pumpWidget(createScaffoldForTesting(
        child: ButtonWidget(
      button: ButtonType.mainButton,
      text: 'Login',
      state: ButtonState.normal,
      prefixIcon: MelodisticIcon.plus,
      suffixIcon: MelodisticIcon.plus,
      handleClick: () {},
      height: 48,
      width: double.infinity,
    )));
    final TextButton widget = getWidgetByType(tester, TextButton) as TextButton;
    final Set<MaterialState> states = <MaterialState>{};
    final Icon prefixIcon =
        getWidgetByKey(tester, const Key('prefix-icon')) as Icon;
    final Icon suffixIcon =
        getWidgetByKey(tester, const Key('suffix-icon')) as Icon;
    final Text text = getWidgetByType(tester, Text) as Text;

    expect(find.byType(TextButton), findsOneWidget);
    expect(widget.style?.backgroundColor?.resolve(states), kPrimaryColor);
    expect(prefixIcon.color, kGrayScaleColor50);
    expect(suffixIcon.color, kGrayScaleColor50);
    expect(text.style?.color, kGrayScaleColor50);
  });

  testWidgets('Button render correctly when use active main button',
      (WidgetTester tester) async {
    await tester.pumpWidget(createScaffoldForTesting(
        child: ButtonWidget(
      button: ButtonType.mainButton,
      text: 'Login',
      state: ButtonState.active,
      prefixIcon: MelodisticIcon.plus,
      suffixIcon: MelodisticIcon.plus,
      handleClick: () {},
      height: 48,
      width: double.infinity,
    )));
    final TextButton widget = getWidgetByType(tester, TextButton) as TextButton;
    final Set<MaterialState> states = <MaterialState>{};
    final Icon prefixIcon =
        getWidgetByKey(tester, const Key('prefix-icon')) as Icon;
    final Icon suffixIcon =
        getWidgetByKey(tester, const Key('suffix-icon')) as Icon;
    final Text text = getWidgetByType(tester, Text) as Text;

    expect(find.byType(TextButton), findsOneWidget);
    expect(widget.style?.backgroundColor?.resolve(states), kPrimaryColor);
    expect(prefixIcon.color, kGrayScaleColor50);
    expect(suffixIcon.color, kGrayScaleColor50);
    expect(text.style?.color, kGrayScaleColor50);
  });

  testWidgets('Button render correctly when use disable main button',
      (WidgetTester tester) async {
    await tester.pumpWidget(createScaffoldForTesting(
        child: ButtonWidget(
      button: ButtonType.mainButton,
      text: 'Login',
      state: ButtonState.disable,
      prefixIcon: MelodisticIcon.plus,
      suffixIcon: MelodisticIcon.plus,
      handleClick: () {},
      height: 48,
      width: double.infinity,
    )));
    final TextButton widget = getWidgetByType(tester, TextButton) as TextButton;
    final Set<MaterialState> states = <MaterialState>{};
    final Icon prefixIcon =
        getWidgetByKey(tester, const Key('prefix-icon')) as Icon;
    final Icon suffixIcon =
        getWidgetByKey(tester, const Key('suffix-icon')) as Icon;
    final Text text = getWidgetByType(tester, Text) as Text;

    expect(find.byType(TextButton), findsOneWidget);
    expect(widget.style?.backgroundColor?.resolve(states), kGrayScaleColor200);
    expect(prefixIcon.color, kGrayScaleColor500);
    expect(suffixIcon.color, kGrayScaleColor500);
    expect(text.style?.color, kGrayScaleColor500);
  });

  testWidgets('Button render correctly when use normal soft button',
      (WidgetTester tester) async {
    await tester.pumpWidget(createScaffoldForTesting(
        child: ButtonWidget(
      button: ButtonType.softButton,
      text: 'Login',
      state: ButtonState.normal,
      prefixIcon: MelodisticIcon.plus,
      suffixIcon: MelodisticIcon.plus,
      handleClick: () {},
      height: 48,
      width: double.infinity,
    )));
    final TextButton widget = getWidgetByType(tester, TextButton) as TextButton;
    final Set<MaterialState> states = <MaterialState>{};
    final Icon prefixIcon =
        getWidgetByKey(tester, const Key('prefix-icon')) as Icon;
    final Icon suffixIcon =
        getWidgetByKey(tester, const Key('suffix-icon')) as Icon;
    final Text text = getWidgetByType(tester, Text) as Text;

    expect(find.byType(TextButton), findsOneWidget);
    expect(widget.style?.backgroundColor?.resolve(states), kGrayScaleColor100);
    expect(prefixIcon.color, kPrimaryColor);
    expect(suffixIcon.color, kPrimaryColor);
    expect(text.style?.color, kPrimaryColor);
  });

  testWidgets('Button render correctly when use active soft button',
      (WidgetTester tester) async {
    await tester.pumpWidget(createScaffoldForTesting(
        child: ButtonWidget(
      button: ButtonType.softButton,
      text: 'Login',
      state: ButtonState.active,
      prefixIcon: MelodisticIcon.plus,
      suffixIcon: MelodisticIcon.plus,
      handleClick: () {},
      height: 48,
      width: double.infinity,
    )));
    final TextButton widget = getWidgetByType(tester, TextButton) as TextButton;
    final Set<MaterialState> states = <MaterialState>{};
    final Icon prefixIcon =
        getWidgetByKey(tester, const Key('prefix-icon')) as Icon;
    final Icon suffixIcon =
        getWidgetByKey(tester, const Key('suffix-icon')) as Icon;
    final Text text = getWidgetByType(tester, Text) as Text;

    expect(find.byType(TextButton), findsOneWidget);
    expect(widget.style?.backgroundColor?.resolve(states), kGrayScaleColor200);
    expect(prefixIcon.color, kPrimaryColor);
    expect(suffixIcon.color, kPrimaryColor);
    expect(text.style?.color, kPrimaryColor);
  });

  testWidgets('Button render correctly when use disable soft button',
      (WidgetTester tester) async {
    await tester.pumpWidget(createScaffoldForTesting(
        child: ButtonWidget(
      button: ButtonType.softButton,
      text: 'Login',
      state: ButtonState.disable,
      prefixIcon: MelodisticIcon.plus,
      suffixIcon: MelodisticIcon.plus,
      handleClick: () {},
      height: 48,
      width: double.infinity,
    )));
    final TextButton widget = getWidgetByType(tester, TextButton) as TextButton;
    final Set<MaterialState> states = <MaterialState>{};
    final Icon prefixIcon =
        getWidgetByKey(tester, const Key('prefix-icon')) as Icon;
    final Icon suffixIcon =
        getWidgetByKey(tester, const Key('suffix-icon')) as Icon;
    final Text text = getWidgetByType(tester, Text) as Text;

    expect(find.byType(TextButton), findsOneWidget);
    expect(widget.style?.backgroundColor?.resolve(states), kGrayScaleColor200);
    expect(prefixIcon.color, kGrayScaleColor500);
    expect(suffixIcon.color, kGrayScaleColor500);
    expect(text.style?.color, kGrayScaleColor500);
  });

  testWidgets('Button render correctly when use normal outline button',
      (WidgetTester tester) async {
    await tester.pumpWidget(createScaffoldForTesting(
        child: ButtonWidget(
      button: ButtonType.outlineButton,
      text: 'Login',
      state: ButtonState.normal,
      prefixIcon: MelodisticIcon.plus,
      suffixIcon: MelodisticIcon.plus,
      handleClick: () {},
      height: 48,
      width: double.infinity,
    )));
    final OutlinedButton widget =
        getWidgetByType(tester, OutlinedButton) as OutlinedButton;
    final Set<MaterialState> states = <MaterialState>{};
    final Icon prefixIcon =
        getWidgetByKey(tester, const Key('prefix-icon')) as Icon;
    final Icon suffixIcon =
        getWidgetByKey(tester, const Key('suffix-icon')) as Icon;
    final Text text = getWidgetByType(tester, Text) as Text;

    expect(find.byType(OutlinedButton), findsOneWidget);
    expect((widget.style?.side?.resolve(states) as BorderSide).color,
        kGrayScaleColor900);
    expect(prefixIcon.color, kGrayScaleColor900);
    expect(suffixIcon.color, kGrayScaleColor900);
    expect(text.style?.color, kGrayScaleColor900);
  });

  testWidgets('Button render correctly when use active outline button',
      (WidgetTester tester) async {
    await tester.pumpWidget(createScaffoldForTesting(
        child: ButtonWidget(
      button: ButtonType.outlineButton,
      text: 'Login',
      state: ButtonState.active,
      prefixIcon: MelodisticIcon.plus,
      suffixIcon: MelodisticIcon.plus,
      handleClick: () {},
      height: 48,
      width: double.infinity,
    )));
    final OutlinedButton widget =
        getWidgetByType(tester, OutlinedButton) as OutlinedButton;
    final Set<MaterialState> states = <MaterialState>{};
    final Icon prefixIcon =
        getWidgetByKey(tester, const Key('prefix-icon')) as Icon;
    final Icon suffixIcon =
        getWidgetByKey(tester, const Key('suffix-icon')) as Icon;
    final Text text = getWidgetByType(tester, Text) as Text;

    expect(find.byType(OutlinedButton), findsOneWidget);
    expect((widget.style?.side?.resolve(states) as BorderSide).color,
        kSecondaryColor);
    expect(prefixIcon.color, kSecondaryColor);
    expect(suffixIcon.color, kSecondaryColor);
    expect(text.style?.color, kSecondaryColor);
  });

  testWidgets('Button render correctly when use disable outline button',
      (WidgetTester tester) async {
    await tester.pumpWidget(createScaffoldForTesting(
        child: ButtonWidget(
      button: ButtonType.outlineButton,
      text: 'Login',
      state: ButtonState.disable,
      prefixIcon: MelodisticIcon.plus,
      suffixIcon: MelodisticIcon.plus,
      handleClick: () {},
      height: 48,
      width: double.infinity,
    )));
    final OutlinedButton widget =
        getWidgetByType(tester, OutlinedButton) as OutlinedButton;
    final Set<MaterialState> states = <MaterialState>{};
    final Icon prefixIcon =
        getWidgetByKey(tester, const Key('prefix-icon')) as Icon;
    final Icon suffixIcon =
        getWidgetByKey(tester, const Key('suffix-icon')) as Icon;
    final Text text = getWidgetByType(tester, Text) as Text;

    expect(find.byType(OutlinedButton), findsOneWidget);
    expect((widget.style?.side?.resolve(states) as BorderSide).color,
        kGrayScaleColor200);
    expect(prefixIcon.color, kGrayScaleColor500);
    expect(suffixIcon.color, kGrayScaleColor500);
    expect(text.style?.color, kGrayScaleColor500);
  });

  testWidgets('Button render correctly when use normal text button',
      (WidgetTester tester) async {
    await tester.pumpWidget(createScaffoldForTesting(
        child: ButtonWidget(
      button: ButtonType.textButton,
      text: 'Login',
      state: ButtonState.normal,
      prefixIcon: MelodisticIcon.plus,
      suffixIcon: MelodisticIcon.plus,
      handleClick: () {},
      height: 48,
      width: double.infinity,
    )));
    final Icon prefixIcon =
        getWidgetByKey(tester, const Key('prefix-icon')) as Icon;
    final Icon suffixIcon =
        getWidgetByKey(tester, const Key('suffix-icon')) as Icon;
    final Text text = getWidgetByType(tester, Text) as Text;

    expect(find.byType(TextButton), findsOneWidget);
    expect(prefixIcon.color, kPrimaryColor);
    expect(suffixIcon.color, kPrimaryColor);
    expect(text.style?.color, kPrimaryColor);
  });
  testWidgets('Button render correctly when use active text button',
      (WidgetTester tester) async {
    await tester.pumpWidget(createScaffoldForTesting(
        child: ButtonWidget(
      button: ButtonType.textButton,
      text: 'Login',
      state: ButtonState.active,
      prefixIcon: MelodisticIcon.plus,
      suffixIcon: MelodisticIcon.plus,
      handleClick: () {},
      height: 48,
      width: double.infinity,
    )));
    final Icon prefixIcon =
        getWidgetByKey(tester, const Key('prefix-icon')) as Icon;
    final Icon suffixIcon =
        getWidgetByKey(tester, const Key('suffix-icon')) as Icon;
    final Text text = getWidgetByType(tester, Text) as Text;

    expect(find.byType(TextButton), findsOneWidget);
    expect(prefixIcon.color, kPrimaryColor);
    expect(suffixIcon.color, kPrimaryColor);
    expect(text.style?.color, kPrimaryColor);
  });

  testWidgets('Button render correctly when use disable text button',
      (WidgetTester tester) async {
    await tester.pumpWidget(createScaffoldForTesting(
        child: ButtonWidget(
      button: ButtonType.textButton,
      text: 'Login',
      state: ButtonState.disable,
      prefixIcon: MelodisticIcon.plus,
      suffixIcon: MelodisticIcon.plus,
      handleClick: () {},
      height: 48,
      width: double.infinity,
    )));
    final Icon prefixIcon =
        getWidgetByKey(tester, const Key('prefix-icon')) as Icon;
    final Icon suffixIcon =
        getWidgetByKey(tester, const Key('suffix-icon')) as Icon;
    final Text text = getWidgetByType(tester, Text) as Text;

    expect(find.byType(TextButton), findsOneWidget);
    expect(prefixIcon.color, kGrayScaleColor50);
    expect(suffixIcon.color, kGrayScaleColor50);
    expect(text.style?.color, kGrayScaleColor50);
  });

  testWidgets('Button render correctly when use normal floating button',
      (WidgetTester tester) async {
    await tester.pumpWidget(createScaffoldForTesting(
        child: FloatingButtonWidget(
      state: ButtonState.normal,
      icon: MelodisticIcon.plus,
      handleClick: () {},
    )));
    final FloatingActionButton widget =
        getWidgetByType(tester, FloatingActionButton) as FloatingActionButton;
    final Icon prefixIcon = getWidgetByType(tester, Icon) as Icon;

    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(widget.backgroundColor, kGrayScaleColor900);
    expect(prefixIcon.color, kGrayScaleColor50);
  });

  testWidgets('Button render correctly when use active floating button',
      (WidgetTester tester) async {
    await tester.pumpWidget(createScaffoldForTesting(
        child: FloatingButtonWidget(
      state: ButtonState.active,
      icon: MelodisticIcon.plus,
      handleClick: () {},
    )));
    final FloatingActionButton widget =
        getWidgetByType(tester, FloatingActionButton) as FloatingActionButton;
    final Icon prefixIcon = getWidgetByType(tester, Icon) as Icon;

    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(widget.backgroundColor, kSecondaryColor);
    expect(prefixIcon.color, kGrayScaleColor50);
  });

  testWidgets('Button render correctly when use disable floating button',
      (WidgetTester tester) async {
    await tester.pumpWidget(createScaffoldForTesting(
        child: FloatingButtonWidget(
      state: ButtonState.disable,
      icon: MelodisticIcon.plus,
      handleClick: () {},
    )));
    final FloatingActionButton widget =
        getWidgetByType(tester, FloatingActionButton) as FloatingActionButton;
    final Icon prefixIcon = getWidgetByType(tester, Icon) as Icon;

    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(widget.backgroundColor, kGrayScaleColor100);
    expect(prefixIcon.color, kGrayScaleColor500);
  });
}
