import 'package:flutter/material.dart';
import 'package:riverhotel/arc/data/models/data_models/data_models.dart';
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
