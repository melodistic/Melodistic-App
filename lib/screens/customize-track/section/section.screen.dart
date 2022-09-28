import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/controller/track-customize.controller.dart';
import 'package:melodistic/screens/customize-track/widgets/section-timeline/section-timeline.widget.dart';
import 'package:melodistic/screens/customize-track/widgets/selection-section-popup.widget.dart';
import 'package:melodistic/widgets/common/button.widget.dart';
import 'package:melodistic/widgets/common/popup/popup_dialog.widget.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';
import 'package:melodistic/widgets/common/type/button.type.dart';
import 'package:melodistic/widgets/common/type/screen.type.dart';

class CustomizeSectionScreen extends StatelessWidget {
  CustomizeSectionScreen({Key? key}) : super(key: key);
  final TrackCustomizeController trackCustomizeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
        screen: MelodisticScreenType.withBack,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kSizeS * 1.25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Create Section',
                  style: kHeading1,
                ),
                kSizedBoxVerticalS,
                Text('Create a special workout music program just for you.',
                    style: kBody2.copyWith(color: kGrayScaleColor600)),
                kSizedBoxVerticalS,
                Expanded(
                    child: Column(
                  children: <Widget>[
                    SectionTimeLine(
                        sectionList: trackCustomizeController.sectionList),
                    kSizedBoxVerticalS,
                    ButtonWidget(
                        button: ButtonType.softButton,
                        prefixIcon: MelodisticIcon.plus,
                        text: 'Add section',
                        handleClick: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) =>
                                  PopupWidget(content: SelectSectionPopup()),
                            ))
                  ],
                )),
                kSizedBoxVerticalS,
                const ButtonWidget(
                  button: ButtonType.mainButton,
                  text: 'Start Exercise',
                )
              ],
            )));
  }
}
