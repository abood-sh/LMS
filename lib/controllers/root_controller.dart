import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootController extends GetxController {
  RxInt pageIndex = 0.obs;
  PageController pageController;

  @override
  void onInit() {
    pageController = PageController(initialPage: 0, keepPage: true);
    super.onInit();
  }
}
