import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/controller/track-customize.controller.dart';
import 'package:melodistic/screens/customize-track/type/CustomizeMode.enum.dart';
import 'package:melodistic/screens/customize-track/type/CustomizeStatus.enum.dart';
import 'package:melodistic/screens/customize-track/widgets/upload-song-popup.widget.dart';
import 'package:melodistic/singleton/alert.dart';
import 'package:melodistic/widgets/common/appbar/back.widget.dart';
import 'package:melodistic/widgets/common/button.widget.dart';
import 'package:melodistic/widgets/common/popup/error_popup.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';
import 'package:melodistic/widgets/common/scrollable-select.widget.dart';
import 'package:melodistic/widgets/common/textfield.widget.dart';
import 'package:melodistic/widgets/common/type/button.type.dart';
import 'package:melodistic/widgets/common/type/field.type.dart';
import 'package:melodistic/widgets/common/type/option-item.type.dart';
import 'package:melodistic/widgets/common/type/section.type.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class CustomizeSectionDetailScreen extends StatelessWidget {
  CustomizeSectionDetailScreen({Key? key}) : super(key: key);

  final TrackCustomizeController trackCustomizeController = Get.find();
  final TextEditingController _sectionname = TextEditingController();

  String getMode(CustomizeMode mode) {
    switch (mode) {
      case CustomizeMode.add:
        return 'Add';
      case CustomizeMode.edit:
        return 'Edit';
    }
  }

  String getButtonText(CustomizeMode mode) {
    switch (mode) {
      case CustomizeMode.add:
        return 'Add';
      case CustomizeMode.edit:
        return 'Save';
    }
  }

  String getSectionType(SectionType type) {
    switch (type) {
      case SectionType.exerciseSection:
        return 'Exercise';
      case SectionType.breakSection:
        return 'Break';
    }
  }

  List<Widget> getHeadingContent(SectionType type) {
    if (type == SectionType.exerciseSection) {
      return <Widget>[
        kSizedBoxVerticalS,
        TextFieldWidget(
          controller: _sectionname,
          hintTitle: 'Section Name',
          fieldType: FieldType.text,
          validate: trackCustomizeController.validateSectionName,
        ),
        kSizedBoxVerticalS,
        Text('Type', style: kBody3.copyWith(color: kGrayScaleColor500)),
        kSizedBoxVerticalXXS,
        Obx(() => ScrollableSelectWidget(
              options: trackCustomizeController.exerciseTypeList,
              value: trackCustomizeController.sectionExerciseType.value,
              onChange: (OptionItem value, ScrollController controller) {
                trackCustomizeController.selectExerciseType(value, controller);
              },
            )),
      ];
    } else {
      return <Widget>[
        kSizedBoxVerticalXS,
        Text('Select music mood for break section',
            style: kBody3.copyWith(color: kGrayScaleColor500)),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    if (trackCustomizeController.customizeMode.value == CustomizeMode.edit) {
      _sectionname.text = trackCustomizeController
          .sectionList[trackCustomizeController.editIndex.value].name;
    }
    return ScreenWrapper(
        customAppbar: const BackAppbar(
          title: 'Back',
        ),
        child: CustomScrollView(slivers: <Widget>[
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: kSizeS * 1.25),
                child: Form(
                    key: trackCustomizeController.sectionFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '${getMode(trackCustomizeController.customizeMode.value)} ${getSectionType(trackCustomizeController.sectionType.value)} section',
                              style: kHeading1,
                            ),
                            ...getHeadingContent(
                                trackCustomizeController.sectionType.value),
                            kSizedBoxVerticalS,
                            Text('Mood',
                                style:
                                    kBody3.copyWith(color: kGrayScaleColor500)),
                            kSizedBoxVerticalXXS,
                            Obx(() => ScrollableSelectWidget(
                                  options: trackCustomizeController.moodList,
                                  value: trackCustomizeController
                                      .sectionMood.value,
                                  onChange: (OptionItem value,
                                      ScrollController controller) {
                                    trackCustomizeController.selectMood(
                                        value, controller);
                                  },
                                )),
                            kSizedBoxVerticalS,
                            Row(
                              children: <Widget>[
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Add your favorite songs into the exercise track (optional)',
                                      style: kBody3Medium.copyWith(
                                          color: kGrayScaleColor500),
                                    )),
                                Expanded(
                                    child: Obx(() => ButtonWidget(
                                          handleClick: () {
                                            Alert.showAlert(UploadSongPopup(
                                                mood: trackCustomizeController
                                                    .sectionMood.value.label));
                                          },
                                          button: ButtonType.outlineButton,
                                          size: ButtonSize.small,
                                          prefixIcon: MelodisticIcon.pull_up,
                                          customContent: trackCustomizeController
                                                  .sectionIncludedSong.isEmpty
                                              ? Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                      const Icon(
                                                          MelodisticIcon
                                                              .pull_up,
                                                          color: kPrimaryColor),
                                                      kSizedBoxHorizontalXS,
                                                      Text('Select',
                                                          style: kBody3Medium
                                                              .copyWith(
                                                                  color:
                                                                      kPrimaryColor))
                                                    ])
                                              : Text(
                                                  '${trackCustomizeController.sectionIncludedSong.length} selected',
                                                  style: kBody3Medium.copyWith(
                                                      color: kPrimaryColor)),
                                        )))
                              ],
                            ),
                            kSizedBoxVerticalS,
                            Text('Time (min)',
                                style: kBody3Medium.copyWith(
                                    color: kGrayScaleColor500)),
                            kSizedBoxVerticalXS,
                            SizedBox(
                              width: double.infinity,
                              height: kSizeM,
                              child: Expanded(
                                child: Obx(() => SfSlider(
                                      thumbIcon: Container(
                                        width: 3,
                                        height: 3,
                                        margin: const EdgeInsets.all(100.0),
                                        decoration: const BoxDecoration(
                                            color: kPrimaryColor,
                                            shape: BoxShape.circle),
                                      ),
                                      activeColor: kPrimaryColor,
                                      inactiveColor: kGrayScaleColor200,
                                      min: 0.0,
                                      max: 60.0,
                                      interval: 15,
                                      showTicks: true,
                                      showLabels: true,
                                      enableTooltip: true,
                                      value: trackCustomizeController
                                          .sectionDuration.value,
                                      onChanged: (dynamic newValue) {
                                        int duration =
                                            double.parse(newValue.toString())
                                                .round();
                                        trackCustomizeController
                                            .setSectionDuration(duration);
                                      },
                                    )),
                              ),
                            ),
                            kSizedBoxVerticalL,
                          ],
                        )),
                        Padding(
                          padding: const EdgeInsets.only(bottom: kSizeS),
                          child: ButtonWidget(
                            button: ButtonType.mainButton,
                            text: getButtonText(
                                trackCustomizeController.customizeMode.value),
                            handleClick: () {
                              CreateSectionStatus createSectionStatus =
                                  trackCustomizeController.verifyCreateSection(
                                      trackCustomizeController
                                          .sectionDuration.value);
                              if (createSectionStatus ==
                                  CreateSectionStatus.exceed) {
                                Alert.showAlert(const ErrorPopup(
                                    errorMessage: 'Fail to create track',
                                    errorDescription:
                                        'Total duration of track must less than or equal 60 minutes.'));
                              } else if (createSectionStatus ==
                                  CreateSectionStatus.minimum) {
                                Alert.showAlert(const ErrorPopup(
                                    errorMessage: 'Fail to create track',
                                    errorDescription:
                                        'Section duration must more be at least 1 minute'));
                              } else {
                                if (trackCustomizeController
                                    .sectionFormKey.currentState!
                                    .validate()) {
                                  String sectionName = _sectionname.text;
                                  if (trackCustomizeController
                                          .customizeMode.value ==
                                      CustomizeMode.add) {
                                    trackCustomizeController
                                        .addSection(sectionName);
                                  } else {
                                    trackCustomizeController
                                        .updateSection(sectionName);
                                  }
                                }
                              }
                            },
                          ),
                        )
                      ],
                    ))),
          )
        ]));
  }
}
