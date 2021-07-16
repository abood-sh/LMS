import 'package:courses_app/view/widgets/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class LectureDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              MediumText(
                text: "data:",
                size: 16.w,
              ),
              SizedBox(height: 10.h),
              GestureDetector(
                child: Html(
                  data: """${Get.arguments[1]}""",
                  shrinkWrap: true,
                  onLinkTap: (url) async {
                    await launch(url);
                  },
                  style: {
                    "body": Style(
                      color: Colors.blue,
                      fontSize: FontSize(13.w),
                      fontWeight: FontWeight.w400,
                      fontFamily: "Poppins",
                    ),
                  },
                ),
              ),
            ],
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
        text: Get.arguments[0],
      ),
    ),
    leading: IconButton(
      icon: Icon(Icons.arrow_back_outlined, color: Colors.black),
      onPressed: () => Get.back(),
    ),
  );
}
