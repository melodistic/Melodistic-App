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
  SizedBox? buttonRender() {
    return SizedBox(
        width: width,
        height: height,
        child: button == ButtonType.mainButton
            ? TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: state == ButtonState.disable
                        ? kGrayScaleColor200
                        : kPrimaryColor),
                onPressed: state == ButtonState.disable ? () {} : handleClick,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(
                      prefixIcon,
                      key: const Key('prefix-icon'),
                      color: state == ButtonState.disable
                          ? kGrayScaleColor500
                          : kGrayScaleColor50,
                    ),
                    Text(
                      text.toString(),
                      style: TextStyle(
                          color: state == ButtonState.disable
                              ? kGrayScaleColor500
                              : kGrayScaleColor50),
                    ),
                    Icon(
                      suffixIcon,
                      key: const Key('suffix-icon'),
                      color: state == ButtonState.disable
                          ? kGrayScaleColor500
                          : kGrayScaleColor50,
                    )
                  ],
                ))
            : button == ButtonType.softButton
                ? TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: state == ButtonState.normal
                            ? kGrayScaleColor100
                            : kGrayScaleColor200),
                    onPressed:
                        state == ButtonState.disable ? () {} : handleClick,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(prefixIcon,
                            key: const Key('prefix-icon-2'),
                            color: state == ButtonState.disable
                                ? kGrayScaleColor500
                                : kPrimaryColor),
                        Text(text.toString(),
                            style: TextStyle(
                                color: state == ButtonState.disable
                                    ? kGrayScaleColor500
                                    : kPrimaryColor)),
                        Icon(suffixIcon,
                            key: const Key('suffix-icon-2'),
                            color: state == ButtonState.disable
                                ? kGrayScaleColor500
                                : kPrimaryColor)
                      ],
                    ))
                : button == ButtonType.outlineButton
                    ? OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(
                                color: state == ButtonState.active
                                    ? kSecondaryColor
                                    : state == ButtonState.normal
                                        ? kGrayScaleColor900
                                        : kGrayScaleColor200)),
                        onPressed:
                            state == ButtonState.disable ? () {} : handleClick,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(prefixIcon,
                                key: const Key('prefix-icon-3'),
                                color: state == ButtonState.active
                                    ? kSecondaryColor
                                    : state == ButtonState.normal
                                        ? kGrayScaleColor900
                                        : kGrayScaleColor500),
                            Text(
                              text.toString(),
                              style: TextStyle(
                                  color: state == ButtonState.active
                                      ? kSecondaryColor
                                      : state == ButtonState.normal
                                          ? kGrayScaleColor900
                                          : kGrayScaleColor500),
                            ),
                            Icon(suffixIcon,
                                key: const Key('suffix-icon-3'),
                                color: state == ButtonState.active
                                    ? kSecondaryColor
                                    : state == ButtonState.normal
                                        ? kGrayScaleColor900
                                        : kGrayScaleColor500)
                          ],
                        ),
                      )
                    : TextButton(
                        onPressed:
                            state == ButtonState.disable ? () {} : handleClick,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(prefixIcon,
                                key: const Key('prefix-icon-4'),
                                color: state == ButtonState.disable
                                    ? kGrayScaleColor500
                                    : kPrimaryColor),
                            Text(text.toString(),
                                style: TextStyle(
                                    color: state == ButtonState.disable
                                        ? kGrayScaleColor500
                                        : kPrimaryColor)),
                            Icon(suffixIcon,
                                key: const Key('suffix-icon-4'),
                                color: state == ButtonState.disable
                                    ? kGrayScaleColor500
                                    : kPrimaryColor)
                          ],
                        )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: buttonRender());
  }
}
