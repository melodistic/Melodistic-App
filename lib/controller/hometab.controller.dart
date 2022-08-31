import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/screens/home/type/hometab.type.dart';

class HomeTabController extends GetxController {
  final List<HomeTab> tabs = <HomeTab>[
    HomeTab(
        id: 1,
        label: 'Recommended',
        type: HomeTabType.recommended,
        position: 0),
    HomeTab(id: 2, label: 'Running', type: HomeTabType.running, position: 0),
    HomeTab(id: 3, label: 'Cardio', type: HomeTabType.cardio, position: 0),
    HomeTab(id: 4, label: 'Yoga', type: HomeTabType.yoga, position: 50),
    HomeTab(id: 5, label: 'Pilatis', type: HomeTabType.yoga, position: 50)
  ];
  RxObjectMixin<HomeTab>? selectedTab;
  HomeTabController() {
    selectedTab = tabs[0].obs;
  }
  void selectTab(HomeTab tab, ScrollController scrollController) {
    selectedTab?.value = tab;
    scrollController.animateTo(tab.position,
        duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
  }
}
