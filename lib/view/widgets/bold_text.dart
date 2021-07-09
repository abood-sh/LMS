import 'package:flutter/material.dart';

class BoldText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  BoldText({
    this.text,
    this.size,
    this.color = Colors.black,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
