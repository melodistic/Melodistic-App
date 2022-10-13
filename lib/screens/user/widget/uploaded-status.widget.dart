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
        padding: const EdgeInsets.symmetric(horizontal: kSizeXS),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
                width: 1, color: isProcessing ? kWarningColor : kSuccessColor)),
        child: isProcessing
            ? Text('In progress', style: kBody4.copyWith(color: kWarningColor))
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                    const Icon(
                      MelodisticIcon.check_circle,
                      color: kSuccessColor,
                      size: kSizeS,
                    ),
                    kSizedBoxVerticalXS,
                    Text('Done', style: kBody4.copyWith(color: kSuccessColor))
                  ]));
  }
}
