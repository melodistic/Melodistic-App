import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/widgets/common/type/button.type.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {Key? key,
      this.button = ButtonType.mainButton,
      this.text,
      this.size = ButtonSize.large,
      this.state = ButtonState.normal,
      this.prefixIcon,
      this.suffixIcon,
      this.handleClick,
      this.customContent})
      : super(key: key);
  final ButtonType button;
  final String? text;
  final ButtonState state;
  final VoidCallback? handleClick;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final ButtonSize? size;
  final Widget? customContent;

  ButtonStyle getButtonStyle() {
    if (button == ButtonType.mainButton) {
      return TextButton.styleFrom(
          textStyle: const TextStyle(fontSize: kSizeS),
          foregroundColor: kGrayScaleColor700,
          backgroundColor:
              state == ButtonState.disable ? kGrayScaleColor100 : kPrimaryColor,
          padding: size == ButtonSize.large
              ? const EdgeInsets.fromLTRB(kSizeM, kSizeS, kSizeM, kSizeS)
              : const EdgeInsets.fromLTRB(kSizeS, kSizeXS, kSizeS, kSizeXS));
    }
    if (button == ButtonType.softButton) {
      return TextButton.styleFrom(
          textStyle: const TextStyle(fontSize: kSizeS),
          foregroundColor: kGrayScaleColor700,
          backgroundColor: kGrayScaleColor100,
          padding: size == ButtonSize.large
              ? const EdgeInsets.fromLTRB(kSizeM, kSizeS, kSizeM, kSizeS)
              : const EdgeInsets.fromLTRB(kSizeS, kSizeXS, kSizeS, kSizeXS));
    }
    if (button == ButtonType.outlineButton) {
      return OutlinedButton.styleFrom(
          textStyle: const TextStyle(fontSize: kSizeS),
          foregroundColor: kGrayScaleColor700,
          side: BorderSide(
              color: state == ButtonState.normal
                  ? kPrimaryColor
                  : kGrayScaleColor300),
          padding: size == ButtonSize.large
              ? const EdgeInsets.fromLTRB(kSizeM, kSizeS, kSizeM, kSizeS)
              : const EdgeInsets.fromLTRB(kSizeS, kSizeXS, kSizeS, kSizeXS));
    }
    return ButtonStyle(
        overlayColor: MaterialStateProperty.all<Color?>(kGrayScaleColor200));
  }

  Color getContentColor() {
    if (button == ButtonType.mainButton) {
      return state == ButtonState.disable
          ? kGrayScaleColor400
          : kGrayScaleColorWhite;
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
    return kGrayScaleColorWhite;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: size == ButtonSize.large ? double.infinity : null,
        child: button == ButtonType.outlineButton
            ? OutlinedButton(
                style: getButtonStyle(),
                onPressed: state == ButtonState.disable ? () {} : handleClick,
                child: customContent ??
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(prefixIcon,
                            key: const Key('prefix-icon'),
                            color: getContentColor()),
                        Text(
                          text.toString(),
                          style: kHeading2Medium.copyWith(
                              color: getContentColor()),
                        ),
                        Icon(suffixIcon,
                            key: const Key('suffix-icon'),
                            color: getContentColor())
                      ],
                    ),
              )
            : TextButton(
                style: getButtonStyle(),
                onPressed: state == ButtonState.disable ? () {} : handleClick,
                child: customContent ??
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          prefixIcon,
                          key: const Key('prefix-icon'),
                          color: getContentColor(),
                        ),
                        Text(
                          text.toString(),
                          style: kHeading2Medium.copyWith(
                              color: getContentColor()),
                        ),
                        Icon(
                          suffixIcon,
                          key: const Key('suffix-icon'),
                          color: getContentColor(),
                        )
                      ],
                    )));
  }
}
