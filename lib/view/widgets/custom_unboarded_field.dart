import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomUnBoardedFailed extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final Function onChanged;
  final Function validator;
  final bool autoValidate;
  final bool obscureText;
  CustomUnBoardedFailed({
    this.controller,
    this.hint,
    this.onChanged,
    this.validator,
    this.autoValidate = false,
    this.obscureText=false,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 16.w,
          fontWeight: FontWeight.w400,
        ),
      ),
      validator: validator,
      onChanged: onChanged,
      autovalidate: autoValidate,
    );
  }
}
