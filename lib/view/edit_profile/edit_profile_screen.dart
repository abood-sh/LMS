import 'package:courses_app/controllers/profile_controller.dart';
import 'package:courses_app/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'password_section.dart';
import 'user_information_section.dart';

class EditProfileScreen extends StatelessWidget {
  final controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(0, 50.h),
        child: _getAppBar(),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
          child: Column(
            children: [
              UserInformationSection(),
              PasswordSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getAppBar() {
    return CustomBar(
      title: "Edit Profile",
      action: [
        Center(
          child: Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: CustomButton(
              label: "Logout",
              buttonColor: Colors.blue.withOpacity(0.1),
              onPressed: () => controller.logout(),
              labelColor: Colors.blue,
              buttonWidth: 0,
              buttonHeight: 35.h,
            ),
          ),
        ),
      ],
    );
  }
}
