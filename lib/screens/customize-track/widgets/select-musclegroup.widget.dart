import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/controller/muscletab.controller.dart';
import 'package:melodistic/screens/customize-track/type/muscletab.type.dart';

class SelectMuscleGroupWidget extends StatelessWidget {
  SelectMuscleGroupWidget({Key? key}) : super(key: key);
  final TrackCustomizeController muscleTabController = Get.find();
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Obx(() => Row(
            children: muscleTabController.muscleGroupList
                .map((MuscleGroup tab) => GestureDetector(
                      child: Container(
                          margin: const EdgeInsets.only(right: kSizeXS),
                          padding: const EdgeInsets.symmetric(
                              vertical: kSizeXS, horizontal: kSizeS),
                          decoration: BoxDecoration(
                            color: tab.id ==
                                    muscleTabController.selectedTab?.value.id
                                ? kSecondaryColor
                                : kGrayScaleColor200,
                            borderRadius: kBorderRadiusXXS,
                          ),
                          child: Text(
                            tab.label,
                            style: tab.id ==
                                    muscleTabController.selectedTab?.value.id
                                ? kBody3SemiBold.copyWith(
                                    color: kGrayScaleColorWhite)
                                : kBody3.copyWith(color: kGrayScaleColor600),
                          )),
                      onTap: () {
                        muscleTabController.selectMuscleGroup(tab, scrollController);
                      },
                    ))
                .toList(),
          )),
      scrollDirection: Axis.horizontal,
    );
  }
}
