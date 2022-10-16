import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/config/style.dart';

class UploadedStatusWidget extends StatelessWidget {
  const UploadedStatusWidget({Key? key, required this.isProcessing})
      : super(key: key);
  final bool isProcessing;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
                width: 1, color: isProcessing ? kWarningColor : kSuccessColor)),
        width: kSizeL,
        height: kSizeS * 1.5,
        child: isProcessing
            ? Text('In progress', style: kBody4.copyWith(color: kWarningColor))
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    const Icon(
                      MelodisticIcon.check_circle,
                      color: kSuccessColor,
                      size: kSizeS,
                    ),
                    kSizedBoxHorizontalXXS,
                    Text('Done', style: kBody4.copyWith(color: kSuccessColor))
                  ]));
  }
}
