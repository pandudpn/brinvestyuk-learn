import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultTitle extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  DefaultTitle({
    required this.text,
    this.size,
    this.color,
    this.fontWeight,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.center,
      style: TextStyle(
        fontSize: size ?? 20,
        fontWeight: fontWeight ?? FontWeight.bold,
        color: color ?? Color.fromRGBO(67, 86, 142, 1),
      ),
    );
  }
}
