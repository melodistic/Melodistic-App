import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/controller/hometab.controller.dart';
import 'package:melodistic/screens/home/type/hometab.type.dart';

class TablistWidget extends StatelessWidget {
  TablistWidget({Key? key}) : super(key: key);
  final HomeTabController homeTabController = Get.find();
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _controller,
      child: Obx(() => Row(
            children: homeTabController.tabs
                .map((HomeTab tab) => GestureDetector(
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: kSizeXS, horizontal: kSizeS),
                          decoration: BoxDecoration(
                            color: tab.id ==
                                    homeTabController.selectedTab?.value.id
                                ? kSecondaryColor
                                : kGrayScaleColorWhite,
                            borderRadius: kBorderRadiusM,
                          ),
                          child: Text(
                            tab.label,
                            style: tab.id ==
                                    homeTabController.selectedTab?.value.id
                                ? kBody3Medium.copyWith(
                                    color: kGrayScaleColorWhite)
                                : kBody3.copyWith(color: kGrayScaleColor600),
                          )),
                      onTap: () {
                        homeTabController.selectTab(tab, _controller);
                      },
                    ))
                .toList(),
          )),
      scrollDirection: Axis.horizontal,
    );
  }
}
