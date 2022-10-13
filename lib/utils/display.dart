import 'package:flutter/material.dart';
import 'package:melodistic/config/constant.dart';

void showMelodisticBottomSheet(BuildContext context, Widget bottomsheet) {
  showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(kSizeS * 1.25),
            topRight: Radius.circular(kSizeS * 1.25)),
      ),
      builder: (BuildContext context) {
        return bottomsheet;
      });
}
