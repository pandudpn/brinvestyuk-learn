import 'package:brinvestyuk/widgets/text.dart';
import 'package:flutter/material.dart';

class TextFieldRounded extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool isPassword;
  final bool? obscure;
  final VoidCallback? onTap;
  final InputDecoration? inputDecoration;
  final FontWeight? fontWeight;
  final ValueChanged<String>? onChanges;
  final Widget? validation;
  final bool? autoFocus;

  TextFieldRounded({
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.isPassword,
    this.obscure,
    this.onTap,
    this.inputDecoration,
    this.fontWeight,
    this.onChanges,
    this.validation,
    this.autoFocus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BRIText(
            text: labelText,
            fontWeight: fontWeight ?? FontWeight.w500,
          ),
          SizedBox(height: 10),
          TextField(
            autofocus: autoFocus ?? false,
            controller: controller,
            obscureText: obscure ?? false,
            onChanged: onChanges,
            decoration: inputDecoration ??
                InputDecoration(
                  hintText: hintText,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsetsDirectional.only(
                      end: 10,
                    ),
                    child: isPassword
                        ? GestureDetector(
                            child: obscure!
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                            onTap: isPassword ? onTap ?? null : null,
                          )
                        : null,
                  ),
                ),
          ),
          Container(
            child: validation,
          ),
        ],
      ),
    );
  }
}
