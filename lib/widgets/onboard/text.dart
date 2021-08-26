import 'package:flutter/material.dart';
import 'package:brinvestyuk/widgets/text.dart';
import 'package:brinvestyuk/widgets/title.dart';

class OnboardText extends StatelessWidget {
  final String title;
  final String? subtitle;

  OnboardText({required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DefaultTitle(text: title),
        SizedBox(
          height: 20,
        ),
        BRIText(text: subtitle!),
      ],
    );
  }
}
