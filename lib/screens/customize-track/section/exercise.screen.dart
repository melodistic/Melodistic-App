import 'package:flutter/material.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';
import 'package:melodistic/widgets/common/textfield.widget.dart';
import 'package:melodistic/widgets/common/type/field.type.dart';
import 'package:melodistic/widgets/common/type/screen.type.dart';

class CustomizeExerciseScreen extends StatelessWidget {
  const CustomizeExerciseScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController _sectionname = TextEditingController();
    return ScreenWrapper(
        screen: MelodisticScreenType.withBack,
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: kSizeS * 1.25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Add Exercise section',
                  style: kHeading1,
                ),
                kSizedBoxVerticalS,
                TextFieldWidget(
                  controller: _sectionname,
                  hintTitle: 'Section Name',
                  fieldType: FieldType.text,
                ),
                kSizedBoxVerticalM,
              ],
            )));
  }
}
