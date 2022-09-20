import 'package:flutter/material.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/screens/customize-track/widgets/selection-section-popup.widget.dart';
import 'package:melodistic/widgets/common/button.widget.dart';
import 'package:melodistic/widgets/common/popup/popup_dialog.widget.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';
import 'package:melodistic/widgets/common/type/button.type.dart';
import 'package:melodistic/widgets/common/type/screen.type.dart';

class CustomizeSectionScreen extends StatelessWidget {
  const CustomizeSectionScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
        screen: MelodisticScreenType.withBack,
        child: Column(
          children: <Widget>[
            ButtonWidget(
                button: ButtonType.softButton,
                prefixIcon: MelodisticIcon.plus,
                text: 'Add section',
                handleClick: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) =>
                          PopupWidget(content: SelectSectionPopup()),
                    ))
          ],
        ));
  }
}
