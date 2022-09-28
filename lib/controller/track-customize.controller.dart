import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/routes.dart';
import 'package:melodistic/screens/customize-track/type/Section.type.dart';
import 'package:melodistic/widgets/common/type/field.type.dart';
import 'package:melodistic/widgets/common/type/option-item.type.dart';
import 'package:melodistic/widgets/common/type/section.type.dart';

class TrackCustomizeController extends GetxController {
  final GlobalKey<FormState> customizeFormKey = GlobalKey<FormState>();

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

  late RxList<Section> sectionList;

  late Rx<OptionItem> muscleGroup;
  late Rx<SectionType> sectionType;
  late Rx<OptionItem> sectionExerciseType;
  late Rx<OptionItem> sectionMood;
  late Rx<int> sectionDuration;
  Rxn<String> programName = Rxn<String>();
  Rxn<File> programPicture = Rxn<File>();
  Rxn<String> errorMessage = Rxn<String>();
  Rxn<String> sectionName = Rxn<String>();

  TrackCustomizeController() {
    muscleGroup = muscleGroupList[0].obs;
    sectionType = SectionType.exerciseSection.obs;
    sectionExerciseType = exerciseTypeList[0].obs;
    sectionMood = moodList[0].obs;
    sectionDuration = 15.obs;
    // mock data
    sectionList = getMockSectionList().obs;
  }

  bool validateProgramPicture() {
    if (programPicture.value == null) {
      errorMessage.value = 'Program Picture is required';
      return false;
    } else {
      errorMessage.value = null;
      return true;
    }
  }

  ValidateFunction validateProgramName = (String? value) {
    if (value == null || value.isEmpty) {
      return 'Program Name is required';
    }
    return null;
  };

  Future<void> setSectionName(String newSectionName) async {
    sectionName.value = newSectionName;
  }

  Future<void> setProgramName(String newProgramName) async {
    programName.value = newProgramName;
  }

  Future<void> setProgramPicture(File newProgramPicture) async {
    programPicture.value = newProgramPicture;
  }

  void setupNewSection() {
    sectionExerciseType.value = exerciseTypeList[0];
    sectionMood.value = moodList[0];
    sectionDuration.value = 15;
  }

  void setupNewTrack() {
    programName.value = null;
    programPicture.value = null;
    muscleGroup.value = muscleGroupList[0];
  }

  void createNewSection() {
    setupNewSection();
    if (sectionType.value == SectionType.exerciseSection) {
      Get.toNamed<void>(RoutesName.customizeExerciseSection);
    } else if (sectionType.value == SectionType.breakSection) {
      Get.toNamed<void>(RoutesName.customizeBreakSection);
    }
  }

  void selectMuscleGroup(OptionItem tab, ScrollController scrollController) {
    muscleGroup.value = tab;
    scrollController.animateTo(tab.position,
        duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
  }

  void selectNewSectionType(SectionType type) {
    sectionType.value = type;
  }

  void selectExerciseType(OptionItem tab, ScrollController scrollController) {
    sectionExerciseType.value = tab;
    scrollController.animateTo(tab.position,
        duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
  }

  void selectMood(OptionItem tab, ScrollController scrollController) {
    sectionMood.value = tab;
    scrollController.animateTo(tab.position,
        duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
  }

  void setSectionDuration(int duration) {
    sectionDuration.value = duration;
  }

  List<Section> getMockSectionList() {
    return <Section>[
      Section(
          name: 'Warm up',
          type: SectionType.exerciseSection,
          exerciseType: 'Warm up',
          mood: 'Chill',
          duration: 15),
      Section(
          name: 'Break',
          type: SectionType.breakSection,
          exerciseType: 'break',
          mood: 'Chill',
          duration: 5),
      Section(
          name: 'Set 1',
          type: SectionType.exerciseSection,
          exerciseType: 'Exercise',
          mood: 'Focus',
          duration: 15),
      Section(
          name: 'Set 2',
          type: SectionType.exerciseSection,
          exerciseType: 'Exercise',
          mood: 'Party',
          duration: 15)
    ];
  }
}
