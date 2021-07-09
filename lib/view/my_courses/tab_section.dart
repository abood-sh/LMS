import 'package:courses_app/controllers/course_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TabSection extends StatelessWidget {
  final controller = Get.find<CourseController>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: TabBar(
        unselectedLabelColor: Colors.black,
        labelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 15.w,
          color: Colors.white,
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15.w,
          color: Colors.black,
        ),
        tabs: [
          Tab(
            text: 'Acceptable',
          ),
          Tab(
            text: 'Not Acceptable',
          ),
        ],
        controller: controller.tabController,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.blue,
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        isScrollable: true,
        labelPadding: EdgeInsets.symmetric(horizontal: 30.w),
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}
