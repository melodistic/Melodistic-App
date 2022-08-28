import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
// import 'package:melodistic/config/api.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/routes.dart';
import 'package:melodistic/screens/home/track_mock_data.dart';
import 'package:melodistic/screens/home/widgets/trackbox.widget.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';
// import 'package:dio/dio.dart';
import 'package:melodistic/widgets/common/type/screen.type.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Track>> _getPlayList;

  Future<List<Track>> getPlaylist() async {
    // final Response<List<Map<String, String>>> response =
    //     await Dio().get('$apiBaseURL/api/track');
    final List<Track> data = <Track>[
      Track(
          trackId: '1',
          trackName: "It's long time ago",
          trackImageUrl: 'https://img.cscms.me/6b4X3LyVJOYaLd9UXVOq.png',
          muscleGroup: 'ABS',
          description: '12 minutes of abs workout',
          duration: 720,
          isPublic: true),
      Track(
          trackId: '2',
          trackName: 'In the loving time',
          trackImageUrl: 'https://img.cscms.me/jd5r4pR0fJOfcmpuiG1o.png',
          muscleGroup: 'ARM',
          description: '10 minutes of arm workout',
          duration: 600,
          isPublic: true),
      Track(
          trackId: '3',
          trackName: "Let's have a party",
          trackImageUrl: 'https://img.cscms.me/cwiYBrsYDr3kHufJYn7T.png',
          muscleGroup: 'CORE',
          description: '8 minutes of core workout',
          duration: 8,
          isPublic: true),
    ];
    return data;
  }

  void loadData() {
    setState(() {
      _getPlayList = getPlaylist();
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      // loadData();
    });
    return ScreenWrapper(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          backgroundColor: Colors.black,
          onPressed: () {
            Get.toNamed<String>(RoutesName.customize);
          },
        ),
        screen: ScreenType.withTitle,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: kSizeS, vertical: 10),
          child: FutureBuilder<List<Track>>(
            future: _getPlayList,
            builder:
                (BuildContext context, AsyncSnapshot<List<Track>> snapshot) {
              if (snapshot.hasData) {
                final List<Track> data = snapshot.data as List<Track>;
                return ListView.separated(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TrackBox(track: data[index]);
                    },
                    separatorBuilder: ((BuildContext context, int index) =>
                        kSizedBoxVerticalS));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ));
  }
}
