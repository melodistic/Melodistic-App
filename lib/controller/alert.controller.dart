import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertController {
  static void showAlert(String title, String content) {
    BuildContext context = Get.context!;
    showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
