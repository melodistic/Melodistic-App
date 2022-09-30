import 'package:get/get.dart';
import 'package:melodistic/controller/auth.controller.dart';
import 'package:melodistic/controller/forget-password.controller.dart';
import 'package:melodistic/controller/hometab.controller.dart';
import 'package:melodistic/controller/player.controller.dart';
import 'package:melodistic/controller/track-customize.controller.dart';
import 'package:melodistic/controller/track.controller.dart';

class Controller {
  static void setup() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => HomeTabController());
    Get.lazyPut(() => TrackController());
    Get.lazyPut(() => TrackCustomizeController());
    Get.lazyPut(() => PlayerController());
    Get.lazyPut(() => ForgetPasswordController());
  }
}
