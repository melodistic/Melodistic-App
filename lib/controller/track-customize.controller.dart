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
  final List<OptionItem> exerciseTypeList = <OptionItem>[
    OptionItem(id: 1, label: 'Warm up', position: 0),
    OptionItem(id: 2, label: 'Exercise', position: 0),
    OptionItem(id: 3, label: 'Cooldown', position: 0),
    OptionItem(id: 4, label: 'Running', position: 50)
  ];
  final List<OptionItem> moodList = <OptionItem>[
    OptionItem(id: 1, label: 'Focus', position: 0),
    OptionItem(id: 2, label: 'Party', position: 0),
    OptionItem(id: 3, label: 'Romance', position: 0),
    OptionItem(id: 4, label: 'Chill', position: 0)
  ];
  late Rx<SectionType> newSectionType;
  late Rx<OptionItem> selectedTab;
  late Rx<OptionItem> selectedExerciseType;
  late Rx<OptionItem> selectedMood;
  TrackCustomizeController() {
    selectedTab = muscleGroupList[0].obs;
    selectedExerciseType = exerciseTypeList[0].obs;
    selectedMood = moodList[0].obs;
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

  void selectExerciseType(OptionItem tab, ScrollController scrollController) {
    selectedExerciseType.value = tab;
    scrollController.animateTo(tab.position,
        duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
  }

  void selectMood(OptionItem tab, ScrollController scrollController) {
    selectedMood.value = tab;
    scrollController.animateTo(tab.position,
        duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
  }
}
