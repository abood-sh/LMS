import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Background extends StatelessWidget {
  final Widget child;
  Background({this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Get.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset("assets/images/top1.png", width: Get.width),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset("assets/images/top2.png", width: Get.width),
          ),
          Positioned(
            top: 50,
            right: 30,
            child:
                Image.asset("assets/images/main.png", width: Get.width * 0.35),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset("assets/images/bottom1.png", width: Get.width),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset("assets/images/bottom2.png", width: Get.width),
          ),
          child
        ],
      ),
    );
  }
}
