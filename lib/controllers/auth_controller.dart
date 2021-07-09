import 'dart:convert';
import 'package:courses_app/config/app_constants.dart';
import 'package:courses_app/config/routes.dart';
import 'package:courses_app/models/user_model.dart';
import 'package:courses_app/view/widgets/snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  // fields controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // fields validators
  RxBool emailValidator = false.obs;
  RxBool passwordValidator = false.obs;

  // loading when we pressed signIn/signUp/signOut/
  RxBool isLoading = false.obs;

  // remember me button
  RxBool rememberMe = false.obs;
  saveToStorage() {
    final box = GetStorage();
    box.write("rememberMe", rememberMe.value);
  }

  Future<void> signIn() async {
    isLoading.value = true;
    try {
      var url = Uri.parse(
        loginAPI(emailController.text, passwordController.text),
      );
      var response = await http.get(
        url,
        headers: {'content-type': 'application/json'},
      );
      var responseBody = json.decode(response.body);
      print("responseBody : $responseBody");
      if (responseBody["state"] == '200') {
        isLoading.value = false;
        UserModel user = UserModel(
          userId: responseBody['user'][0]['id'],
          userName: responseBody['user'][0]['name'],
          userEmail: emailController.text,
          userPassword: passwordController.text,
        );
        box.write("user", json.encode(user.toJson()));
        box.write("userId", responseBody['user'][0]['id']);
        Get.offAndToNamed(Routes.root);
      } else
        throw Exception(responseBody['message']);
    } catch (e) {
      print("error is: ${e.toString()}");
      if (e.toString().contains("Failed host lookup"))
        getSnackBar(content: "No internet connection.", color: Colors.black);
      else if (e.toString().contains("Your mail error") ||
          e.toString().contains("Your password is wrong"))
        getSnackBar(content: "Invalid user account", color: Colors.black);
    } finally {
      isLoading.value = false;
    }
  }

  clearAuthData() {
    passwordController.clear();
    emailController.clear();
    emailValidator.value = false;
    passwordValidator.value = false;
  }
}
