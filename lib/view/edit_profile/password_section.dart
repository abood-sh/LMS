import 'package:courses_app/controllers/profile_controller.dart';
import 'package:courses_app/view/widgets/custom_boarded_field.dart';
import 'package:courses_app/view/widgets/medium_text.dart';
import 'package:courses_app/view/widgets/regular_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'profile_button.dart';

class PasswordSection extends StatelessWidget {
  final controller = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        RegularText(
          text: "PASSWORD",
          size: 15.w,
          color: Colors.blueGrey[400],
        ),
        SizedBox(height: 40.h),
        MediumText(
          text: "Current Password",
          size: 14.w,
          color: Colors.blueGrey[600],
        ),
        SizedBox(height: 10.h),
        CustomBoardedField(
          controller: controller.currentPasswordController,
          readOnly: true,
          autoValidate: false,
        ),
        SizedBox(height: 25.h),
        MediumText(
          text: "New Password",
          size: 14.w,
          color: Colors.blueGrey[600],
        ),
        SizedBox(height: 10.h),
        Obx(
          () => CustomBoardedField(
            controller: controller.newPasswordController,
            onChanged: (String newVal) =>
                controller.newPasswordValidator.value = true,
            validator: (String newVal) {
              if (newVal.isEmpty)
                return "Please enter your password";
              else if (newVal.length < 5) return "Too short password";
            },
            autoValidate: controller.newPasswordValidator.value,
          ),
        ),
        SizedBox(height: 25.h),
        MediumText(
          text: "Confirm New Password",
          size: 14.w,
          color: Colors.blueGrey[600],
        ),
        SizedBox(height: 10.h),
        Obx(
          () => CustomBoardedField(
            controller: controller.confirmPasswordController,
            onChanged: (String newVal) =>
                controller.confirmPasswordValidator.value = true,
            validator: (String newVal) {
              if (newVal.isEmpty)
                return "Please enter your password";
              else if (newVal.length < 5) return "Too short password";
            },
            autoValidate: controller.confirmPasswordValidator.value,
          ),
        ),
        SizedBox(height: 40.h),
        Align(
          alignment: Alignment.center,
          child: ProfileButton(
            buttonLabel: "Change password",
            onPressed: () => controller.editProfilePassword(),
          ),
        ),
      ],
    );
  }
}
