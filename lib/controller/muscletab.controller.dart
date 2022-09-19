import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/widgets/common/type/option-item.type.dart';
import 'package:melodistic/widgets/common/type/section.type.dart';

class TrackCustomizeController extends GetxController {
  final List<OptionItem> muscleGroupList = <OptionItem>[
    OptionItem(id: 1, label: 'Full body', position: 0),
    OptionItem(id: 2, label: 'Core', position: 0),
    OptionItem(id: 3, label: 'Abs', position: 0),
    OptionItem(id: 4, label: 'Arm', position: 50),
    OptionItem(id: 5, label: 'Leg', position: 60)
  ];
  late Rx<SectionType> newSectionType;
  late Rx<OptionItem> selectedTab;
  TrackCustomizeController() {
    selectedTab = muscleGroupList[0].obs;
    newSectionType = SectionType.exerciseSection.obs;
  }
  void selectMuscleGroup(OptionItem tab, ScrollController scrollController) {
    selectedTab.value = tab;
    scrollController.animateTo(tab.position,
        duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
  }
  void selectNewSectionType(SectionType type) {
    newSectionType.value = type;
  }
}
