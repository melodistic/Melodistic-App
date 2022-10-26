import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/screens/home/type/hometab.type.dart';

class HomeTabController extends GetxController {
  final List<HomeTab> tabs = <HomeTab>[
    HomeTab(id: 1, label: 'All', type: HomeTabType.all, position: 0),
    HomeTab(id: 2, label: 'Aerobic', type: HomeTabType.running, position: 0),
    HomeTab(id: 3, label: 'Strength', type: HomeTabType.cardio, position: 0),
    HomeTab(id: 4, label: 'Flexibility', type: HomeTabType.yoga, position: 0),
    HomeTab(id: 5, label: 'Balancing', type: HomeTabType.pilatis, position: 35)
  ];
  Rx<HomeTab>? selectedTab;
  HomeTabController() {
    selectedTab = tabs[0].obs;
  }
  void selectTab(HomeTab tab, ScrollController scrollController) {
    selectedTab?.value = tab;
    scrollController.animateTo(tab.position,
        duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
  }
}
