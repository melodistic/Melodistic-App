import 'package:get/get.dart';
import 'package:melodistic/controller/hometab.controller.dart';
import 'package:melodistic/controller/track.controller.dart';

class Controller {
  static void setup() {
    Get.lazyPut(() => HomeTabController());
    Get.lazyPut(() => TrackController());
  }
}
