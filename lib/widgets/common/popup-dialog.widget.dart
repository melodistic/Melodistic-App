import 'package:flutter/material.dart';
import 'package:melodistic/config/icon.dart';

class PopupWidget extends StatelessWidget {
  const PopupWidget({Key? key, this.content}) : super(key: key);
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6))),
        contentPadding: const EdgeInsets.fromLTRB(12, 24, 12, 24),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(MelodisticIcon.cross),
              ),
            ],
          ),
          content!,
        ]);
  }
}
