import 'package:courses_app/controllers/course_controller.dart';
import 'package:courses_app/models/room_model.dart';
import 'package:courses_app/utils/date_formatter.dart';
import 'package:courses_app/view/widgets/custom_button.dart';
import 'package:courses_app/view/widgets/medium_text.dart';
import 'package:courses_app/view/widgets/regular_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CourseItem extends StatelessWidget {
  final CourseModel course;
  CourseItem(this.course);
  final controller = Get.find<CourseController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.w),
      child: Card(
        elevation: 2,
        margin: EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: BorderSide(color: Colors.grey[200], width: 0.5),
        ),
        shadowColor: Colors.grey.withOpacity(0.1),
        child: InkWell(
          onTap: null,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 15.h,
            ),
            child: Row(
              children: [
                Container(
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: 45.h,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MediumText(
                      text: course.name,
                      size: 14.w,
                    ),
                    SizedBox(height: 5.h),
                    RegularText(
                      text: DateFormatter()
                          .getCourseDate(DateTime.parse(course.updatedAt)),
                      size: 13.w,
                      color: Colors.grey,
                    ),
                  ],
                ),
                Spacer(),
                CustomButton(
                  label: "register",
                  onPressed: () => controller.registerUserRoom(
                    roomId: course.id,
                    stuId: controller.userId.value,
                    profId: course.professorId,
                    model: course,
                  ),
                  buttonHeight: 30.h,
                  buttonWidth: 50.w,
                  labelSize: 13.w,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
