import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:riverhotel/arc/presentation/blocs/theme_bloc.dart';
import 'package:riverhotel/injector.dart';
import 'package:riverhotel/src/base_widget_state/base_cubit_stateful_widget.dart';
import 'package:riverhotel/src/utilities/navigator_service.dart';
import '../src/constants.dart';

import 'arc/presentation/blocs/blocs.dart';
import 'arc/presentation/models/models.dart';
import 'src/config/config.dart';

class MyApp extends BaseCubitStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends BaseCubitStateFulWidgetState<ThemeBloc, MyApp> {
  @override
  void initState() {
    super.initState();
    bloc.initTheme(context);
  }

  @override
  Widget buildContent(BuildContext context, state) {
    final model = state.model as ThemeScreenModel;
    return KeyboardDismissOnTap(
      child: MaterialApp(
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        onGenerateInitialRoutes: (_) => AppRoutes.onGenerateInitialRoute(),
        debugShowCheckedModeBanner: false,
        title: Constants.appName,
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        navigatorKey:
            AppDependencies.injector.get<NavigationService>().navigationKey,
        builder: EasyLoading.init(),
        theme: model.themeData,
        // darkTheme: MyTheme.darkTheme(),
        // themeMode: ThemeMode.light,
      ),
    );
  }
}
