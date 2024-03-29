import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/controller/auth.controller.dart';
import 'package:melodistic/controller/hometab.controller.dart';
import 'package:melodistic/controller/track-customize.controller.dart';
import 'package:melodistic/controller/track.controller.dart';
import 'package:melodistic/models/track.model.dart';
import 'package:melodistic/routes.dart';
import 'package:melodistic/screens/home/type/hometab.type.dart';
import 'package:melodistic/screens/home/widgets/tablist.widget.dart';
import 'package:melodistic/screens/home/widgets/trackbox.widget.dart';
import 'package:melodistic/widgets/common/appbar/main.widget.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final TrackController trackController = Get.find();
  final HomeTabController homeTabController = Get.find();
  final AuthController authController = Get.find();
  final TrackCustomizeController trackCustomizeController = Get.find();

  @override
  Widget build(BuildContext context) {
    trackController.fetchPublicTracks();
    authController.tryAutoLogin();
    return ScreenWrapper(
        floatingActionButton: FloatingActionButton(
          child: const Icon(MelodisticIcon.plus),
          backgroundColor: Colors.black,
          onPressed: () {
            trackCustomizeController.setupNewTrack();
            Get.toNamed<dynamic>(RoutesName.customize);
          },
        ),
        customAppbar: const MainAppbar(title: 'Melodistic'),
        child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: kSizeS, vertical: 10),
            child: Obx(() {
              if (trackController.isFetching.isTrue) {
                return const SpinKitFadingCircle(
                  color: kGrayScaleColor300,
                );
              }
              List<Track> displayTracks = trackController.publicTracks
                  .where((Track track) =>
                      homeTabController.selectedTab?.value.type ==
                          HomeTabType.all ||
                      homeTabController.selectedTab?.value.label == track.tag)
                  .toList();
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TablistWidget(),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: kSizeS, horizontal: kSizeXXS),
                        child: Text(
                          '${homeTabController.selectedTab?.value.label} Track',
                          style: kHeading2.copyWith(color: kPrimaryColor),
                        )),
                    Expanded(
                        child: ListView.separated(
                            itemCount: displayTracks.length,
                            itemBuilder: (BuildContext context, int index) =>
                                TrackBox(track: displayTracks[index]),
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    kSizedBoxVerticalS))
                  ]);
            })));
  }
}
