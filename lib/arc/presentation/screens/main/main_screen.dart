import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riverhotel/arc/presentation/models/models.dart';
import 'package:riverhotel/arc/presentation/screens/screens.dart';
import 'package:riverhotel/src/constants.dart';
import 'package:riverhotel/src/styles/style.dart';

import '../../../../src/base_widget_state/base_cubit_stateful_widget.dart';
import '../../../../src/utilities/showtoast.dart';
import '../../../../translation_key.dart';
import '../../blocs/blocs.dart';

class MainScreen extends BaseCubitStatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState
    extends BaseCubitStateFulWidgetState<MainBloc, MainScreen> {
  DateTime? currentBackPressTime;

  final List<Widget> listScreen = [
    const HomeScreen(),
    const ChatScreen(),
    Container(),
    Container(),
  ];

  @override
  Widget buildContent(BuildContext context, state) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    final theme = Theme.of(context);
    final model = state.model as MainScreenModel;
    final List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(
        icon: SvgPicture.asset(ImageAssetPath.icNavHome),
        activeIcon: SvgPicture.asset(ImageAssetPath.icNavHome,
            color: theme.colorScheme.primary),
        label: TranslationKey.home.tr(),
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(ImageAssetPath.icNavChat),
        activeIcon: SvgPicture.asset(ImageAssetPath.icNavChat,
            color: theme.colorScheme.primary),
        label: TranslationKey.chat.tr(),
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(ImageAssetPath.icNavNotification),
        activeIcon: SvgPicture.asset(ImageAssetPath.icNavNotification,
            color: theme.colorScheme.primary),
        label: TranslationKey.notification.tr(),
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(ImageAssetPath.icNavProfile),
        activeIcon: SvgPicture.asset(ImageAssetPath.icNavProfile,
            color: theme.colorScheme.primary),
        label: TranslationKey.profile.tr(),
      ),
    ];

    return WillPopScope(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: IndexedStack(
          index: model.index ?? 0,
          children: listScreen,
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
          child: BottomNavigationBar(
            items: items,
            currentIndex: model.index ?? 0,
            showSelectedLabels: true,
            elevation: 0,
            showUnselectedLabels: true,
            selectedLabelStyle: theme.textTheme.caption,
            unselectedLabelStyle: theme.primaryTextTheme.caption,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Theme.of(context).backgroundColor,
            onTap: (index) => bloc.changePage(index),
          ),
        ),
      ),
      onWillPop: _onWillPop,
    );
  }

  Future<bool> _onWillPop() async {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      ToastView.withBottom(TranslationKey.tapExit.tr());
      return Future.value(false);
    }
    exit(0);
  }
}
