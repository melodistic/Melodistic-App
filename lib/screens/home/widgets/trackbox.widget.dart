import 'package:flutter/material.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/routes.dart';

class TrackBox extends StatelessWidget {
  const TrackBox({Key? key, required this.track}) : super(key: key);
  final Map<String, String> track;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: const Color(0xFFDFE6EC)),
              borderRadius: const BorderRadius.all(Radius.circular(4))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  SizedBox(
                    height: 180,
                    width: double.infinity,
                    child: Image.network(
                      track['track_image_url']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const <Widget>[
                          Text(
                            'Play',
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
                padding: const EdgeInsets.all(12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        track['track_name']!,
                        style: const TextStyle(
                            fontWeight: kFontWeightBold, fontSize: kFontSizeS),
                      ),
                      kSizedBoxVerticalXS,
                      Text(track['description']!)
                    ]),
              )
            ],
          )),
      onTap: () {
        Navigator.of(context).pushNamed(RoutesName.track,
            arguments: <String, Map<String, String>>{'track': track});
      },
    );
  }
}
