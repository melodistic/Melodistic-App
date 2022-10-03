import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:http_parser/http_parser.dart';
import 'package:melodistic/models/track.model.dart';
import 'package:melodistic/routes.dart';
import 'package:melodistic/screens/customize-track/type/Section.type.dart';
import 'package:melodistic/singleton/api_client.dart';
import 'package:melodistic/singleton/user_session.dart';
import 'package:melodistic/widgets/common/type/field.type.dart';
import 'package:melodistic/widgets/common/type/option-item.type.dart';
import 'package:melodistic/widgets/common/type/section.type.dart';

class TrackCustomizeController extends GetxController {
  final GlobalKey<FormState> customizeFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> sectionFormKey = GlobalKey<FormState>();

  final List<OptionItem> muscleGroupList = <OptionItem>[
    OptionItem(id: 1, label: 'Full body', position: 0),
    OptionItem(id: 2, label: 'Core', position: 0),
    OptionItem(id: 3, label: 'Abs', position: 0),
    OptionItem(id: 4, label: 'Arm', position: 50),
    OptionItem(id: 5, label: 'Leg', position: 60)
  ];
  final List<OptionItem> exerciseTypeList = <OptionItem>[
    OptionItem(id: 1, label: 'Warm up', position: 0),
    OptionItem(id: 2, label: 'Exercise', position: 0),
    OptionItem(id: 3, label: 'Cooldown', position: 0),
    OptionItem(id: 4, label: 'Running', position: 50)
  ];
  final List<OptionItem> moodList = <OptionItem>[
    OptionItem(id: 1, label: 'Focus', position: 0),
    OptionItem(id: 2, label: 'Party', position: 0),
    OptionItem(id: 3, label: 'Romance', position: 0),
    OptionItem(id: 4, label: 'Chill', position: 0)
  ];

  late RxList<Section> sectionList;

  late Rx<OptionItem> muscleGroup;
  late Rx<SectionType> sectionType;
  late Rx<OptionItem> sectionExerciseType;
  late Rx<OptionItem> sectionMood;
  late Rx<int> sectionDuration;
  Rxn<String> programName = Rxn<String>();
  Rxn<File> programPicture = Rxn<File>();
  Rxn<String> errorMessage = Rxn<String>();

  RxBool isProcessing = false.obs;

  TrackCustomizeController() {
    muscleGroup = muscleGroupList[0].obs;
    sectionType = SectionType.exerciseSection.obs;
    sectionExerciseType = exerciseTypeList[0].obs;
    sectionMood = moodList[0].obs;
    sectionDuration = 15.obs;
    // mock data
    sectionList = RxList<Section>.empty();
  }

  bool validateProgramPicture() {
    if (programPicture.value == null) {
      errorMessage.value = 'Program Picture is required';
      return false;
    } else {
      errorMessage.value = null;
      return true;
    }
  }

  ValidateFunction validateProgramName = (String? value) {
    if (value == null || value.isEmpty) {
      return 'Program Name is required';
    }
    return null;
  };

  ValidateFunction validateSectionName = (String? value) {
    if (value == null || value.isEmpty) {
      return 'Section Name is required';
    }
    return null;
  };

  Future<void> setProgramName(String newProgramName) async {
    programName.value = newProgramName;
  }

  Future<void> setProgramPicture(File newProgramPicture) async {
    programPicture.value = newProgramPicture;
  }

  void setupNewSection() {
    sectionExerciseType.value = exerciseTypeList[0];
    sectionMood.value = moodList[0];
    sectionDuration.value = 15;
  }

  void setupNewTrack() {
    programName.value = null;
    programPicture.value = null;
    muscleGroup.value = muscleGroupList[0];
  }

  void createNewSection() {
    setupNewSection();
    if (sectionType.value == SectionType.exerciseSection) {
      Get.toNamed<void>(RoutesName.customizeExerciseSection);
    } else if (sectionType.value == SectionType.breakSection) {
      Get.toNamed<void>(RoutesName.customizeBreakSection);
    }
  }

  void selectMuscleGroup(OptionItem tab, ScrollController scrollController) {
    muscleGroup.value = tab;
    scrollController.animateTo(tab.position,
        duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
  }

  void selectNewSectionType(SectionType type) {
    sectionType.value = type;
  }

  void selectExerciseType(OptionItem tab, ScrollController scrollController) {
    sectionExerciseType.value = tab;
    scrollController.animateTo(tab.position,
        duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
  }

  void selectMood(OptionItem tab, ScrollController scrollController) {
    sectionMood.value = tab;
    scrollController.animateTo(tab.position,
        duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
  }

  void setSectionDuration(int duration) {
    sectionDuration.value = duration;
  }

  void addSection(String sectionName) {
    sectionList.add(Section(
        name: sectionName,
        type: sectionType.value,
        exerciseType: sectionExerciseType.value.label,
        mood: sectionMood.value.label,
        duration: sectionDuration.value));
    Get.back<void>();
    Get.back<void>();
  }

  Future<Track?> generateTrack() async {
    isProcessing.value = true;
    final bool hasSession = await UserSession.hasSession();
    if (!hasSession) {
      Get.offAllNamed<void>(RoutesName.onboard);
      return null;
    }
    final String? userToken = await UserSession.getSession();

    final Response<dynamic>? response = await APIClient().post('/track',
        data: <String, dynamic>{
          'program_name': programName.value,
          'muscle_group': muscleGroup.value.label,
          'sections':
              sectionList.map((Section element) => element.toJson()).toList()
        },
        headers: APIClient.getAuthHeaders(userToken!));
    if (response!.data != null) {
      final String trackId = response.data['track_id'] as String;
      await uploadTrackImage(trackId);
      final Response<Map<String, dynamic>>? trackResponse = await APIClient()
          .get('/track/$trackId', headers: APIClient.getAuthHeaders(userToken));
      final Track track = Track.fromJson(trackResponse!.data!);
      isProcessing.value = true;
      return track;
    } else {
      isProcessing.value = false;
      return null;
    }
  }

  Future<bool> uploadTrackImage(String trackId) async {
    final bool hasSession = await UserSession.hasSession();
    if (!hasSession) {
      Get.offAllNamed<void>(RoutesName.onboard);
      return false;
    }
    final String? userToken = await UserSession.getSession();
    final String fileExt = programPicture.value!.path.split('.').last;
    MultipartFile file = await MultipartFile.fromFile(
        programPicture.value!.path,
        filename: 'program_image.$fileExt',
        contentType:
            MediaType.parse('image/${fileExt == 'jpg' ? 'jpeg' : fileExt}'));
    final Response<dynamic>? response = await APIClient().postFormData(
        '/track/$trackId/image',
        data: <String, MultipartFile>{'program_image': file},
        headers: APIClient.getAuthHeaders(userToken!));
    if (response!.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
