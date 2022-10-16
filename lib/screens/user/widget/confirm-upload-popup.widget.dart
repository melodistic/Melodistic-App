import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/controller/processed-music.controller.dart';
import 'package:melodistic/widgets/common/button.widget.dart';

class ConfirmUploadPopup extends StatelessWidget {
  ConfirmUploadPopup(
      {Key? key,
      required this.source,
      this.metadata,
      this.title,
      required this.handleClick})
      : super(key: key);
  final Metadata? metadata;
  final String source;
  final String? title;
  final VoidCallback handleClick;
  final ProcessedMusicController processedMusicController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '$source information:',
            style: kBody3Medium.copyWith(color: kGrayScaleColor600),
          ),
          kSizedBoxVerticalS,
          if (source == 'Youtube')
            Column(
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.symmetric(vertical: kSizeM),
                    color: kGrayScaleColorBlack,
                    child: Image.network(metadata!.image!)),
                kSizedBoxVerticalS,
              ],
            ),
          Text(
            source == 'Youtube' ? metadata!.title! : title!,
            style: kHeading3.copyWith(color: kGrayScaleColorBlack),
          ),
          kSizedBoxVerticalS,
          ButtonWidget(
            text: 'Confirm',
            handleClick: handleClick,
          )
        ]);
  }
}
