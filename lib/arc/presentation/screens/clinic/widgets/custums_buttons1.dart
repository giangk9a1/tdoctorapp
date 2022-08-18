import 'package:flutter/material.dart';
import 'package:riverhotel/src/styles/style.dart';

class CustumsButtons1 extends StatelessWidget {
  final String? text;
  final VoidCallback onTap;
  final IconData icons;
  final double? heigth;
  final double? width;
  final Color? colorBg;
  final Color? color;
  final double? fontSize1;

  const CustumsButtons1({
    Key? key,
    required this.onTap,
    required this.text,
    required this.icons,
    this.heigth,
    this.width,
    this.color,
    this.colorBg,
    this.fontSize1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: heigth,
          margin: const EdgeInsets.all(16.0),
          width: width ?? MediaQuery.of(context).size.width - 16,
          decoration: BoxDecoration(
            color: colorBg ?? theme.primaryColor,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(width: 2.0, color: color ?? theme.primaryColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icons,
                color: color ?? theme.primaryColor,
              ),
              SizedBox(width: 2),
              Center(
                child: Text(
                  text ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: fontSize1 ?? 16,
                    fontWeight: FontWeight.w600,
                    color: color ?? theme.backgroundColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
