import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBoardedField extends StatelessWidget {
  final String hint;
  final IconData prefix;
  final Widget suffix;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function onChanged;
  final Function validator;
  final bool autoValidate;
  final bool obscureText;
  final bool readOnly;
  CustomBoardedField({
    this.hint,
    this.prefix,
    this.controller,
    this.onChanged,
    this.validator,
    this.suffix,
    this.keyboardType = TextInputType.name,
    this.autoValidate,
    this.obscureText = false,
    this.readOnly=false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3.0,
      shadowColor: Colors.grey.withOpacity(0.2),
      borderRadius: BorderRadius.circular(5.w),
      color: Colors.white,
      child: TextFormField(
        readOnly: readOnly,
        style: TextStyle(
          color: Colors.black,
          fontSize: 12.w,
          fontWeight: FontWeight.w500,
        ),
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: prefix == null ? 17.h : 0,
          ),
          prefixIcon: prefix != null
              ? Icon(
                  prefix,
                  size: 20.w,
                  color: Colors.grey,
                )
              : null,
          suffixIcon: suffix,
          filled: true,
          fillColor: Colors.white,
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 12.w,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.withOpacity(0.4)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.withOpacity(0.4)),
          ),
        ),
        controller: controller,
        validator: validator,
        onChanged: onChanged,
        autovalidateMode:
            autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
      ),
    );
  }
}
