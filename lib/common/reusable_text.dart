import 'package:flutter/material.dart';

class ReusableText extends StatelessWidget {
  const ReusableText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.color,
    required this.fontWeight,
  });

  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
