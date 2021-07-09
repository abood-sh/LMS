import 'package:courses_app/view/widgets/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final double labelSize;
  final Function onPressed;
  final double buttonHeight;
  final double buttonWidth;
  final Color buttonColor;
  final Color labelColor;
  CustomButton({
    this.label,
    this.labelSize,
    this.onPressed,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonColor = Colors.blue,
    this.labelColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: MediumText(
        text: label,
        size: labelSize ?? 15.w,
        color: labelColor,
      ),
      onPressed: onPressed,
      height: buttonHeight ?? 45.h,
      minWidth: buttonWidth ?? Get.width,
      elevation: 0.0,
      highlightElevation: 0.0,
      color: buttonColor,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}
