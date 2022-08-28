import 'package:flutter/cupertino.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/screens/onboarding/register/widgets/settime.widget.dart';

class CustomTimePicker extends StatefulWidget {
  const CustomTimePicker({Key? key}) : super(key: key);
  @override
  State<CustomTimePicker> createState() => CustomTimePickerState();
}

class CustomTimePickerState extends State<CustomTimePicker> {
  Duration duration = const Duration(hours: 0, minutes: 0);
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: kSizeXS),
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              color: kGrayScaleColor50,
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    int hour = duration.inHours;
    int minute = duration.inMinutes % 60;
    return CupertinoPageScaffold(
      backgroundColor: kGrayScaleColor200,
      child: DefaultTextStyle(
        style: kBody2,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TimerPickerItem(
                children: <Widget>[
                  CupertinoButton(
                    onPressed: () => _showDialog(
                      CupertinoTimerPicker(
                        mode: CupertinoTimerPickerMode.hm,
                        initialTimerDuration: duration,
                        onTimerDurationChanged: (Duration newDuration) {
                          setState(() => duration = newDuration);
                        },
                      ),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('$hour',
                              style: kBody2.copyWith(color: kPrimaryColor)),
                          Text('  hours',
                              style:
                                  kBody2.copyWith(color: kGrayScaleColor500)),
                          kSizedBoxHorizontalS,
                          Text(':',
                              style:
                                  kBody2.copyWith(color: kGrayScaleColor500)),
                          kSizedBoxHorizontalS,
                          Text('$minute',
                              style: kBody2.copyWith(color: kPrimaryColor)),
                          Text('  mins',
                              style:
                                  kBody2.copyWith(color: kGrayScaleColor500)),
                        ]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
