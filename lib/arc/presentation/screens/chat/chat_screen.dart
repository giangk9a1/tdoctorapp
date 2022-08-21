import 'package:flutter/material.dart';
import 'package:riverhotel/arc/presentation/blocs/blocs.dart';
import 'package:riverhotel/arc/presentation/screens/chat/widgets/chat_menu.dart';
import 'package:riverhotel/arc/presentation/screens/chat/widgets/item_chat.dart';
import 'package:riverhotel/arc/presentation/widgets/commons/common.dart';
import 'package:riverhotel/src/config/route_keys.dart';
import 'package:riverhotel/src/constants.dart';
import 'package:riverhotel/src/styles/style.dart';
import 'package:riverhotel/translation_key.dart';

import '../../../../src/base_widget_state/base_cubit_stateful_widget.dart';
import '../../models/models.dart';

class ChatScreen extends BaseCubitStatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState
    extends BaseCubitStateFulWidgetState<ChatBloc, ChatScreen> {
  @override
  void initState() {
    super.initState();
    bloc.initData();
  }

  @override
  Widget buildContent(BuildContext context, state) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final model = state.model as ChatScreenModel;
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: Dimens.size16),
            child: Text(
              TranslationKey.chat.tr(),
              style: theme.textTheme.headline2,
            ),
          ),
          const SizedBox(height: Dimens.size14),
          Row(
            children: const [
              SizedBox(width: Dimens.size16),
              ChatMenu(
                icon: ImageAssetPath.icDoctorChat,
                title: 'Nhắn tin cho \nhỗ trợ',
                subtitle: '08:00h - 20:00h hằng ngày',
              ),
              SizedBox(width: Dimens.size16),
              ChatMenu(
                icon: ImageAssetPath.icDoctorChat,
                title: 'Nhắn tin cho \nBÁC SĨ',
                subtitle: 'Miễn phí 24/7',
              ),
              SizedBox(width: Dimens.size16),
            ],
          ),
          const SizedBox(height: Dimens.size20),
          Container(height: 10, color: const Color(0xffF0F5FA)),
          const SizedBox(height: Dimens.size16),
          ColummBuilder(
            data: model.listRoom ?? [],
            itemBuilder: (index) => ItemChat(
              roomModel: model.listRoom![index],
            ),
            separatorItem: const Divider(height: 1),
          )
        ],
      ),
    );
  }
}
