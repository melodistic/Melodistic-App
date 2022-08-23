import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/widgets/common/type/screen.type.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    this.button = ButtonType.mainButton,
    this.text,
    this.state = ButtonState.normal,
    this.prefixIcon,
    this.suffixIcon,
    this.handleClick,
    this.height,
    this.width,
  }) : super(key: key);
  final ButtonType button;
  final String? text;
  final ButtonState state;
  final double? height;
  final double? width;
  final VoidCallback? handleClick;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  ButtonStyle getButtonStyle() {
    if (button == ButtonType.mainButton) {
      return TextButton.styleFrom(
          backgroundColor: state == ButtonState.disable
              ? kGrayScaleColor200
              : kPrimaryColor);
    }
    if (button == ButtonType.softButton) {
      return TextButton.styleFrom(
          backgroundColor: state == ButtonState.normal
              ? kGrayScaleColor100
              : kGrayScaleColor200);
    }
    if (button == ButtonType.outlineButton) {
      return OutlinedButton.styleFrom(
          side: BorderSide(
              color: state == ButtonState.active
                  ? kSecondaryColor
                  : state == ButtonState.normal
                      ? kGrayScaleColor900
                      : kGrayScaleColor200));
    }
    return const ButtonStyle();
  }

  Color getContentColor() {
    if (button == ButtonType.mainButton) {
      return state == ButtonState.disable
          ? kGrayScaleColor500
          : kGrayScaleColor50;
    }
    if (button == ButtonType.softButton) {
      return state == ButtonState.disable ? kGrayScaleColor500 : kPrimaryColor;
    }
    if (button == ButtonType.outlineButton) {
      return state == ButtonState.active
          ? kSecondaryColor
          : state == ButtonState.normal
              ? kGrayScaleColor900
              : kGrayScaleColor500;
    }
    if (button == ButtonType.textButton) {
      return state == ButtonState.disable ? kGrayScaleColor500 : kPrimaryColor;
    }
    return kGrayScaleColor50;
  }

  SizedBox? buttonRender() {
    return SizedBox(
        width: width,
        height: height,
        child: button == ButtonType.outlineButton
            ? OutlinedButton(
                style: getButtonStyle(),
                onPressed: state == ButtonState.disable ? () {} : handleClick,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(prefixIcon,
                        key: const Key('prefix-icon'),
                        color: getContentColor()),
                    Text(
                      text.toString(),
                      style: TextStyle(color: getContentColor()),
                    ),
                    Icon(suffixIcon,
                        key: const Key('suffix-icon'), color: getContentColor())
                  ],
                ),
              )
            : TextButton(
                style: getButtonStyle(),
                onPressed: state == ButtonState.disable ? () {} : handleClick,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(
                      prefixIcon,
                      key: const Key('prefix-icon'),
                      color: getContentColor(),
                    ),
                    Text(
                      text.toString(),
                      style: TextStyle(color: getContentColor()),
                    ),
                    Icon(
                      suffixIcon,
                      key: const Key('suffix-icon'),
                      color: getContentColor(),
                    )
                  ],
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: buttonRender());
  }
}
