import 'dart:async';

import 'package:flutter/material.dart';
import 'package:melodistic/config/api.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/routes.dart';
import 'package:melodistic/screens/home/widgets/trackbox.widget.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';
import 'package:dio/dio.dart';
import 'package:melodistic/widgets/common/type/screen.type.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Map<String, String>>> _getPlayList;

  Future<List<Map<String, String>>> getPlaylist() async {
    final Response<List<Map<String, String>>> response =
        await Dio().get('$apiBaseURL/api/track');
    final List<Map<String, String>> data = response.data!;
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
      loadData();
    });
    return ScreenWrapper(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.of(context).pushNamed(RoutesName.customize);
          },
        ),
        screen: ScreenType.withTitle,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: kSizeS, vertical: 10),
          child: FutureBuilder<List<Map<dynamic, dynamic>>>(
            future: _getPlayList,
            builder: (BuildContext context,
                AsyncSnapshot<List<Map<dynamic, dynamic>>> snapshot) {
              if (snapshot.hasData) {
                final List<Map<String, String>> data =
                    snapshot.data as List<Map<String, String>>;
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
