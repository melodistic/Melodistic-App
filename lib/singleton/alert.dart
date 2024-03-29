import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/widgets/common/popup/popup_dialog.widget.dart';

class Alert {
  static void showAlert(Widget? content, {VoidCallback? action}) {
    BuildContext context = Get.context!;
    showDialog<AlertDialog>(
        context: context,
        builder: (BuildContext context) =>
            PopupWidget(content: content, action: action));
  }
}
