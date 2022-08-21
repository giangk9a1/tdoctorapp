import 'package:flutter/material.dart';
import 'package:riverhotel/arc/data/models/response_models/chat_response_model.dart';
import 'package:riverhotel/arc/presentation/widgets/commons/common.dart';
import 'package:riverhotel/arc/presentation/widgets/commons/dialog.dart';
import 'package:riverhotel/src/config/route_keys.dart';
import 'package:riverhotel/src/constants.dart';
import 'package:riverhotel/static_variable.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../../../src/styles/style.dart';

class ItemChat extends StatelessWidget {
  final RoomModel roomModel;
  const ItemChat({
    Key? key,
    required this.roomModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        final doctor = roomModel.members?.firstWhere(
            (element) => element.userId != StaticVariable.user?.userId);
        navigator.pushNamed(
          RouteKey.chatDetail,
          arguments: {
            "room_id": roomModel.name,
            "title": doctor?.fullname,
          },
        );
      },
      child: SizedBox(
        height: 70,
        child: Row(
          children: [
            const SizedBox(width: Dimens.size16),
            Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: theme.primaryColor,
                shape: BoxShape.circle,
              ),
              child: Center(child: Image.asset(ImageAssetPath.icDoctorChat)),
            ),
            const SizedBox(width: Dimens.size8),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    roomModel.members?.last.fullname ?? '',
                    style: theme.primaryTextTheme.headline2,
                  ),
                  const SizedBox(height: Dimens.size4),
                  Text(
                    roomModel.latestMessages?.last.message ?? '',
                    style: theme.textTheme.caption,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
            const SizedBox(width: Dimens.size10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                      color: theme.primaryColor, shape: BoxShape.circle),
                ),
                const SizedBox(height: Dimens.size14),
                Text(
                  timeago.format(
                    DateTime.parse(
                        roomModel.latestMessages?.last.createDate ?? ''),
                    locale: 'vi',
                  ),
                  style: theme.textTheme.headline5,
                ),
              ],
            ),
            const SizedBox(width: Dimens.size10),
          ],
        ),
      ),
    );
  }
}
