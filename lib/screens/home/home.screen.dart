import 'package:flutter/material.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/routes.dart';
import 'package:melodistic/screens/home/widgets/trackbox.widget.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';
import 'package:dio/dio.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  Future<List> getPlaylist() async {
    final Response response =
        await Dio().get("http://20.24.147.227:5050/api/playlist");
    final List data = response.data["files"];
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
        isHome: true,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: kSizeS, vertical: 10),
          child: FutureBuilder(
            future: getPlaylist(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data as List;
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return TrackBox(track: data[index]);
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ));
  }
}
