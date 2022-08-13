import 'package:flutter/material.dart';

import '../../../../../src/constants.dart';

class ItemRequired extends StatelessWidget {
  final bool complete;
  final String requiredText;
  const ItemRequired({
    Key? key,
    required this.complete,
    required this.requiredText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        children: [
          Image.asset(complete
              ? ImageAssetPath.icRequiredCheck
              : ImageAssetPath.icRequired),
          const SizedBox(width: 10),
          Text(requiredText),
        ],
      ),
    );
  }
}
