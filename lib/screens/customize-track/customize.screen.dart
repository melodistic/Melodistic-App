import 'package:flutter/material.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';

class CustomizeScreen extends StatelessWidget {
  const CustomizeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController programController = TextEditingController();
    return ScreenWrapper(
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          'Customize',
          style: TextStyle(fontSize: kFontSizeXL, fontWeight: FontWeight.bold),
        ),
        TextField(
          controller: programController,
          maxLines: 20,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextButton(
              onPressed: () async {
                showDialog<AlertDialog>(
                    context: context,
                    builder: (ctx) => AlertDialog(
                        title: const Text(
                          'Loading',
                          textAlign: TextAlign.center,
                        ),
                        content: Container(
                          height: 100,
                          child: Column(
                            children: const [
                              SizedBox(
                                child: CircularProgressIndicator(),
                                width: 60,
                                height: 60,
                              )
                            ],
                          ),
                        )));
              },
              child: const Text('Generate'))
        ])
      ]),
    ));
  }
}
