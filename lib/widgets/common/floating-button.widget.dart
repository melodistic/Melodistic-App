import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/widgets/common/type/screen.type.dart';

class FloatingButtonWidget extends StatelessWidget {
  const FloatingButtonWidget({
    Key? key,
    this.state = ButtonState.normal,
    this.icon,
    this.handleClick,
  }) : super(key: key);
  final ButtonState state;
  final VoidCallback? handleClick;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor:
          state == ButtonState.normal ? kGrayScaleColor900 : kGrayScaleColor100,
      onPressed: state == ButtonState.disable ? () {} : handleClick,
      child: Icon(icon,
          color: state == ButtonState.disable
              ? kGrayScaleColor400
              : kGrayScaleColor50),
    );
  }
}
