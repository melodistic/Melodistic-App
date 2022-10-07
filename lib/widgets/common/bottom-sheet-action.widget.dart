import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/widgets/common/button.widget.dart';
import 'package:melodistic/widgets/common/type/button.type.dart';

class BottomSheetActionWidget extends StatelessWidget {
  const BottomSheetActionWidget(
      {Key? key,
      required this.title,
      required this.icon,
      required this.handleClick})
      : super(key: key);
  final String? title;
  final IconData? icon;
  final VoidCallback? handleClick;

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      handleClick: handleClick,
      button: ButtonType.textButton,
      customContent: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 20,
            backgroundColor: kGrayScaleColor200,
            child: IconButton(
              icon: Icon(icon, color: kPrimaryColor),
              onPressed: handleClick,
            ),
          ),
          kSizedBoxHorizontalS,
          Text(title!, style: kBody2.copyWith(color: kPrimaryColor))
        ],
      ),
    );
  }
}
