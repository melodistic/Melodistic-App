import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Alert {
  static void showAlert(String title, String? description) {
    BuildContext context = Get.context!;
    showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
              height: 200,
              child: Column(
                children: [
                  Icon(Icons.warning),
                  Text(title),
                  if (description != null) Text(description),
                  ElevatedButton(
                    onPressed: () => Get.back<void>(),
                    child: const Text('Close'),
                  )
                ],
              )),
        );
      },
    );
  }
}
