import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/widgets/common/button.widget.dart';
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
      heigh: 48,
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
    expect(widget.style?.backgroundColor?.resolve(states),
        const Color(0xFF101010));
    expect(prefixIcon.color, const Color(0xFFFFFFFF));
    expect(suffixIcon.color, const Color(0xFFFFFFFF));
    expect(text.style?.color, const Color(0xFFFFFFFF));
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
      heigh: 48,
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
    expect(widget.style?.backgroundColor?.resolve(states),
        const Color(0xFF101010));
    expect(prefixIcon.color, const Color(0xFFFFFFFF));
    expect(suffixIcon.color, const Color(0xFFFFFFFF));
    expect(text.style?.color, const Color(0xFFFFFFFF));
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
      heigh: 48,
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
    expect(widget.style?.backgroundColor?.resolve(states),
        const Color(0xFFEEEEEE));
    expect(prefixIcon.color, const Color(0xFFA4A4A4));
    expect(suffixIcon.color, const Color(0xFFA4A4A4));
    expect(text.style?.color, const Color(0xFFA4A4A4));
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
      heigh: 48,
      width: double.infinity,
    )));
    final TextButton widget = getWidgetByType(tester, TextButton) as TextButton;
    final Set<MaterialState> states = <MaterialState>{};
    final Icon prefixIcon =
        getWidgetByKey(tester, const Key('prefix-icon-2')) as Icon;
    final Icon suffixIcon =
        getWidgetByKey(tester, const Key('suffix-icon-2')) as Icon;
    final Text text = getWidgetByType(tester, Text) as Text;

    expect(find.byType(TextButton), findsOneWidget);
    expect(widget.style?.backgroundColor?.resolve(states),
        const Color(0xFFF5F5F5));
    expect(prefixIcon.color, const Color(0xFF101010));
    expect(suffixIcon.color, const Color(0xFF101010));
    expect(text.style?.color, const Color(0xFF101010));
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
      heigh: 48,
      width: double.infinity,
    )));
    final TextButton widget = getWidgetByType(tester, TextButton) as TextButton;
    final Set<MaterialState> states = <MaterialState>{};
    final Icon prefixIcon =
        getWidgetByKey(tester, const Key('prefix-icon-2')) as Icon;
    final Icon suffixIcon =
        getWidgetByKey(tester, const Key('suffix-icon-2')) as Icon;
    final Text text = getWidgetByType(tester, Text) as Text;

    expect(find.byType(TextButton), findsOneWidget);
    expect(widget.style?.backgroundColor?.resolve(states),
        const Color(0xFFEEEEEE));
    expect(prefixIcon.color, const Color(0xFF101010));
    expect(suffixIcon.color, const Color(0xFF101010));
    expect(text.style?.color, const Color(0xFF101010));
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
      heigh: 48,
      width: double.infinity,
    )));
    final TextButton widget = getWidgetByType(tester, TextButton) as TextButton;
    final Set<MaterialState> states = <MaterialState>{};
    final Icon prefixIcon =
        getWidgetByKey(tester, const Key('prefix-icon-2')) as Icon;
    final Icon suffixIcon =
        getWidgetByKey(tester, const Key('suffix-icon-2')) as Icon;
    final Text text = getWidgetByType(tester, Text) as Text;

    expect(find.byType(TextButton), findsOneWidget);
    expect(widget.style?.backgroundColor?.resolve(states),
        const Color(0xFFEEEEEE));
    expect(prefixIcon.color, const Color(0xFFA4A4A4));
    expect(suffixIcon.color, const Color(0xFFA4A4A4));
    expect(text.style?.color, const Color(0xFFA4A4A4));
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
      heigh: 48,
      width: double.infinity,
    )));
    final OutlinedButton widget =
        getWidgetByType(tester, OutlinedButton) as OutlinedButton;
    final Set<MaterialState> states = <MaterialState>{};
    final Icon prefixIcon =
        getWidgetByKey(tester, const Key('prefix-icon-3')) as Icon;
    final Icon suffixIcon =
        getWidgetByKey(tester, const Key('suffix-icon-3')) as Icon;
    final Text text = getWidgetByType(tester, Text) as Text;

    expect(find.byType(OutlinedButton), findsOneWidget);
    expect((widget.style?.side?.resolve(states) as BorderSide).color,
        const Color(0xFF000000));
    expect(prefixIcon.color, const Color(0xFF000000));
    expect(suffixIcon.color, const Color(0xFF000000));
    expect(text.style?.color, const Color(0xFF000000));
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
      heigh: 48,
      width: double.infinity,
    )));
    final OutlinedButton widget =
        getWidgetByType(tester, OutlinedButton) as OutlinedButton;
    final Set<MaterialState> states = <MaterialState>{};
    final Icon prefixIcon =
        getWidgetByKey(tester, const Key('prefix-icon-3')) as Icon;
    final Icon suffixIcon =
        getWidgetByKey(tester, const Key('suffix-icon-3')) as Icon;
    final Text text = getWidgetByType(tester, Text) as Text;

    expect(find.byType(OutlinedButton), findsOneWidget);
    expect((widget.style?.side?.resolve(states) as BorderSide).color,
        const Color(0xFFFA8B44));
    expect(prefixIcon.color, const Color(0xFFFA8B44));
    expect(suffixIcon.color, const Color(0xFFFA8B44));
    expect(text.style?.color, const Color(0xFFFA8B44));
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
      heigh: 48,
      width: double.infinity,
    )));
    final OutlinedButton widget =
        getWidgetByType(tester, OutlinedButton) as OutlinedButton;
    final Set<MaterialState> states = <MaterialState>{};
    final Icon prefixIcon =
        getWidgetByKey(tester, const Key('prefix-icon-3')) as Icon;
    final Icon suffixIcon =
        getWidgetByKey(tester, const Key('suffix-icon-3')) as Icon;
    final Text text = getWidgetByType(tester, Text) as Text;

    expect(find.byType(OutlinedButton), findsOneWidget);
    expect((widget.style?.side?.resolve(states) as BorderSide).color,
        const Color(0xffeeeeee));
    expect(prefixIcon.color, const Color(0xFFA4A4A4));
    expect(suffixIcon.color, const Color(0xFFA4A4A4));
    expect(text.style?.color, const Color(0xFFA4A4A4));
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
      heigh: 48,
      width: double.infinity,
    )));
    final Icon prefixIcon =
        getWidgetByKey(tester, const Key('prefix-icon-4')) as Icon;
    final Icon suffixIcon =
        getWidgetByKey(tester, const Key('suffix-icon-4')) as Icon;
    final Text text = getWidgetByType(tester, Text) as Text;

    expect(find.byType(TextButton), findsOneWidget);
    expect(prefixIcon.color, const Color(0xFF101010));
    expect(suffixIcon.color, const Color(0xFF101010));
    expect(text.style?.color, const Color(0xFF101010));
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
      heigh: 48,
      width: double.infinity,
    )));
    final Icon prefixIcon =
        getWidgetByKey(tester, const Key('prefix-icon-4')) as Icon;
    final Icon suffixIcon =
        getWidgetByKey(tester, const Key('suffix-icon-4')) as Icon;
    final Text text = getWidgetByType(tester, Text) as Text;

    expect(find.byType(TextButton), findsOneWidget);
    expect(prefixIcon.color, const Color(0xFF101010));
    expect(suffixIcon.color, const Color(0xFF101010));
    expect(text.style?.color, const Color(0xFF101010));
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
      heigh: 48,
      width: double.infinity,
    )));
    final Icon prefixIcon =
        getWidgetByKey(tester, const Key('prefix-icon-4')) as Icon;
    final Icon suffixIcon =
        getWidgetByKey(tester, const Key('suffix-icon-4')) as Icon;
    final Text text = getWidgetByType(tester, Text) as Text;

    expect(find.byType(TextButton), findsOneWidget);
    expect(prefixIcon.color, const Color(0xFFA4A4A4));
    expect(suffixIcon.color, const Color(0xFFA4A4A4));
    expect(text.style?.color, const Color(0xFFA4A4A4));
  });

  testWidgets('Button render correctly when use normal floating button',
      (WidgetTester tester) async {
    await tester.pumpWidget(createScaffoldForTesting(
        child: ButtonWidget(
      button: ButtonType.floatingButton,
      state: ButtonState.normal,
      prefixIcon: MelodisticIcon.plus,
      handleClick: () {},
    )));
    final FloatingActionButton widget =
        getWidgetByType(tester, FloatingActionButton) as FloatingActionButton;
    final Icon prefixIcon = getWidgetByType(tester, Icon) as Icon;

    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(widget.backgroundColor, const Color(0xFF000000));
    expect(prefixIcon.color, const Color(0xFFFFFFFF));
  });

  testWidgets('Button render correctly when use active floating button',
      (WidgetTester tester) async {
    await tester.pumpWidget(createScaffoldForTesting(
        child: ButtonWidget(
      button: ButtonType.floatingButton,
      state: ButtonState.active,
      prefixIcon: MelodisticIcon.plus,
      handleClick: () {},
    )));
    final FloatingActionButton widget =
        getWidgetByType(tester, FloatingActionButton) as FloatingActionButton;
    final Icon prefixIcon = getWidgetByType(tester, Icon) as Icon;

    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(widget.backgroundColor, const Color(0xFFFA8B44));
    expect(prefixIcon.color, const Color(0xFFFFFFFF));
  });

  testWidgets('Button render correctly when use disable floating button',
      (WidgetTester tester) async {
    await tester.pumpWidget(createScaffoldForTesting(
        child: ButtonWidget(
      button: ButtonType.floatingButton,
      state: ButtonState.disable,
      prefixIcon: MelodisticIcon.plus,
      handleClick: () {},
    )));
    final FloatingActionButton widget =
        getWidgetByType(tester, FloatingActionButton) as FloatingActionButton;
    final Icon prefixIcon = getWidgetByType(tester, Icon) as Icon;

    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(widget.backgroundColor, const Color(0xFFF5F5F5));
    expect(prefixIcon.color, const Color(0xFFA4A4A4));
  });
}
