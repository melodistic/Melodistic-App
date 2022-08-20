import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/widgets/common/type/screen.type.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            child: const SpinKitFadingCircle(
          color: kGrayScaleColor300,
        )),
        kSizedBoxVerticalS,
        Text('Loading', style: kBody1.copyWith(fontWeight: kFontWeightMedium))
      ],
    ));
  }
}
