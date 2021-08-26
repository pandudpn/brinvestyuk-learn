import 'package:brinvestyuk/constant/color.dart';
import 'package:flutter/material.dart';

class ButtonRounded extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final ButtonStyle? style;
  final VoidCallback? onPresses;

  ButtonRounded({
    required this.text,
    this.textStyle,
    this.style,
    this.onPresses,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPresses,
      child: Text(
        text,
        style: textStyle ??
            TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.0,
            ),
      ),
      style: style ??
          ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              SECONDARY,
            ),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.width * 0.04,
                horizontal: MediaQuery.of(context).size.width * 0.25,
              ),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60),
                side: BorderSide(
                  style: BorderStyle.none,
                ),
              ),
            ),
            animationDuration: Duration(
              seconds: 750,
            ),
          ),
    );
  }
}

class ButtonRoundedDisabled extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final ButtonStyle? style;
  final VoidCallback? onPresses;

  ButtonRoundedDisabled({
    required this.text,
    this.textStyle,
    this.style,
    this.onPresses,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPresses,
      child: Text(
        text,
        style: textStyle ??
            TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontSize: 15,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.0,
            ),
      ),
      style: style ??
          ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Color.fromRGBO(0, 0, 0, .2),
            ),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.width * 0.04,
                horizontal: MediaQuery.of(context).size.width * 0.25,
              ),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60),
                side: BorderSide(
                  style: BorderStyle.none,
                ),
              ),
            ),
            animationDuration: Duration(
              seconds: 750,
            ),
          ),
    );
  }
}
