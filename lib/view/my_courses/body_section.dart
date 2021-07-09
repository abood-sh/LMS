import 'package:courses_app/config/app_constants.dart';
import 'package:courses_app/controllers/course_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'course_item.dart';

class BodySection extends StatelessWidget {
  final controller = Get.find<CourseController>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: controller.tabController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Obx(
            () => RefreshIndicator(
              onRefresh: () async {
                await controller.getMyCoursesRooms(
                  getAcceptableRoomAPI(controller.userId.value),
                  acceptable: true,
                );
              },
              child: controller.acceptableRooms.isEmpty
                  ? ListView.builder(
                      itemCount: 1,
                      padding: EdgeInsets.only(top: Get.height / 3),
                      itemBuilder: (_, index) =>
                          Center(child: Text("No Rooms Found!")),
                    )
                  : ListView.builder(
                      itemCount: controller.acceptableRooms.length,
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      itemBuilder: (_, index) => CourseItem(
                        index + 1,
                        controller.acceptableRooms[index],
                        viewLectureData: true,
                      ),
                    ),
            ),
          ),
          Obx(
            () => RefreshIndicator(
              onRefresh: () async {
                await controller.getMyCoursesRooms(
                  getNotAcceptableRoomAPI(controller.userId.value),
                  acceptable: false,
                );
              },
              child: controller.unAcceptableRooms.isEmpty
                  ? ListView.builder(
                      itemCount: 1,
                      padding: EdgeInsets.only(top: Get.height / 3),
                      itemBuilder: (_, index) =>
                          Center(child: Text("No Rooms Found!")),
                    )
                  : ListView.builder(
                      itemCount: controller.unAcceptableRooms.length,
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      itemBuilder: (_, index) => CourseItem(
                        index + 1,
                        controller.unAcceptableRooms[index],
                        viewLectureData: false,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
