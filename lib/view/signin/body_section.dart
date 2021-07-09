import 'package:courses_app/config/app_constants.dart';
import 'package:courses_app/controllers/auth_controller.dart';
import 'package:courses_app/view/widgets/bold_text.dart';
import 'package:courses_app/view/widgets/custom_unboarded_field.dart';
import 'package:courses_app/view/widgets/regular_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BodySection extends StatelessWidget {
  final controller = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: BoldText(
                text: "LOGIN",
                size: 36.w,
                color: Color(0xFF2661FA),
              ),
            ),
            SizedBox(height: 20.h),
            Obx(
              () => CustomUnBoardedFailed(
                hint: "Email",
                controller: controller.emailController,
                onChanged: (String newVal) =>
                    controller.emailValidator.value = true,
                validator: (String newVal) {
                  if (newVal.isEmpty)
                    return "Please enter your email";
                  else if (!newVal.isEmail) return "Invalid email";
                },
                autoValidate: controller.emailValidator.value,
              ),
            ),
            SizedBox(height: 20.h),
            Obx(
              () => CustomUnBoardedFailed(
                hint: "Password",
                controller: controller.passwordController,
                onChanged: (String newVal) =>
                    controller.passwordValidator.value = true,
                validator: (String newVal) {
                  if (newVal.isEmpty)
                    return "Please enter your password";
                  else if (newVal.length < 5) return "Too short password";
                },
                autoValidate: controller.passwordValidator.value,
                obscureText: true,
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Obx(
                  () => Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: Color(0xFF2661FA),
                    ),
                    child: Transform.scale(
                      scale: 0.9,
                      child: Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (bool newVal) {
                          controller.rememberMe.value = newVal;
                          if (newVal) box.write("isLogged", true);
                        },
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                  ),
                ),
                RegularText(
                  text: "Remember me",
                  size: 13.w,
                  color: Color(0xFF2661FA),
                ),
              ],
            ),
            SizedBox(height: 50.h),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                alignment: Alignment.centerRight,
                child: RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) controller.signIn();
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.h,
                    width: 160.w,
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(80.0),
                        gradient: new LinearGradient(colors: [
                          Color.fromARGB(255, 255, 136, 34),
                          Color.fromARGB(255, 255, 177, 41)
                        ])),
                    padding: const EdgeInsets.all(0),
                    child: Text(
                      "LOGIN",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
