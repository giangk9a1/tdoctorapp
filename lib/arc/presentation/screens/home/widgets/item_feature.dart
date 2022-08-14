import 'package:flutter/material.dart';

import '../../../../../src/styles/style.dart';

class ItemFeature extends StatelessWidget {
  final Color color;
  final String text;
  final double spacing;
  final String image;
  final VoidCallback onTap;
  const ItemFeature({
    Key? key,
    required this.color,
    required this.text,
    required this.image,
    required this.onTap,
    this.spacing = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final right = 0 + spacing;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Dimens.size120,
        width: Dimens.size110,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(Dimens.defaultBorderRadius),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: Dimens.size10,
                left: Dimens.size10,
              ),
              child: Text(text, style: theme.primaryTextTheme.caption),
            ),
            Positioned(
              bottom: 0,
              right: right,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Dimens.defaultBorderRadius),
                child: Image.asset(image, height: Dimens.size64),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
