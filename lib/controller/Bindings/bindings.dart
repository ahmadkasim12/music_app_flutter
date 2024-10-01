import 'package:get/get.dart';
import 'package:ui_slicing_assignment/Controller/NavBarController.dart';
import 'package:ui_slicing_assignment/controller/TrackController.dart';

class myBindings extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => NavBarController());
    Get.lazyPut(() => TrackController());
  }
}