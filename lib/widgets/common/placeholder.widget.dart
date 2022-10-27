import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';

class PlaceholderWidget extends StatelessWidget {
  const PlaceholderWidget(
      {Key? key, required this.title, required this.description})
      : super(key: key);
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(vertical: kSizeM * 1.25),
            child: Image(image: AssetImage('assets/images/wave.png')),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kSizeS * 1.3),
            child: Column(
              children: <Widget>[
                Text(title, style: kHeading2.copyWith(color: kPrimaryColor)),
                kSizedBoxVerticalS,
                Text(description,
                    style: kBody2.copyWith(color: kGrayScaleColor600),
                    textAlign: TextAlign.center)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
