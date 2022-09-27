import 'package:flutter/cupertino.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/screens/onboarding/register/widgets/settime.widget.dart';

class CustomTimePicker extends StatelessWidget {
  const CustomTimePicker(
      {Key? key, required this.onChanged, required this.duration})
      : super(key: key);
  final Function onChanged;
  final Duration duration;
  void _showDialog(BuildContext context, Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: kSizeXS),
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              color: kGrayScaleColorWhite,
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
                      context,
                      CupertinoTimerPicker(
                        mode: CupertinoTimerPickerMode.hm,
                        initialTimerDuration: duration,
                        onTimerDurationChanged: (Duration newDuration) {
                          onChanged(newDuration);
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
