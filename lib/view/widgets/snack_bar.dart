import 'package:flutter/material.dart';
import 'package:get/get.dart';

getSnackBar({String content, Color color}) {
  Get.snackbar(
    "",
    content,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: color.withOpacity(0.7),
    colorText: Colors.white,
    borderRadius: 5.0,
    duration: Duration(seconds: 2),
  );
}
