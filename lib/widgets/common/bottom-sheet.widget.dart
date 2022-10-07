import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/widgets/common/button.widget.dart';
import 'package:melodistic/widgets/common/type/button.type.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget(
      {Key? key,
      required this.title,
      required this.description,
      required this.firstIcon,
      required this.secondIcon,
      required this.firstButtonTitle,
      required this.secondButtonTitle,
      required this.firstHandleClick,
      required this.secondHandleClick})
      : super(key: key);
  final String? title;
  final String? description;
  final IconData? firstIcon;
  final IconData? secondIcon;
  final String? firstButtonTitle;
  final String? secondButtonTitle;
  final VoidCallback? firstHandleClick;
  final VoidCallback? secondHandleClick;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(
            kSizeS * 1.5, kSizeM * 1.125, kSizeS * 1.5, kSizeM * 1.125),
        height: kSizeXXL * 1.4,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('$title', style: kHeading2),
              Text('$description',
                  style: kBody2.copyWith(color: kGrayScaleColor600)),
              kSizedBoxVerticalXS,
              const Divider(
                thickness: 1,
                color: kGrayScaleColor200,
              ),
              kSizedBoxVerticalXS,
              Column(
                children: <Widget>[
                  ButtonWidget(
                    handleClick: firstHandleClick,
                    button: ButtonType.textButton,
                    customContent: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: kGrayScaleColor200,
                          child: IconButton(
                            icon: Icon(firstIcon, color: kPrimaryColor),
                            onPressed: () {},
                          ),
                        ),
                        kSizedBoxHorizontalS,
                        Text('$firstButtonTitle',
                            style: kBody2.copyWith(color: kPrimaryColor))
                      ],
                    ),
                  ),
                  ButtonWidget(
                    handleClick: secondHandleClick,
                    button: ButtonType.textButton,
                    customContent: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: kGrayScaleColor200,
                          child: IconButton(
                            icon: Icon(secondIcon, color: kPrimaryColor),
                            onPressed: () {},
                          ),
                        ),
                        kSizedBoxHorizontalS,
                        Text('$secondButtonTitle',
                            style: kBody2.copyWith(color: kPrimaryColor))
                      ],
                    ),
                  )
                ],
              )
            ]));
  }
}
