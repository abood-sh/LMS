import 'package:courses_app/controllers/profile_controller.dart';
import 'package:courses_app/view/widgets/custom_boarded_field.dart';
import 'package:courses_app/view/widgets/medium_text.dart';
import 'package:courses_app/view/widgets/regular_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'profile_button.dart';

class UserInformationSection extends StatelessWidget {
  final controller = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RegularText(
          text: "USER INFORMATION",
          size: 15.w,
          color: Colors.blueGrey[400],
        ),
        SizedBox(height: 40.h),
        MediumText(
          text: "Name",
          size: 14.w,
          color: Colors.blueGrey[600],
        ),
        SizedBox(height: 10.h),
        Obx(
          () => CustomBoardedField(
            controller: controller.nameController,
            onChanged: (String newVal) => controller.nameValidator.value = true,
            validator: (String newVal) {
              if (newVal.isEmpty) return "Please enter your name";
            },
            autoValidate: controller.nameValidator.value,
            prefix: null,
          ),
        ),
        SizedBox(height: 25.h),
        MediumText(
          text: "Email",
          size: 15.w,
          color: Colors.blueGrey[600],
        ),
        SizedBox(height: 10.h),
        Obx(
          () => CustomBoardedField(
            controller: controller.emailController,
            onChanged: (String newVal) =>
                controller.emailValidator.value = true,
            validator: (String newVal) {
              if (newVal.isEmpty)
                return "Please enter your email";
              else if (!newVal.isEmail) return "Too short password";
            },
            autoValidate: controller.emailValidator.value,
            prefix: null,
          ),
        ),
        SizedBox(height: 40.h),
        Align(
          alignment: Alignment.center,
          child: ProfileButton(
            buttonLabel: "Save",
            onPressed: () => controller.editProfile(),
          ),
        ),
      ],
    );
  }
}
