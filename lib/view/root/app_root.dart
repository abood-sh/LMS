import 'package:courses_app/controllers/root_controller.dart';
import 'package:courses_app/view/all_courses/all_courses_screen.dart';
import 'package:courses_app/view/edit_profile/edit_profile_screen.dart';
import 'package:courses_app/view/my_courses/my_courses_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppRoot extends StatelessWidget {
  final rootController = Get.put(RootController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: PageView(
          controller: rootController.pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            rootController.pageIndex.value = index;
          },
          children: <Widget>[
            AllCoursesScreen(),
            MyCoursesScreen(),
            EditProfileScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "All courses",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: "My courses",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.edit),
              label: "Edit profile",
            ),
          ],
          onTap: (int index) {
            rootController.pageIndex.value = index;
            rootController.pageController.jumpToPage(index);
          },
          selectedLabelStyle: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 13.w,
            fontWeight: FontWeight.w600,
          ),
          currentIndex: rootController.pageIndex.value,
          unselectedLabelStyle: TextStyle(
            fontSize: 13.w,
            fontWeight: FontWeight.w500,
          ),
          selectedItemColor: Colors.blue[800],
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          iconSize: 23.w,
          elevation: 20.0,
        ),
      ),
    );
  }
}
