import 'package:courses_app/controllers/profile_controller.dart';
import 'package:courses_app/view/widgets/bold_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileButton extends StatelessWidget {
  final String buttonLabel;
  final Function onPressed;
  ProfileButton({this.buttonLabel, this.onPressed});
  final controller = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: Get.width,
      height: 45.h,
      color: Colors.blue,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3.0),
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BoldText(
              text: buttonLabel,
              color: Colors.white,
              size: 13.w,
            ),
            buttonLabel == "Save"
                ? (controller.isLoading1.value
                    ? Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: SpinKitFadingCircle(
                            color: Colors.white, size: 25.w),
                      )
                    : Text(''))
                : (controller.isLoading2.value
                    ? Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: SpinKitFadingCircle(
                            color: Colors.white, size: 25.w),
                      )
                    : Text('')),
          ],
        ),
      ),
    );
  }
}
