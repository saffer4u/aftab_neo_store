import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/fonts.dart';

class CustomText extends StatelessWidget {
  final int? maxLines;
  final String? fontName;
  final TextOverflow? overflow;
  final Color? color;
  final double? size;
  final String text;
  const CustomText({
    this.maxLines,
    this.overflow,
    this.color = WHITE_COLOR,
    required this.text,
    this.size,
    this.fontName = Font.GothamMedium,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLines,
      overflow: overflow,
      text,
      style: TextStyle(
        fontFamily: fontName,
        color: color,
        fontSize: size,
      ),
    );
  }
}
