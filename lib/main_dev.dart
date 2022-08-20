import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riverhotel/app_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import '../my_app.dart';
import '../src/config/app_config.dart';
import '../src/constants.dart';
import 'arc/data/services/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig().setAppConfig(
    appEnvironment: AppEnvironment.DEV,
    apiEndpoint: 'http://dev.tdoctor.vn/',
  );
  // await Firebase.initializeApp();
  BlocOverrides.runZoned(
    () => runApp(
      EasyLocalization(
        path: 'assets/translations',
        supportedLocales: Constants.languages,
        startLocale: Constants.languages.first,
        fallbackLocale: Constants.languages.first,
        child: DevicePreview(
            builder: (context) => const MyApp()),
      ),
    ),
    blocObserver: AppBlocObserver(),
  );
}
