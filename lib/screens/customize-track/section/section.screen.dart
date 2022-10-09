import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/controller/player.controller.dart';
import 'package:melodistic/controller/track-customize.controller.dart';
import 'package:melodistic/models/track.model.dart';
import 'package:melodistic/routes.dart';
import 'package:melodistic/screens/customize-track/widgets/section-bottomsheet.widget.dart';
import 'package:melodistic/screens/customize-track/widgets/section-timeline/section-timeline.widget.dart';
import 'package:melodistic/widgets/common/appbar/back.widget.dart';
import 'package:melodistic/widgets/common/button.widget.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';
import 'package:melodistic/widgets/common/type/button.type.dart';

class CustomizeSectionScreen extends StatelessWidget {
  CustomizeSectionScreen({Key? key}) : super(key: key);
  final TrackCustomizeController trackCustomizeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
        customAppbar: const BackAppbar(
          title: 'Back',
        ),
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
                        handleClick: () {
                          showModalBottomSheet<void>(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0)),
                              ),
                              builder: (BuildContext context) {
                                return SectionBottomSheet();
                              });
                        })
                  ],
                )),
                kSizedBoxVerticalS,
                Obx(() => ButtonWidget(
                      button: ButtonType.mainButton,
                      text: 'Start Exercise',
                      customContent: trackCustomizeController.isProcessing.value
                          ? const SpinKitFadingCircle(
                              color: kGrayScaleColor300,
                              size: 18,
                            )
                          : null,
                      handleClick: () async {
                        if (!trackCustomizeController.isProcessing.value) {
                          Track? track =
                              await trackCustomizeController.generateTrack();
                          if (track != null) {
                            PlayerController playerController = Get.find();
                            await playerController.setupPlayer(track);
                            Get.offAllNamed<void>(RoutesName.track);
                          }
                        }
                      },
                    ))
              ],
            )));
  }
}
