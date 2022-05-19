import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/routes.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';
import 'package:dio/dio.dart';

class CustomizeScreen extends StatelessWidget {
  const CustomizeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController programController = TextEditingController();
    return ScreenWrapper(
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Customize",
          style: TextStyle(fontSize: kFontSizeXL, fontWeight: FontWeight.bold),
        ),
        TextField(
          controller: programController,
          maxLines: 20,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextButton(
              onPressed: () async {
                showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                        title: Text(
                          "Loading",
                          textAlign: TextAlign.center,
                        ),
                        content: Container(
                          height: 100,
                          child: Column(
                            children: [
                              SizedBox(
                                child: CircularProgressIndicator(),
                                width: 60,
                                height: 60,
                              )
                            ],
                          ),
                        )));
                try {
                  final Response resp = await Dio().post(
                      "http://20.24.147.227:5500/api/generate",
                      data: json.decode(programController.text));
                  Map track = resp.data["track"];

                  Navigator.of(context).pushNamedAndRemoveUntil(
                      RoutesName.track, ModalRoute.withName(RoutesName.home),
                      arguments: {"track": track});
                } on DioError catch (err) {
                  print(err);
                }
              },
              child: Text("Generate"))
        ])
      ]),
    ));
  }
}
