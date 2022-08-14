import 'package:flutter/material.dart';
import 'package:riverhotel/src/styles/dimens.dart';

class ItemMenu extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback onTap;
  const ItemMenu({
    Key? key,
    required this.image,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: Dimens.size44,
              width: Dimens.size44,
            ),
            const SizedBox(height: Dimens.size10),
            Text(
              text,
              textAlign: TextAlign.center,
              style: theme.textTheme.caption,
            ),
          ],
        ),
      ),
    );
  }
}
