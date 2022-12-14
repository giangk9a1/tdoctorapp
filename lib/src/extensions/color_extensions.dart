import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../styles/colors.dart';

/// Ex:
/// import '~/theme_extensions.dart';
///
/// Theme.of(context).primaryButtonColor;
/// Theme.of(context).primaryBackgroundColor;
/// Theme.of(context).borderColor1;

extension ColorExtension on ThemeData {
  // ignore: fixme
  /// FIXME: Change dark color when dark mode available

  Color backgroundIconColor({bool? isLightMode, Color? color}) {
    final bool _isLightMode =
        SchedulerBinding.instance.window.platformBrightness ==
            Brightness.light;
    final isLight = isLightMode ?? _isLightMode;

    return isLight ? MyColors.backgroundIconColor : MyColors.white10;
  }

  Color colorBTN({bool? isLightMode, Color? color}) {
    final bool _isLightMode =
        SchedulerBinding.instance.window.platformBrightness ==
            Brightness.light;
    final isLight = isLightMode ?? _isLightMode;

    return isLight ? MyColors.colorBTN : MyColors.colorBTN;
  }
}
