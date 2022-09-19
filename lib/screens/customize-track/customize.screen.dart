import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/controller/muscletab.controller.dart';
import 'package:melodistic/routes.dart';
import 'package:melodistic/widgets/common/button.widget.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';
import 'package:melodistic/widgets/common/scrollable-select.widget.dart';
import 'package:melodistic/widgets/common/textfield.widget.dart';
import 'package:melodistic/widgets/common/type/button.type.dart';
import 'package:melodistic/widgets/common/type/field.type.dart';
import 'package:melodistic/widgets/common/type/option-item.type.dart';
import 'package:melodistic/widgets/common/type/screen.type.dart';

class CustomizeScreen extends StatefulWidget {
  const CustomizeScreen({Key? key}) : super(key: key);

  @override
  State<CustomizeScreen> createState() => _CustomizeScreenState();
}

class _CustomizeScreenState extends State<CustomizeScreen> {
  final TrackCustomizeController muscleTabController = Get.find();
  @override
  Widget build(BuildContext context) {
    TextEditingController _programController = TextEditingController();
    return ScreenWrapper(
        screen: MelodisticScreenType.withBack,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: kSizeS * 1.25),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Customize',
                  style: kHeading1,
                ),
                kSizedBoxVerticalS,
                TextFieldWidget(
                  controller: _programController,
                  hintTitle: 'Program Name',
                  fieldType: FieldType.text,
                ),
                kSizedBoxVerticalM,
                Text('Program Picture',
                    style: kBody3.copyWith(color: kGrayScaleColor500)),
                kSizedBoxVerticalS,
                DottedBorder(
                  color: kGrayScaleColor500,
                  strokeWidth: 2,
                  dashPattern: const <double>[5, 3],
                  child: Container(
                      height: kSizeXXL,
                      padding:
                          const EdgeInsets.symmetric(horizontal: kSizeL * 1.25),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Image(
                                    image: AssetImage(
                                        'assets/images/picture.png')),
                                ButtonWidget(
                                    button: ButtonType.outlineButton,
                                    customContent: Text('Browse files',
                                        style: kBody3Medium.copyWith(
                                            color: kPrimaryColor)),
                                    size: ButtonSize.small,
                                    handleClick: () {
                                      getPhotoFromGallery();
                                    }),
                              ],
                            )
                          ])),
                ),
                kSizedBoxVerticalM,
                Text('Muscle group',
                    style: kBody3.copyWith(color: kGrayScaleColor500)),
                kSizedBoxVerticalXS,
                Column(
                  children: <Widget>[
                    Obx(() => ScrollableSelectWidget(
                          options: muscleTabController.muscleGroupList,
                          value: muscleTabController.selectedTab!.value,
                          onChange:
                              (OptionItem value, ScrollController controller) {
                            muscleTabController.selectMuscleGroup(
                                value, controller);
                          },
                        ))
                  ],
                ),
                kSizedBoxVerticalXL,
                ButtonWidget(
                  text: 'Next',
                  handleClick: () {
                    Get.toNamed<dynamic>(RoutesName.customizeSection);
                  },
                )
              ]),
        ));
  }

  Future<File?> getPhotoFromGallery() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      return imageFile;
    }
    return null;
  }
}
