import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:meal_mate/util/dimensions.dart';
import 'package:meal_mate/widgets/smallText.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  final Color iconColor;

  const IconAndText({
    super.key,
    required this.icon,
    this.color = const Color.fromARGB(255, 56, 55, 55),
    this.iconColor = const Color.fromARGB(255, 56, 55, 55),
    required this.text
    });

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Icon(icon, color: iconColor, size: 18),
          SizedBox(width: 2,),
          SmallText(text: text, color: color,)
        ],
    );
  }
}