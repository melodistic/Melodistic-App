import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/screens/customize-track/type/muscletab.type.dart';

class MuscleTabController extends GetxController {
  final List<MuscleTab> tabs = <MuscleTab>[
    MuscleTab(
        id: 1, label: 'Full body', type: MuscleTabType.fullbody, position: 0),
    MuscleTab(id: 2, label: 'Core', type: MuscleTabType.core, position: 0),
    MuscleTab(id: 3, label: 'Abs', type: MuscleTabType.abs, position: 0),
    MuscleTab(id: 4, label: 'Arm', type: MuscleTabType.arm, position: 50),
    MuscleTab(id: 5, label: 'Leg', type: MuscleTabType.leg, position: 60)
  ];
  RxObjectMixin<MuscleTab>? selectedTab;
  MuscleTabController() {
    selectedTab = tabs[0].obs;
  }
  void selectTab(MuscleTab tab, ScrollController scrollController) {
    selectedTab?.value = tab;
    scrollController.animateTo(tab.position,
        duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
  }
}
