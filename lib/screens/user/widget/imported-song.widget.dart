import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/widgets/common/checkbox.widget.dart';

class ImportedSongWidget extends StatelessWidget {
  const ImportedSongWidget(
      {Key? key,
      required this.name,
      required this.time,
      required this.value,
      required this.groupValue,
      required this.onChanged})
      : super(key: key);
  final String? name;
  final String? time;
  final String value;
  final List<String> groupValue;
  final void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kSizeXXS),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          MelodisticCheckBox<String>(
              value: value, groupValue: groupValue, onChanged: onChanged),
          kSizedBoxHorizontalXS,
          Image.asset('assets/images/song.png'),
          kSizedBoxHorizontalS,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                width: 120,
                child: Text(
                  name!,
                  style: kBody3Medium.copyWith(color: kPrimaryColor),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              kSizedBoxVerticalXS,
              Text(time!, style: kBody4.copyWith(color: kGrayScaleColor600))
            ],
          ),
        ],
      ),
    );
  }
}
