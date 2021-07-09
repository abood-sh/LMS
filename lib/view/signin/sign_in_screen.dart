import 'package:courses_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'background.dart';
import 'body_section.dart';

class SignInScreen extends StatelessWidget {
  final controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Background(
          child: Obx(
            () => ModalProgressHUD(
              inAsyncCall: controller.isLoading.value,
              child: BodySection(),
            ),
          ),
        ),
      ),
    );
  }
}
