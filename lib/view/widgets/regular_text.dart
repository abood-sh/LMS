import 'package:flutter/material.dart';

class RegularText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final bool hasDecoration;
  RegularText({
    this.text,
    this.size,
    this.color = Colors.black,
    this.hasDecoration = false,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.w400,
        decoration:
            hasDecoration ? TextDecoration.underline : TextDecoration.none,
      ),
    );
  }
}
