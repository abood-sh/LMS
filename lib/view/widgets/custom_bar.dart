import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'medium_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBar extends StatelessWidget {
  final String title;
  final List<Widget> action;
  final bool hasLeading;
  CustomBar({this.title, this.action, this.hasLeading = false});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: MediumText(text: title),
      leading: hasLeading
          ? IconButton(
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Colors.black,
                size: 22.w,
              ),
              onPressed: () => Get.back(),
              splashRadius: 25.w,
              padding: EdgeInsets.zero,
            )
          : null,
      actions: action ?? [Text('')],
    );
  }
}
