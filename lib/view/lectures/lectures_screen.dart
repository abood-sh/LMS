import 'package:courses_app/controllers/course_controller.dart';
import 'package:courses_app/view/widgets/medium_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'lecture_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LecturesScreen extends StatelessWidget {
  final controller = Get.find<CourseController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar,
      body: Obx(
        () => (controller.isLoading.value ||
                !controller.lectures.keys.contains(Get.arguments[1]))
            ? Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: () => controller.getLecturesRoom(
                    Get.arguments[0], Get.arguments[1]),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.w,
                  mainAxisSpacing: 8.h,
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  children: List.generate(
                    controller.lectures[Get.arguments[1]].length,
                    (index) => LectureItem(
                      controller.lectures[Get.arguments[1]][index],
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  final Widget _getAppBar = AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Align(
      alignment: Alignment(-1.15, 0),
      child: MediumText(
        text: Get.arguments[1],
      ),
    ),
    leading: IconButton(
      icon: Icon(Icons.arrow_back_outlined, color: Colors.black),
      onPressed: () => Get.back(),
    ),
  );
}
