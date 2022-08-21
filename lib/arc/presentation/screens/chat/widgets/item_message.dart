import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:riverhotel/arc/data/models/response_models/response_models.dart';
import 'package:riverhotel/arc/presentation/widgets/commons/common.dart';
import 'package:riverhotel/src/config/app_config.dart';
import 'package:riverhotel/src/config/route_keys.dart';
import 'package:riverhotel/static_variable.dart';

import '../../../../../src/constants.dart';
import '../../../../../src/styles/style.dart';

class ItemMessage extends StatelessWidget {
  final MessageModel messageModel;
  const ItemMessage({
    Key? key,
    required this.messageModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMe = StaticVariable.user?.userId == messageModel.userId;
    if (messageModel.attach != null) {
      final image =
          '${AppConfig().apiEndpoint}${messageModel.attach?.url ?? ''}';
      return Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isMe)
            Container(
              height: Dimens.size40,
              width: Dimens.size40,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: theme.primaryColor,
                shape: BoxShape.circle,
              ),
              child: Center(child: Image.asset(ImageAssetPath.icDoctorChat)),
            ),
          if (!isMe) const SizedBox(width: Dimens.size10),
          GestureDetector(
            onTap: () => navigator.pushNamed(RouteKey.viewImage, arguments: {
              "index": 0,
              "image": [image]
            }),
            child: CachedImage(
              imageUrl: image,
              height: Dimens.size120,
              width: Dimens.size120,
              fit: BoxFit.cover,
              borderRadius: Dimens.defaultBorderRadius,
            ),
          )
        ],
      );
    }
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isMe)
          Container(
            height: Dimens.size40,
            width: Dimens.size40,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: theme.primaryColor,
              shape: BoxShape.circle,
            ),
            child: Center(child: Image.asset(ImageAssetPath.icDoctorChat)),
          ),
        if (!isMe) const SizedBox(width: Dimens.size10),
        Container(
          child: Text(
            messageModel.message ?? '',
            style: isMe
                ? theme.textTheme.headline6
                : theme.primaryTextTheme.headline6,
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: Dimens.size10, vertical: Dimens.size10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: isMe ? theme.primaryColor : MyColors.blue,
          ),
        )
      ],
    );
  }
}
