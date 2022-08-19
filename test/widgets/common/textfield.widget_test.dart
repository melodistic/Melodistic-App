// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/widgets/common/textfield.widget.dart';
import 'package:melodistic/widgets/common/type/field.type.dart';

import '../../utils.dart';

void main() {
  testWidgets(
      'TextField render correctly when use textfield to be filled by text',
      (WidgetTester tester) async {
    await tester.pumpWidget(createScaffoldForTesting(
        child: TextFieldWidget(
      controller: TextEditingController(),
      hintTitle: 'hint text',
      fieldType: FieldType.text,
    )));
    final InputDecorator widget =
        getWidgetByType(tester, InputDecorator) as InputDecorator;
    expect(find.byType(TextFormField), findsOneWidget);
    expect(widget.decoration.hintText, 'hint text');
  });

  testWidgets(
      'TextField render correctly when use textfield to be filled by invisible password',
      (WidgetTester tester) async {
    await tester.pumpWidget(createScaffoldForTesting(
        child: TextFieldWidget(
      controller: TextEditingController(),
      hintTitle: 'hint text',
      fieldType: FieldType.password,
    )));
    final Icon widget = getWidgetByType(tester, Icon) as Icon;
    expect(find.byType(Icon), findsOneWidget);
    expect(widget.icon, MelodisticIcon.eye_off);
  });

  testWidgets(
      'TextField render correctly when use textfield to be filled by visible password',
      (WidgetTester tester) async {
    await tester.pumpWidget(createScaffoldForTesting(
        child: TextFieldWidget(
      controller: TextEditingController(),
      hintTitle: 'hint text',
      fieldType: FieldType.password,
    )));

    TextFieldWidgetState state = (tester
        .state(find.byType(TextFieldWidget).at(0)) as TextFieldWidgetState);

    state.setState(() {
      state.obsecureText = false;
    });

    await tester.pump();

    final Icon widget = getWidgetByType(tester, Icon) as Icon;
    expect(find.byType(Icon), findsOneWidget);
    expect(widget.icon, MelodisticIcon.eye_empty);
  });
}
