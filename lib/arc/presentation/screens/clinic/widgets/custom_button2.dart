import 'package:flutter/material.dart';

class CustomButton2 extends StatelessWidget {
  final String? text;
  final VoidCallback onTap;
  final double height;
  final double? width;
  final Color? color;

  const CustomButton2({
    Key? key,
    required this.onTap,
    required this.text,
    this.height = 34,
    this.width,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: color ?? theme.primaryColor,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(width: 2, color: theme.primaryColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                text ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: (color == theme.primaryColor)? Colors.white:theme.primaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
