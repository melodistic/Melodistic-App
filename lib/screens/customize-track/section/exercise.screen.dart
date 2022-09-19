import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/controller/track-customize.controller.dart';
import 'package:melodistic/routes.dart';
import 'package:melodistic/widgets/common/button.widget.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';
import 'package:melodistic/widgets/common/scrollable-select.widget.dart';
import 'package:melodistic/widgets/common/textfield.widget.dart';
import 'package:melodistic/widgets/common/type/button.type.dart';
import 'package:melodistic/widgets/common/type/field.type.dart';
import 'package:melodistic/widgets/common/type/option-item.type.dart';
import 'package:melodistic/widgets/common/type/screen.type.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class CustomizeExerciseScreen extends StatefulWidget {
  const CustomizeExerciseScreen({Key? key}) : super(key: key);

  @override
  State<CustomizeExerciseScreen> createState() =>
      _CustomizeExerciseScreenState();
}

class _CustomizeExerciseScreenState extends State<CustomizeExerciseScreen> {
  final TrackCustomizeController exerciseTypeController = Get.find();
  final TrackCustomizeController moodController = Get.find();
  dynamic currentTime = 0;
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
                Text('Type', style: kBody3.copyWith(color: kGrayScaleColor500)),
                kSizedBoxVerticalXXS,
                Obx(() => ScrollableSelectWidget(
                      options: exerciseTypeController.exerciseTypeList,
                      value: exerciseTypeController.selectedExerciseType.value,
                      onChange:
                          (OptionItem value, ScrollController controller) {
                        exerciseTypeController.selectExerciseType(
                            value, controller);
                      },
                    )),
                kSizedBoxVerticalM,
                Text('Mood', style: kBody3.copyWith(color: kGrayScaleColor500)),
                kSizedBoxVerticalXXS,
                Obx(() => ScrollableSelectWidget(
                      options: moodController.moodList,
                      value: moodController.selectedMood.value,
                      onChange:
                          (OptionItem value, ScrollController controller) {
                        moodController.selectMood(value, controller);
                      },
                    )),
                kSizedBoxVerticalM,
                Row(
                  children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: Text(
                          'Add your favorite songs into the exercise track (optional)',
                          style:
                              kBody3Medium.copyWith(color: kGrayScaleColor500),
                        )),
                    Expanded(
                        child: ButtonWidget(
                      button: ButtonType.outlineButton,
                      size: ButtonSize.small,
                      prefixIcon: MelodisticIcon.pull_up,
                      // text: 'Upload',
                      customContent: Row(children: <Widget>[
                        const Icon(MelodisticIcon.pull_up,
                            color: kPrimaryColor),
                        kSizedBoxHorizontalXS,
                        Text('Upload',
                            style: kBody3Medium.copyWith(color: kPrimaryColor))
                      ]),
                    ))
                  ],
                ),
                kSizedBoxVerticalM,
                Text('Time(min)',
                    style: kBody3Medium.copyWith(color: kGrayScaleColor500)),
                kSizedBoxVerticalXXS,
                SfSlider(
                  thumbIcon: Container(
                    width: 3,
                    height: 3,
                    margin: const EdgeInsets.all(100.0),
                    decoration: const BoxDecoration(
                        color: kPrimaryColor, shape: BoxShape.circle),
                  ),
                  activeColor: kPrimaryColor,
                  inactiveColor: kGrayScaleColor200,
                  min: 0.0,
                  max: 60.0,
                  interval: 15,
                  showTicks: true,
                  showLabels: true,
                  value: currentTime,
                  onChanged: (dynamic newValue) {
                    setState(() {
                      currentTime = newValue;
                    });
                  },
                ),
                kSizedBoxVerticalXL,
                ButtonWidget(
                  button: ButtonType.mainButton,
                  text: 'Add',
                  handleClick: () {
                    Get.toNamed<dynamic>(RoutesName.customizeSection);
                  },
                )
              ],
            )));
  }
}
