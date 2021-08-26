import 'package:flutter/material.dart';
import 'package:brinvestyuk/constant/color.dart' as Constant;

class BRIText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final int? maxLines;

  BRIText({
    required this.text,
    this.size,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.decoration,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.justify,
      maxLines: maxLines ?? null,
      style: TextStyle(
        fontSize: size ?? 15,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color ?? Constant.PRIMARY,
        decoration: decoration ?? TextDecoration.none,
      ),
    );
  }
}
