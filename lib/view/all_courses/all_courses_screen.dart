import 'package:courses_app/controllers/course_controller.dart';
import 'package:courses_app/view/widgets/custom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'course_item.dart';

class AllCoursesScreen extends StatelessWidget {
  final controller = Get.put(CourseController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(0, 50.h),
          child: CustomBar(
            title: "All courses",
          ),
        ),
        body: controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: () async {
                  await controller.getAllRooms();
                },
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: controller.allRooms.length,
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          itemBuilder: (_, index) => CourseItem(
                            controller.allRooms[index],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
