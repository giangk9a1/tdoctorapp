import 'package:flutter/material.dart';

class ItemMenu extends StatelessWidget {
  final String image;
  final String text;
  const ItemMenu({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image),
        const SizedBox(height: 10),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
