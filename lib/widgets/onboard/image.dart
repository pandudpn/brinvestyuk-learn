import 'package:flutter/material.dart';

class OnboardImage extends StatelessWidget {
  final String? image;
  final double? height;
  final double? width;

  OnboardImage({this.image, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? MediaQuery.of(context).size.height * 0.35,
      width: width ?? MediaQuery.of(context).size.width,
      child: Image(
        image: AssetImage(image ?? "assets/onboard/onboard_1.png"),
      ),
    );
  }
}
