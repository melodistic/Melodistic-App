import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/controller/auth.controller.dart';
import 'package:melodistic/controller/processed-music.controller.dart';
import 'package:melodistic/models/processed-music.model.dart';
import 'package:melodistic/screens/user/widget/import-link-popup.widget.dart';
import 'package:melodistic/screens/user/widget/import-song-bottomsheet.widget.dart';
import 'package:melodistic/screens/user/widget/uploaded-song.widget.dart';
import 'package:melodistic/singleton/alert.dart';
import 'package:melodistic/utils/display.dart';
import 'package:melodistic/widgets/common/appbar/main-action.widget.dart';
import 'package:melodistic/widgets/common/button.widget.dart';
import 'package:melodistic/widgets/common/divider.widget.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';
import 'package:melodistic/widgets/common/type/button.type.dart';

class UploadScreen extends StatelessWidget {
  UploadScreen({Key? key}) : super(key: key);
  // final List<Map<String, String>> uploadedSong = <Map<String, String>>[];
  final List<Map<String, String>> uploadedSong = <Map<String, String>>[
    <String, String>{
      'name': 'how you like that',
      'artist': 'black pink',
      'time': '2.03'
    },
    <String, String>{
      'name': 'not a home',
      'artist': 'pardyalone',
      'time': '3.23'
    },
  ];
  final bool isVerified = true;
  final ProcessedMusicController musicController = Get.find();
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    musicController.fetchProcessedMusic();
    return ScreenWrapper(
        customAppbar: MainActionAppbar(
          title: 'Upload',
          action: GestureDetector(
              child: const Icon(MelodisticIcon.folder_add,
                  color: kGrayScaleColorBlack),
              onTap: () {
                showMelodisticBottomSheet(context, ImportSongBottomSheet());
              }),
        ),
        child: Obx(() => authController.userInfo.value!.isEmailVerified
            ? (musicController.processedMusic.isEmpty
                ? Padding(
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
                          padding:
                              const EdgeInsets.symmetric(horizontal: kSizeS),
                          child: Column(
                            children: <Widget>[
                              const ButtonWidget(
                                  text: 'Import from files',
                                  size: ButtonSize.small),
                              kSizedBoxVerticalXXS,
                              ButtonWidget(
                                  handleClick: () {
                                    Alert.showAlert(ImportLinkPopup());
                                  },
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
                    ))
                : Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kSizeS * 1.25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                            '${musicController.processedMusic.length} track${musicController.processedMusic.length > 1 ? 's' : ''}',
                            style: kBody3Medium),
                        kSizedBoxVerticalXS,
                        Expanded(
                            child: RefreshIndicator(
                          color: kPrimaryColor,
                          backgroundColor: kGrayScaleColorWhite,
                          onRefresh: musicController.fetchProcessedMusic,
                          child: ListView.separated(
                              itemCount: musicController.processedMusic.length,
                              itemBuilder: (BuildContext context, int index) {
                                ProcessedMusic processedMusic =
                                    musicController.processedMusic[index];
                                return UploadedSongWidget(
                                  processedMusic: processedMusic,
                                );
                              },
                              separatorBuilder:
                                  ((BuildContext context, int index) =>
                                      const MelodisticDivider())),
                        ))
                      ],
                    ),
                  ))
            : Padding(
                padding:
                    const EdgeInsets.fromLTRB(kSizeM, kSizeS, kSizeM, kSizeM),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/images/email.png'),
                    kSizedBoxVerticalM,
                    Text(
                      'Please verify your email address before uploading your favorite song to the system. ',
                      style: kBody3.copyWith(color: kGrayScaleColor600),
                      textAlign: TextAlign.center,
                    ),
                    kSizedBoxVerticalS,
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: kSizeL * 1.25),
                      child: ButtonWidget(
                          customContent: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: kSizeXS),
                              child: Text('Verify email',
                                  style: kBody3Medium.copyWith(
                                      color: kGrayScaleColorWhite))),
                          size: ButtonSize.small),
                    ),
                  ],
                ))));
  }
}
