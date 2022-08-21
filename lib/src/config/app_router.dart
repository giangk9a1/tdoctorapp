import 'package:flutter/material.dart';
import 'package:riverhotel/arc/data/models/data_models/data_models.dart';
import 'package:riverhotel/arc/presentation/screens/auth/auth.dart';
import 'package:riverhotel/arc/presentation/screens/chat/chat_detail_screen.dart';
import 'package:riverhotel/arc/presentation/screens/main/main_screen.dart';
import 'package:riverhotel/arc/presentation/widgets/commons/common.dart';

import '../../arc/presentation/screens/screens.dart';
import 'config.dart';

class AppRoutes {
  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteKey.splash:
        return _materialRoute(const SplashScreen());
      case RouteKey.main:
        return _materialRoute(const MainScreen());
      case RouteKey.invite:
        return _materialRoute(const InviteScreen());
      case RouteKey.login:
        return _materialRoute(const LoginScreen());
      case RouteKey.register:
        return _materialRoute(const RegisterScreen());
      case RouteKey.intro:
        return _materialRoute(const IntroScreen());
      case RouteKey.viewImage:
        final args = settings.arguments as Map;
        List<String> image = args['image'];
        int index = args['index'];
        return _materialRoute(ViewImageScreen(
          image: image,
          index: index,
        ));
      case RouteKey.chatDetail:
        final args = settings.arguments as Map;
        String _roomID = args['room_id'];
        String _title = args['title'];
        return _materialRoute(ChatDetailScreen(
          roomID: _roomID,
          title: _title,
        ));
      default:
        return _materialRoute(const PageNotFound());
    }
  }

  static List<Route> onGenerateInitialRoute() {
    return [_materialRoute(const SplashScreen())];
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute<String>(builder: (_) => view);
  }
}
