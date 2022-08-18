import 'package:flutter/material.dart';

class CustumsTitle extends StatelessWidget {
  final String text;
  final Color? colors;
  final double? fontSize;
  final FontWeight? fontWeighta;
  const CustumsTitle(
      {Key? key,
      required this.text,
      this.colors,
      this.fontSize,
      this.fontWeighta})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                  color: colors ?? Colors.black,
                  fontSize: fontSize ?? 18,
                  fontWeight: fontWeighta ?? FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
