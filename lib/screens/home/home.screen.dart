import 'dart:async';

import 'package:flutter/material.dart';
import 'package:melodistic/config/api.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/screens/home/widgets/trackbox.widget.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';
import 'package:dio/dio.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _getPlayList;

  Future<List> getPlaylist() async {
    final Response response =
        await Dio().get("$apiBaseURL/api/track");
    final List data = response.data;
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
    Timer(Duration(seconds: 3), () {
      loadData();
    });
    return ScreenWrapper(
        isHome: true,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: kSizeS, vertical: 10),
          child: FutureBuilder(
            future: _getPlayList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data as List;
                return ListView.separated(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return TrackBox(track: data[index]);
                  },
                  separatorBuilder: ((context, index) => kSizedBoxVerticalS),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ));
  }
}
