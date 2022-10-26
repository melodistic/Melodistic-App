import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/controller/processed-music.controller.dart';
import 'package:melodistic/screens/user/widget/confirm-upload-popup.widget.dart';
import 'package:melodistic/singleton/alert.dart';
import 'package:melodistic/utils/validate.dart';
import 'package:melodistic/widgets/common/button.widget.dart';
import 'package:melodistic/widgets/common/textfield.widget.dart';
import 'package:melodistic/widgets/common/type/button.type.dart';
import 'package:melodistic/widgets/common/type/field.type.dart';
import 'package:any_link_preview/any_link_preview.dart';

class ImportLinkPopup extends StatelessWidget {
  ImportLinkPopup({Key? key}) : super(key: key);
  final TextEditingController _linkController = TextEditingController();
  final ProcessedMusicController processedMusicController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextFieldWidget(
          controller: _linkController,
          hintTitle: 'URL',
          fieldType: FieldType.text,
        ),
        kSizedBoxVerticalS,
        ButtonWidget(
          button: ButtonType.mainButton,
          text: 'Upload',
          handleClick: () async {
            String url = _linkController.text;
            if (!validateYoutubeLink(url)) {
              return;
            }
            Metadata? _metadata = await AnyLinkPreview.getMetadata(link: url);
            if (_metadata == null) {
              return;
            }
            Get.back<void>();
            Alert.showAlert(ConfirmUploadPopup(
              source: 'Youtube',
              metadata: _metadata,
              handleClick: () async {
                final bool success = await processedMusicController
                    .processedYoutubeLink(_metadata.url!);
                if (success) {
                  Get.back<void>();
                  processedMusicController.fetchProcessedMusic();
                }
              },
            ));
          },
        )
      ],
    );
  }
}
