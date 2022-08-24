import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/widgets/common/type/screen.type.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    this.button = ButtonType.mainButton,
    this.text,
    this.size = ButtonSize.large,
    this.state = ButtonState.normal,
    this.prefixIcon,
    this.suffixIcon,
    this.handleClick,
  }) : super(key: key);
  final ButtonType button;
  final String? text;
  final ButtonState state;
  final VoidCallback? handleClick;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final ButtonSize? size;

  ButtonStyle getButtonStyle() {
    if (button == ButtonType.mainButton) {
      return TextButton.styleFrom(
          textStyle: const TextStyle(fontSize: kSizeS),
          backgroundColor:
              state == ButtonState.disable ? kGrayScaleColor100 : kPrimaryColor,
          padding: size == ButtonSize.large
              ? const EdgeInsets.fromLTRB(kSizeM, kSizeS, kSizeM, kSizeS)
              : const EdgeInsets.fromLTRB(kSizeS, kSizeXS, kSizeS, kSizeXS));
    }
    if (button == ButtonType.softButton) {
      return TextButton.styleFrom(
          textStyle: const TextStyle(fontSize: kSizeS),
          backgroundColor: kGrayScaleColor100,
          padding: size == ButtonSize.large
              ? const EdgeInsets.fromLTRB(kSizeM, kSizeS, kSizeM, kSizeS)
              : const EdgeInsets.fromLTRB(kSizeS, kSizeXS, kSizeS, kSizeXS));
    }
    if (button == ButtonType.outlineButton) {
      return OutlinedButton.styleFrom(
          textStyle: const TextStyle(fontSize: kSizeS),
          side: BorderSide(
              color: state == ButtonState.normal
                  ? kPrimaryColor
                  : kGrayScaleColor300),
          padding: size == ButtonSize.large
              ? const EdgeInsets.fromLTRB(kSizeM, kSizeS, kSizeM, kSizeS)
              : const EdgeInsets.fromLTRB(kSizeS, kSizeXS, kSizeS, kSizeXS));
    }
    return const ButtonStyle();
  }

  Color getContentColor() {
    if (button == ButtonType.mainButton) {
      return state == ButtonState.disable
          ? kGrayScaleColor400
          : kGrayScaleColor50;
    }
    if (button == ButtonType.softButton) {
      return state == ButtonState.disable ? kGrayScaleColor400 : kPrimaryColor;
    }
    if (button == ButtonType.outlineButton) {
      return state == ButtonState.normal ? kPrimaryColor : kGrayScaleColor400;
    }
    if (button == ButtonType.textButton) {
      return state == ButtonState.disable
          ? kGrayScaleColor400
          : kGrayScaleColor600;
    }
    return kGrayScaleColor50;
  }

  SizedBox? buttonRender() {
    return SizedBox(
        width: size == ButtonSize.large ? double.infinity : null,
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
                      style: kHeading2Medium.copyWith(color: getContentColor()),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      prefixIcon,
                      key: const Key('prefix-icon'),
                      color: getContentColor(),
                    ),
                    Text(
                      text.toString(),
                      style: kHeading2Medium.copyWith(color: getContentColor()),
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
