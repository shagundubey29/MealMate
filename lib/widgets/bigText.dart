import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  FontWeight weight;

  BigText({Key? key,
    this.color = const Color(0xFF412815),
    required this.text, 
    this.overflow=TextOverflow.ellipsis, 
    this.size=20,
    this.weight = FontWeight.w400
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        maxLines: 1,
        overflow: overflow,
        style: TextStyle(
          fontSize: size,
          fontFamily: 'Roboto',
          color: color,
          fontWeight: weight,
        ),
    );
  }
}