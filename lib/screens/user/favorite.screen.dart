import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/controller/track.controller.dart';
import 'package:melodistic/screens/home/widgets/trackbox.widget.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';
import 'package:melodistic/widgets/common/type/screen.type.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final TrackController trackController = TrackController();
  @override
  void initState() {
    trackController.fetchFavoriteTracks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
        screen: MelodisticScreenType.withTitle,
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: kSizeS),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(bottom: kSizeS),
                      child: Text(
                        'Latest Program',
                        style: kBody3Medium.copyWith(color: kPrimaryColor),
                      )),
                  Expanded(
                      child: ListView.separated(
                          itemCount: trackController.favoriteTracks.length,
                          itemBuilder: (BuildContext context, int index) {
                            return TrackBox(
                                track: trackController.favoriteTracks[index]);
                          },
                          separatorBuilder:
                              ((BuildContext context, int index) =>
                                  kSizedBoxVerticalS)))
                ])));
  }
}
