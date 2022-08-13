import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final VoidCallback onTap;
  final double height;
  final double? width;
  final Color? color;

  const CustomButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.height = 45,
    this.width,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: height,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          width: width ?? MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: color ?? theme.primaryColor,
            borderRadius: BorderRadius.circular(50),
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
                    fontWeight: FontWeight.w600,
                    color: theme.backgroundColor,
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
