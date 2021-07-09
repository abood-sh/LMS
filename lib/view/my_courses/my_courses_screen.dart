import 'package:courses_app/view/widgets/custom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'body_section.dart';
import 'tab_section.dart';

class MyCoursesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(0, 50.h),
        child: CustomBar(
          title: "My courses",
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20.h),
          TabSection(),
          SizedBox(height: 20.h),
          BodySection(),
        ],
      ),
    );
  }
}
