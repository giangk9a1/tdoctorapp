import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riverhotel/arc/presentation/models/models.dart';
import 'package:riverhotel/arc/presentation/screens/list_doctor/list_doctor_screen.dart';
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
    const ListDoctorScreen(),
    const ProfileScreen(),
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
        icon: SvgPicture.asset(
          ImageAssetPath.icNavHome,
          height: Dimens.size18,
          width: Dimens.size18,
          fit: BoxFit.scaleDown,
        ),
        activeIcon: SvgPicture.asset(
          ImageAssetPath.icNavHome,
          height: Dimens.size18,
          width: Dimens.size18,
          fit: BoxFit.scaleDown,
          color: theme.colorScheme.primary,
        ),
        label: TranslationKey.home.tr(),
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          ImageAssetPath.icNavChat,
          height: Dimens.size18,
          width: Dimens.size18,
          fit: BoxFit.scaleDown,
        ),
        activeIcon: SvgPicture.asset(
          ImageAssetPath.icNavChat,
          height: Dimens.size18,
          width: Dimens.size18,
          fit: BoxFit.scaleDown,
          color: theme.colorScheme.primary,
        ),
        label: TranslationKey.chat.tr(),
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          ImageAssetPath.icNavNotification,
          height: Dimens.size18,
          width: Dimens.size18,
          fit: BoxFit.scaleDown,
        ),
        activeIcon: SvgPicture.asset(
          ImageAssetPath.icNavNotification,
          height: Dimens.size18,
          width: Dimens.size18,
          fit: BoxFit.scaleDown,
          color: theme.colorScheme.primary,
        ),
        label: TranslationKey.notification.tr(),
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          ImageAssetPath.icNavProfile,
          height: Dimens.size18,
          width: Dimens.size18,
          fit: BoxFit.scaleDown,
        ),
        activeIcon: SvgPicture.asset(
          ImageAssetPath.icNavProfile,
          height: Dimens.size18,
          width: Dimens.size18,
          fit: BoxFit.scaleDown,
          color: theme.colorScheme.primary,
        ),
        label: TranslationKey.profile.tr(),
      ),
    ];

    return WillPopScope(
      child: Scaffold(
        backgroundColor: theme.backgroundColor,
        body: IndexedStack(
          index: model.index ?? 0,
          children: listScreen,
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: BottomNavigationBar(
              items: items,
              currentIndex: model.index ?? 0,
              showSelectedLabels: true,
              elevation: 0,
              showUnselectedLabels: true,
              selectedLabelStyle: theme.primaryTextTheme.subtitle1,
              unselectedLabelStyle: theme.primaryTextTheme.subtitle2,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Theme.of(context).backgroundColor,
              onTap: (index) => bloc.changePage(index),
            ),
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
