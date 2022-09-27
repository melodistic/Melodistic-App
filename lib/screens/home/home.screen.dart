import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/controller/auth.controller.dart';
import 'package:melodistic/controller/hometab.controller.dart';
import 'package:melodistic/controller/track.controller.dart';
import 'package:melodistic/routes.dart';
import 'package:melodistic/screens/home/widgets/tablist.widget.dart';
import 'package:melodistic/screens/home/widgets/trackbox.widget.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';
import 'package:melodistic/widgets/common/type/screen.type.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final TrackController trackController = Get.find();
  final HomeTabController homeTabController = Get.find();
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    trackController.fetchPublicTracks();
    authController.tryAutoLogin();
    return ScreenWrapper(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          backgroundColor: Colors.black,
          onPressed: () {
            Get.toNamed<dynamic>(RoutesName.customize);
          },
        ),
        screen: MelodisticScreenType.withTitle,
        child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: kSizeS, vertical: 10),
            child: Obx(() => trackController.isFetching.isTrue
                ? const SpinKitFadingCircle(
                    color: kGrayScaleColor300,
                  )
                : Column(
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
                                itemCount: trackController.publicTracks.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return TrackBox(
                                      track:
                                          trackController.publicTracks[index]);
                                },
                                separatorBuilder:
                                    ((BuildContext context, int index) =>
                                        kSizedBoxVerticalS)))
                      ]))));
  }
}
