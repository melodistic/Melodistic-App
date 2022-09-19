import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/screens/customize-track/type/muscletab.type.dart';

class TrackCustomizeController extends GetxController {
  final List<MuscleGroup> muscleGroupList = <MuscleGroup>[
    MuscleGroup(
        id: 1, label: 'Full body', position: 0),
    MuscleGroup(id: 2, label: 'Core', position: 0),
    MuscleGroup(id: 3, label: 'Abs', position: 0),
    MuscleGroup(id: 4, label: 'Arm', position: 50),
    MuscleGroup(id: 5, label: 'Leg', position: 60)
  ];
  RxObjectMixin<MuscleGroup>? selectedTab;
  TrackCustomizeController() {
    selectedTab = muscleGroupList[0].obs;
  }
  void selectMuscleGroup(MuscleGroup tab, ScrollController scrollController) {
    selectedTab?.value = tab;
    scrollController.animateTo(tab.position,
        duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
  }
}
