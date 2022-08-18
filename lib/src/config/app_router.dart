import 'package:flutter/material.dart';
import 'package:riverhotel/arc/data/models/data_models/data_models.dart';
import 'package:riverhotel/arc/presentation/screens/auth/auth.dart';
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
      case RouteKey.clinic:
        return _materialRoute(const ClinicScreen());
      case RouteKey.profile:
        return _materialRoute(const ProfileDoctorScreen());
      case RouteKey.process:
        return _materialRoute(const ProcessScreen());
      case RouteKey.all_service:
        return _materialRoute(const ListServiceScreen());
      case RouteKey.list_user_dependent:
        return _materialRoute(const ListUserDependentScreen());
      case RouteKey.reason:
        return _materialRoute(const ReasonScreen());
        case RouteKey.list_doctor:
        return _materialRoute(const ListDoctorScreen());
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
