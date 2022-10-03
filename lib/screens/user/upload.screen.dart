import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/widgets/common/appbar/main.widget.dart';
import 'package:melodistic/widgets/common/button.widget.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';
import 'package:melodistic/widgets/common/type/button.type.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
        customAppbar: const MainAppbar(title: 'Upload'),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(
                kSizeL * 1.25, kSizeS, kSizeL * 1.25, kSizeM),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/audio-wave.png'),
                kSizedBoxVerticalS,
                Text(
                  'import media from the Files app and select them here to add to your upload or enter a youtube link',
                  style: kBody3.copyWith(color: kGrayScaleColor600),
                  textAlign: TextAlign.center,
                ),
                kSizedBoxVerticalS,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kSizeS),
                  child: Column(
                    children: <Widget>[
                      const ButtonWidget(
                          text: 'Import from files', size: ButtonSize.small),
                      kSizedBoxVerticalXXS,
                      ButtonWidget(
                          button: ButtonType.outlineButton,
                          customContent: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: kSizeXS),
                              child: Text('Import from youtube link',
                                  style: kBody3Medium.copyWith(
                                      color: kPrimaryColor))),
                          size: ButtonSize.small)
                    ],
                  ),
                )
              ],
            )));
  }
}
