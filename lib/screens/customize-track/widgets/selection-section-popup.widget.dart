import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/controller/track-customize.controller.dart';
import 'package:melodistic/screens/customize-track/widgets/select-section.widget.dart';
import 'package:melodistic/widgets/common/button.widget.dart';
import 'package:melodistic/widgets/common/type/button.type.dart';
import 'package:melodistic/widgets/common/type/section.type.dart';

class SelectSectionPopup extends StatelessWidget {
  SelectSectionPopup({Key? key}) : super(key: key);
  final TrackCustomizeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
              padding: EdgeInsetsDirectional.only(top: kSizeS),
              child: Text('Select section type', style: kHeading2)),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: kSizeXS),
              child: Text(
                  'relax and walk around by adding some exercise breaks.',
                  style: kBody3.copyWith(color: kGrayScaleColor500))),
          Obx(() => SelectSectionType(
              value: controller.sectionType.value,
              onChanged: (SectionType? type) {
                if (type != null) {
                  controller.selectNewSectionType(type);
                }
              })),
          kSizedBoxVerticalM,
          Column(
            children: <Widget>[
              ButtonWidget(
                button: ButtonType.mainButton,
                text: 'Add',
                handleClick: () {
                  controller.createNewSection();
                },
              )
            ],
          )
        ]);
  }
}
