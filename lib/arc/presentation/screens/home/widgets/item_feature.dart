import 'package:flutter/material.dart';

import '../../../../../src/styles/style.dart';

class ItemFeature extends StatelessWidget {
  final Color color;
  final String text;
  final String image;
  const ItemFeature({
    Key? key,
    required this.color,
    required this.text,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112,
      width: 105,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          Dimens.defaultBorderRadius,
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(image),
          ),
        ],
      ),
    );
  }
}
