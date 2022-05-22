import 'package:flutter/material.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/routes.dart';

class TrackBox extends StatelessWidget {
  const TrackBox({Key? key, required this.track}) : super(key: key);
  final Map track;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Color(0xFFDFE6EC)),
              borderRadius: BorderRadius.all(Radius.circular(4))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  SizedBox(
                    height: 180,
                    width: double.infinity,
                    child: Image.network(
                      track["program_image_url"],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Play",
                            style: TextStyle(color: Colors.white),
                          ),
                          kSizedBoxHorizontalXXS,
                          Icon(
                            Icons.play_circle,
                            color: Colors.white,
                          )
                        ]),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        track["program_name"],
                        style: TextStyle(
                            fontWeight: kFontWeightBold, fontSize: kFontSizeS),
                      ),
                      kSizedBoxVerticalXS,
                      Text(track["description"])
                    ]),
              )
            ],
          )),
      onTap: () {
        Navigator.of(context)
            .pushNamed(RoutesName.track, arguments: {'track': track});
      },
    );
  }
}
