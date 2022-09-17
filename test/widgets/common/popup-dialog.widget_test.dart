import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:melodistic/widgets/common/popup/popup_dialog.widget.dart';

import '../../utils.dart';

void main() {
  testWidgets('popup dialog render correctly when be clicked',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        createScaffoldForTesting(child: PopupWidget(content: Column())));
    expect(find.byType(SimpleDialog), findsOneWidget);
  });
}
