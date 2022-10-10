import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/widgets/common/button.widget.dart';

class ConfirmUploadPopup extends StatelessWidget {
  const ConfirmUploadPopup({Key? key, required this.metadata})
      : super(key: key);
  final Metadata metadata;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Youtube information:',
            style: kBody3Medium.copyWith(color: kGrayScaleColor600),
          ),
          kSizedBoxVerticalS,
          Container(
              padding: const EdgeInsets.symmetric(vertical: kSizeM),
              color: kGrayScaleColorBlack,
              child: Image.network(metadata.image!)),
          kSizedBoxVerticalS,
          Text(
            metadata.title!,
            style: kHeading3.copyWith(color: kGrayScaleColorBlack),
          ),
          kSizedBoxVerticalS,
          ButtonWidget(
            text: 'Confirm',
            handleClick: () {
              Get.back<void>();
            },
          )
        ]);
  }
}
