import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/widgets/common/checkbox.widget.dart';
import 'package:melodistic/widgets/common/divider.widget.dart';

class ImportedSongWidget extends StatelessWidget {
  const ImportedSongWidget(
      {Key? key,
      required this.name,
      required this.artist,
      required this.time,
      required this.value,
      required this.groupValue,
      required this.onChanged})
      : super(key: key);
  final String? name;
  final String? artist;
  final String? time;
  final dynamic value;
  final List<dynamic> groupValue;
  final void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              MelodisticCheckBox(
                  value: value,
                  groupValue: groupValue,
                  onChanged: onChanged),
              kSizedBoxHorizontalXS,
              Image.asset('assets/images/song.png'),
              kSizedBoxHorizontalS,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(name!, style: kBody4.copyWith(color: kPrimaryColor)),
                  kSizedBoxVerticalXS,
                  Text(time!,
                      style: kBody4.copyWith(color: kGrayScaleColor600))
                ],
              ),
            ],
          ),
          kSizedBoxVerticalXXS,
          const MelodisticDivider()
        ],
      ),
    );
  }
}
