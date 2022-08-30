import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/controller/track.controller.dart';
import 'package:melodistic/routes.dart';
import 'package:melodistic/screens/home/widgets/trackbox.widget.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';
import 'package:melodistic/widgets/common/type/screen.type.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackController trackController = Get.put(TrackController());

  @override
  void initState() {
    trackController.fetchPublicTracks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                : ListView.separated(
                    itemCount: trackController.publicTracks.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TrackBox(
                          track: trackController.publicTracks[index]);
                    },
                    separatorBuilder: ((BuildContext context, int index) =>
                        kSizedBoxVerticalS)))));
  }
}
