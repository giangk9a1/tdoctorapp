import 'package:flutter/material.dart';
import 'package:riverhotel/src/styles/style.dart';

class ItemInfo extends StatelessWidget {
  final String text;
  final String image;
  final double? size;
  final Color? color;
  const ItemInfo({
    Key? key,
    required this.image,
    required this.text,
    this.size,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(top: 10.0, left: 10.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(
              image,
              height: Dimens.size20,
              width: Dimens.size15,
            ),
          ),
          SizedBox(width: Dimens.size10),
          Expanded(
            flex: 16,
            child: Text(
              text,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: size ?? 12.0,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
