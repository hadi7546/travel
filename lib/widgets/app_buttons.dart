import 'package:flutter/material.dart';

import 'app_text.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final String text;
  final IconData? icon;
  final Color backgroundColor;
  final double size;
  final Color borderColor;
  final bool isIcon;
  final Color textColor;
  const AppButtons({
    Key? key,
    required this.color,
    this.text = "Text",
    this.icon,
    required this.backgroundColor,
    required this.size,
    required this.borderColor,
    this.isIcon = false,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      child: isIcon
          ? Center(
              child: Icon(icon, color: color),
            )
          : Center(
              child: AppText(
                text: text,
                color: textColor,
              ),
            ),
    );
  }
}
