import 'package:courses_app/config/routes.dart';
import 'package:courses_app/models/lecture_model.dart';
import 'package:courses_app/utils/date_formatter.dart';
import 'package:courses_app/view/widgets/medium_text.dart';
import 'package:courses_app/view/widgets/regular_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LectureItem extends StatelessWidget {
  final LectureModel lecture;
  LectureItem(this.lecture);
  @override
  Widget build(BuildContext context) {
    print("link: ${lecture.data}");
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(0.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: BorderSide(color: Colors.grey[200], width: 0.5)),
      shadowColor: Colors.grey.withOpacity(0.1),
      child: InkWell(
        onTap: () => Get.toNamed(
          Routes.lectureData,
          arguments: [lecture.name, lecture.data],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),
              Image(
                image: AssetImage("assets/images/logo.png"),
                height: 80.h,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10.h),
              MediumText(
                text: lecture.name,
                size: 14.w,
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RegularText(
                    text: DateFormatter()
                        .getCourseDate(DateTime.parse(lecture.updatedAt)),
                    size: 13.w,
                    color: Colors.grey,
                  ),
                  RegularText(
                    text: DateFormatter()
                        .geTime(DateTime.parse(lecture.updatedAt)),
                    size: 13.w,
                    color: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
