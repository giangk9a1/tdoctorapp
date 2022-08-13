import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:riverhotel/src/config/config.dart';
import 'package:riverhotel/src/styles/colors.dart';
import 'package:riverhotel/src/styles/dimens.dart';

/// Ex:
/// import '~/text_theme_extension.dart';
///
/// final theme = Theme.of(context);
/// theme.customStyle();

extension ThemeExtension on TextTheme {
  TextStyle customStyle({bool? isLightMode, Color? color}) {
    final bool _isLightMode =
        SchedulerBinding.instance.window.platformBrightness == Brightness.light;
    final isLight = isLightMode ?? _isLightMode;
    return TextStyle(
      fontFamily: MyTheme.roboto,
      color: isLight ? MyColors.black : MyColors.black,
      fontSize: Dimens.textSize12,
      fontWeight: FontWeight.w500,
    );
  }
}
