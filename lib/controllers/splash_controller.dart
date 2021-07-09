import 'dart:async';
import 'package:courses_app/config/app_constants.dart';
import 'package:courses_app/config/routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(
      Duration(seconds: 2),
      () {
        if (box.read("isLogged") == true)
          Get.offAndToNamed(Routes.root);
        else
          Get.offAndToNamed(Routes.onBoarding);
      },
    );
    super.onInit();
  }
}
