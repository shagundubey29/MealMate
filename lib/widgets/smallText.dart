import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  double height;
  
  SmallText({super.key, 
    this.color = const Color(0xFF8f837f),
    required this.text,
    this.size = 14,
    this.height = 1.2});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontFamily: 'Roboto',
        color: color,
        fontWeight: FontWeight.w400,
        height: height,
      ),
    );
  }
}