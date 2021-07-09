import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'config/pages.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.grey[400],
    ));
    return ScreenUtilInit(
      designSize: Size(411.4, 731.4),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Online Courses",
        initialRoute: '/',
        getPages: AppPages.getPages(),
        defaultTransition: Transition.cupertino,
      ),
    );
  }
}
