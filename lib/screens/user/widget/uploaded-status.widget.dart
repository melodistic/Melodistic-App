import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/style.dart';

class UploadedStatusWidget extends StatelessWidget {
  const UploadedStatusWidget({Key? key, required this.isProcessing})
      : super(key: key);
  final bool isProcessing;

  @override
  Widget build(BuildContext context) {
    return isProcessing
        ? Text('In progress',
            style: kBody3Medium.copyWith(color: kWarningColor))
        : Text('Done', style: kBody3Medium.copyWith(color: kSuccessColor));
  }
}
