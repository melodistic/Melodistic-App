import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/controller/track-customize.controller.dart';
import 'package:melodistic/routes.dart';
import 'package:melodistic/utils/file.dart';
import 'package:melodistic/widgets/common/appbar/back.widget.dart';
import 'package:melodistic/widgets/common/button.widget.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';
import 'package:melodistic/widgets/common/scrollable-select.widget.dart';
import 'package:melodistic/widgets/common/textfield.widget.dart';
import 'package:melodistic/widgets/common/type/button.type.dart';
import 'package:melodistic/widgets/common/type/field.type.dart';
import 'package:melodistic/widgets/common/type/option-item.type.dart';

class CustomizeScreen extends StatelessWidget {
  CustomizeScreen({Key? key}) : super(key: key);

  final TrackCustomizeController trackCustomizeController = Get.find();
  @override
  Widget build(BuildContext context) {
    TextEditingController _programController = TextEditingController();
    return ScreenWrapper(
        customAppbar: const BackAppbar(
          title: 'Back',
        ),
        child: CustomScrollView(slivers: <Widget>[
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: kSizeS * 1.25, vertical: kSizeXS),
                child: Form(
                  key: trackCustomizeController.customizeFormKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                              const Text(
                                'Customize',
                                style: kHeading1,
                              ),
                              kSizedBoxVerticalXS,
                              TextFieldWidget(
                                controller: _programController,
                                hintTitle: 'Program Name',
                                fieldType: FieldType.text,
                                validate: trackCustomizeController
                                    .validateProgramName,
                              ),
                              kSizedBoxVerticalS,
                              Text('Program Picture',
                                  style: kBody3.copyWith(
                                      color: kGrayScaleColor500)),
                              kSizedBoxVerticalS,
                              DottedBorder(
                                color: kGrayScaleColor500,
                                strokeWidth: 2,
                                dashPattern: const <double>[5, 3],
                                child: SizedBox(
                                    height: kSizeXXL,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Obx(() => trackCustomizeController
                                                      .programPicture.value ==
                                                  null
                                              ? Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    const Image(
                                                        image: AssetImage(
                                                            'assets/images/picture.png')),
                                                    ButtonWidget(
                                                        button: ButtonType
                                                            .outlineButton,
                                                        customContent: Text(
                                                            'Browse files',
                                                            style: kBody3Medium
                                                                .copyWith(
                                                                    color:
                                                                        kPrimaryColor)),
                                                        size: ButtonSize.small,
                                                        handleClick: () async {
                                                          File? image =
                                                              await getPhotoFromGallery();
                                                          if (image != null) {
                                                            trackCustomizeController
                                                                .setProgramPicture(
                                                                    image);
                                                            trackCustomizeController
                                                                .errorMessage
                                                                .value = null;
                                                          }
                                                        }),
                                                  ],
                                                )
                                              : Expanded(
                                                  child: Image.file(
                                                    trackCustomizeController
                                                        .programPicture.value!,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ))
                                        ])),
                              ),
                              Obx(() {
                                if (trackCustomizeController
                                        .errorMessage.value !=
                                    null) {
                                  return Column(children: <Widget>[
                                    kSizedBoxVerticalXS,
                                    Text(
                                        '${trackCustomizeController.errorMessage.value}',
                                        style: kBody3Medium.copyWith(
                                            color: kErrorColor)),
                                    kSizedBoxVerticalS
                                  ]);
                                }
                                return kSizedBoxVerticalS;
                              }),
                              Text('Muscle group',
                                  style: kBody3.copyWith(
                                      color: kGrayScaleColor500)),
                              kSizedBoxVerticalXS,
                              Column(
                                children: <Widget>[
                                  Obx(() => ScrollableSelectWidget(
                                        options: trackCustomizeController
                                            .muscleGroupList,
                                        value: trackCustomizeController
                                            .muscleGroup.value,
                                        onChange: (OptionItem value,
                                            ScrollController controller) {
                                          trackCustomizeController
                                              .selectMuscleGroup(
                                                  value, controller);
                                        },
                                      ))
                                ],
                              )
                            ])),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ButtonWidget(
                            text: 'Next',
                            handleClick: () {
                              if (trackCustomizeController
                                      .customizeFormKey.currentState!
                                      .validate() &&
                                  trackCustomizeController
                                      .validateProgramPicture()) {
                                String programName = _programController.text;
                                trackCustomizeController
                                    .setProgramName(programName);
                                Get.toNamed<dynamic>(
                                    RoutesName.customizeSection);
                              }
                            },
                          ),
                        )
                      ]),
                )),
          )
        ]));
  }
}
