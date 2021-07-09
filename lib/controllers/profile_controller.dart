import 'dart:convert';
import 'package:courses_app/config/app_constants.dart';
import 'package:courses_app/config/routes.dart';
import 'package:courses_app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  // user information fields
  TextEditingController nameController;
  TextEditingController emailController;
  // password field
  TextEditingController currentPasswordController;
  TextEditingController newPasswordController=TextEditingController();
  TextEditingController confirmPasswordController=TextEditingController();
  // fields validators
  RxBool nameValidator = false.obs;
  RxBool emailValidator = false.obs;
  RxBool currentPasswordValidator = false.obs;
  RxBool newPasswordValidator = false.obs;
  RxBool confirmPasswordValidator = false.obs;
  // user object
  UserModel user = UserModel();
  // loading when user update his profile
  RxBool isLoading1 = false.obs;
  RxBool isLoading2 = false.obs;

  void logout() {
    Get.offAllNamed(Routes.signIn);
    box.write("isLogged", false);
  }

  insertUserAndFieldsData() {
    user = UserModel.fromMap(json.decode(box.read("user")));
    nameController = TextEditingController(text: user.userName);
    emailController = TextEditingController(text: user.userEmail);
    currentPasswordController = TextEditingController(text: user.userPassword);
  }

  Future<void> editProfile() async {
    isLoading1.value = true;
    var url = Uri.parse(getEditProfileAPI(
      box.read("userId"),
      nameController.text,
      emailController.text,
    ));
    var response = await http.get(url);
    if (response.statusCode == 200) {
      isLoading1.value = false;
      user.userName = nameController.text;
      user.userEmail = emailController.text;
      box.write("user", json.encode(user.toJson()));
    }
  }

  Future<void> editProfilePassword() async {
    isLoading2.value = true;
    var url = Uri.parse(getEditProfilePasswordAPI(
      box.read("userId"),
      newPasswordController.text,
    ));
    var response = await http.get(url);
    if (response.statusCode == 200) {
      isLoading2.value = false;
      user.userPassword = newPasswordController.text;
      box.write("user", json.encode(user.toJson()));
    }
  }

  @override
  void onInit() {
    insertUserAndFieldsData();
    super.onInit();
  }
}
