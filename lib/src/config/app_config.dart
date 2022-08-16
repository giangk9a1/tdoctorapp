import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../injector.dart';
import '../../src/styles/colors.dart';

// ignore: constant_identifier_names
enum AppEnvironment { DEV, PROD }

class AppConfig {
  // Singleton object
  static final AppConfig _singleton = AppConfig._internal();

  factory AppConfig() {
    return _singleton;
  }

  AppConfig._internal();

  late AppEnvironment appEnvironment;
  late String apiEndpoint;

  // Set app configuration with single function
  void setAppConfig({
    required AppEnvironment appEnvironment,
    required String apiEndpoint,
  }) {
    this.appEnvironment = appEnvironment;
    this.apiEndpoint = apiEndpoint;
    configApp();
  }

  Future<void> configApp() async {
    initDependencies();
    configLoading();
  }

  void initDependencies() async {
    await AppDependencies.initialize();
  }

  void configLoading() {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..maskType = EasyLoadingMaskType.custom
      ..loadingStyle = EasyLoadingStyle.custom
      ..textColor = MyColors.whiteColor
      ..indicatorSize = 40.0
      ..radius = 12.0
      ..backgroundColor = MyColors.secondaryColor.withOpacity(0.2)
      ..indicatorColor = MyColors.primaryColor
      ..maskColor = MyColors.whiteColor.withOpacity(0.1)
      ..userInteractions = false
      ..dismissOnTap = false;
  }
}

// import 'package:flutter_easyloading/flutter_easyloading.dart';

// import '../../injector.dart';
// import '../../src/styles/colors.dart';

// class AppConfig {
//   static final AppConfig _appConfig = AppConfig._();
//   static AppConfig get instance => _appConfig;

//   AppConfig._();

//   // Production EndPoint
//   String get apiEndpoint =>
//       'https://river-hospitality-hv2wn47voq-as.a.run.app/graphql';

//   String get  => 'AIzaSyCFnQ3D-vZzZlDeQ-ikBIFwWHduVKlgt_s';

//   String get  =>
//       'https://maps.googleapis.com/maps/api/place/autocomplete/json';

//   Future<void> configApp() async {
//     initDependencies();
//     configLoading();
//   }

//   void initDependencies() async {
//     await AppDependencies.initialize();
//   }

//   void configLoading() {
//     EasyLoading.instance
//       ..indicatorType = EasyLoadingIndicatorType.circle
//       ..maskType = EasyLoadingMaskType.custom
//       ..loadingStyle = EasyLoadingStyle.custom
//       ..textColor = MyColors.whiteColor
//       ..indicatorSize = 40.0
//       ..radius = 12.0
//       ..backgroundColor = MyColors.secondaryColor.withOpacity(0.2)
//       ..indicatorColor = MyColors.primaryColor
//       ..maskColor = MyColors.whiteColor.withOpacity(0.1)
//       ..userInteractions = false
//       ..dismissOnTap = false;
//   }
// }
