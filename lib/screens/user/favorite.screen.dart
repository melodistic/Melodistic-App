import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/controller/track.controller.dart';
import 'package:melodistic/screens/home/widgets/trackbox.widget.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';
import 'package:melodistic/widgets/common/type/screen.type.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({Key? key}) : super(key: key);
  final TrackController trackController = TrackController();

  @override
  Widget build(BuildContext context) {
    trackController.fetchFavoriteTracks();
    return ScreenWrapper(
        screen: MelodisticScreenType.withTitle,
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: kSizeS),
            child: Obx(() => trackController.isFetching.isTrue
                ? const SpinKitFadingCircle(
                    color: kGrayScaleColor300,
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(bottom: kSizeS),
                            child: Text(
                              'Latest Program',
                              style:
                                  kBody3Medium.copyWith(color: kPrimaryColor),
                            )),
                        Expanded(
                            child: ListView.separated(
                                itemCount:
                                    trackController.favoriteTracks.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return TrackBox(
                                      track: trackController
                                          .favoriteTracks[index]);
                                },
                                separatorBuilder:
                                    ((BuildContext context, int index) =>
                                        kSizedBoxVerticalS)))
                      ]))));
  }
}
