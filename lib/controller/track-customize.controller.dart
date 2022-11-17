import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:http_parser/http_parser.dart';
import 'package:melodistic/controller/track.controller.dart';
import 'package:melodistic/models/track.model.dart';
import 'package:melodistic/routes.dart';
import 'package:melodistic/screens/customize-track/type/CustomizeMode.enum.dart';
import 'package:melodistic/screens/customize-track/type/RemovedSection.type.dart';
import 'package:melodistic/screens/customize-track/type/Section.type.dart';
import 'package:melodistic/screens/customize-track/type/CustomizeStatus.enum.dart';
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
    OptionItem(id: 4, label: 'Arm', position: 5),
    OptionItem(id: 5, label: 'Leg', position: 5)
  ];
  final List<OptionItem> exerciseTypeList = <OptionItem>[
    OptionItem(id: 1, label: 'Warm up', position: 0),
    OptionItem(id: 2, label: 'Exercise', position: 0),
    OptionItem(id: 3, label: 'Cooldown', position: 0)
  ];
  final List<OptionItem> moodList = <OptionItem>[
    OptionItem(id: 1, label: 'Chill', position: 0),
    OptionItem(id: 2, label: 'Focus', position: 0),
    OptionItem(id: 3, label: 'Party', position: 0),
    OptionItem(id: 4, label: 'Romance', position: 0)
  ];

  late RxList<Section> sectionList;

  late Rx<CustomizeMode> customizeMode;
  late Rx<int> editIndex;

  late Rx<OptionItem> muscleGroup;
  late Rx<SectionType> sectionType;
  late Rx<OptionItem> sectionExerciseType;
  late Rx<OptionItem> sectionMood;
  late Rx<int> sectionDuration;
  late RxList<String> sectionIncludedSong;
  late Rx<CreateTrackStatus> createTrackStatus;

  Rxn<String> programName = Rxn<String>();
  Rxn<File> programPicture = Rxn<File>();
  Rxn<String> errorMessage = Rxn<String>();
  RxList<String> selectedSong = RxList<String>();

  RxBool isProcessing = false.obs;

  TrackCustomizeController() {
    customizeMode = CustomizeMode.add.obs;
    muscleGroup = muscleGroupList[0].obs;
    sectionType = SectionType.exerciseSection.obs;
    sectionExerciseType = exerciseTypeList[0].obs;
    sectionMood = moodList[0].obs;
    sectionDuration = 15.obs;
    sectionIncludedSong = RxList<String>.empty();
    sectionList = RxList<Section>.empty();
    editIndex = (-1).obs;
    createTrackStatus = CreateTrackStatus.disable.obs;
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
    sectionIncludedSong.value = <String>[];
    customizeMode.value = CustomizeMode.add;
  }

  void setupNewTrack() {
    programName.value = null;
    programPicture.value = null;
    muscleGroup.value = muscleGroupList[0];
    sectionList.value = <Section>[];
  }

  void createNewSection() {
    setupNewSection();
    Get.toNamed<void>(RoutesName.customizeSectionDetail);
  }

  void editSection(Section section) {
    sectionType.value = section.type;
    editIndex.value = sectionList.indexOf(section);
    sectionExerciseType.value = exerciseTypeList.firstWhere(
        (OptionItem element) => element.label == section.exerciseType);
    sectionMood.value = moodList
        .firstWhere((OptionItem element) => element.label == section.mood);
    sectionDuration.value = section.duration;
    sectionIncludedSong.value = section.includedMusicId;
    customizeMode.value = CustomizeMode.edit;
    Get.toNamed<void>(RoutesName.customizeSectionDetail);
  }

  void selectMuscleGroup(OptionItem tab, ScrollController scrollController) {
    muscleGroup.value = tab;
    scrollController.animateTo(tab.position,
        duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
  }

  void selectNewSectionType(SectionType type) {
    sectionType.value = type;
    createNewSection();
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
    sectionIncludedSong.value = <String>[];
  }

  void setSectionDuration(int duration) {
    sectionDuration.value = duration;
  }

  Future<void> initializeSelectedSongFromSectionIncludedSong() async {
    await Future<void>.delayed(Duration.zero);
    selectedSong.value = sectionIncludedSong.toList();
  }

  void setSectionIncludedSong() {
    sectionIncludedSong.value = selectedSong.toList();
    selectedSong.value = <String>[];
  }

  void addSection(String sectionName) {
    sectionList.add(Section(
        name: sectionName,
        type: sectionType.value,
        exerciseType: sectionExerciseType.value.label,
        mood: sectionMood.value.label,
        duration: sectionDuration.value,
        includedMusicId: selectedSong));
    updateStatusDuration();
    Get.back<void>();
    Get.back<void>();
  }

  void updateSection(String sectionName) {
    sectionList[editIndex.value] = Section(
        name: sectionName,
        type: sectionType.value,
        exerciseType: sectionExerciseType.value.label,
        mood: sectionMood.value.label,
        duration: sectionDuration.value,
        includedMusicId: selectedSong);
    updateStatusDuration();
    Get.back<void>();
    Get.back<void>();
  }

  RemovedSection removeSection(Section section) {
    int index = sectionList.indexOf(section);
    Section removedSection = sectionList.removeAt(index);
    updateStatusDuration();
    return RemovedSection(section: removedSection, index: index);
  }

  void undoSection(RemovedSection removedSection) {
    sectionList.insert(removedSection.index, removedSection.section);
    updateStatusDuration();
  }

  CreateSectionStatus verifyCreateSection(
      int latestDuration, CustomizeMode mode, int editedIndex) {
    if (mode == CustomizeMode.edit) {
      if (latestDuration == 0) {
        return CreateSectionStatus.minimum;
      }
      if (sectionList.isNotEmpty) {
        int duration = sectionList
                .map((Section section) =>
                    sectionList.indexOf(section) == editedIndex
                        ? 0
                        : section.duration)
                .reduce((int prev, int cur) => prev + cur) +
            latestDuration;
        if (duration > 60) {
          return CreateSectionStatus.exceed;
        }
      }
      return CreateSectionStatus.normal;
    }
    if (latestDuration == 0) {
      return CreateSectionStatus.minimum;
    }
    if (sectionList.isNotEmpty) {
      int duration = sectionList
              .map((Section section) => section.duration)
              .reduce((int prev, int cur) => prev + cur) +
          latestDuration;
      if (duration > 60) {
        return CreateSectionStatus.exceed;
      }
    }
    return CreateSectionStatus.normal;
  }

  void updateStatusDuration() {
    if (sectionList.isEmpty) {
      createTrackStatus.value = CreateTrackStatus.disable;
    } else {
      createTrackStatus.value = CreateTrackStatus.normal;
    }
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
      final TrackController trackController = Get.find();
      final Track track = await trackController.getTrackInformation(trackId);
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
