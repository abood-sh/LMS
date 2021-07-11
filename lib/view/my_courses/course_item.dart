import 'package:courses_app/config/routes.dart';
import 'package:courses_app/controllers/course_controller.dart';
import 'package:courses_app/models/my_room_model.dart';
import 'package:courses_app/view/widgets/medium_text.dart';
import 'package:courses_app/view/widgets/regular_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class CourseItem extends StatelessWidget {
  final int index;
  final MyCourseModel room;
  final bool viewLectureData;
  CourseItem(this.index, this.room, {this.viewLectureData});
  final controller = Get.find<CourseController>();
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 8.h),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: BorderSide(color: Colors.grey[200], width: 0.5)),
      shadowColor: Colors.grey.withOpacity(0.1),
      child: InkWell(
        onTap: !viewLectureData
            ? null
            : () {
                controller.getLecturesRoom(
                    int.parse(room.roomId), room.roomName);
                Get.toNamed(
                  Routes.allLecture,
                  arguments: [room.roomId, room.roomName],
                );
              },
        child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          enabled: viewLectureData ? false : true,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            child: Row(
              children: [
                RegularText(
                  text: "${index.toString()}.",
                  size: 12.w,
                  color: Colors.grey,
                ),
                SizedBox(width: 10.w),
                Image.asset(
                  "assets/images/logo.png",
                  height: 45.h,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 10.w),
                MediumText(
                  text: room.roomName,
                  size: 14.w,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            IconSlideAction(
              color: Colors.blue.withOpacity(0.2),
              iconWidget: Icon(
                Icons.delete_rounded,
                size: 24.w,
                color: Colors.red[800],
              ),
              onTap: () => controller.deleteStudentRoom(room.roomId),
            ),
          ],
          secondaryActions: <Widget>[
            IconSlideAction(
              color: Colors.blue.withOpacity(0.2),
              iconWidget: Icon(
                Icons.delete_rounded,
                size: 24.w,
                color: Colors.red[800],
              ),
              onTap: () => controller.deleteStudentRoom(room.roomId),
            ),
          ],
        ),
      ),
    );
  }
}
