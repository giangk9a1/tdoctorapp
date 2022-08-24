import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:riverhotel/src/config/config.dart';

import '../../../../../src/styles/style.dart';
import '../../../widgets/commons/common.dart';

class ChatMenu extends StatelessWidget {
  final String title;
  final String subtitle;
  final String icon;
  const ChatMenu({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
        child: Container(
      height: 180,
      decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(Dimens.defaultBorderRadius)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          Container(
            height: 60,
            width: 60,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: theme.backgroundColor,
              shape: BoxShape.circle,
            ),
            child: Center(child: Image.asset(icon)),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            textAlign: TextAlign.center,
            style: theme.textTheme.headline4,
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            style: theme.textTheme.subtitle1,
          ),
        ],
      ),
    ));
  }
}
