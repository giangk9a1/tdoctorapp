import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../styles/style.dart';

class MyTheme {
  static const String roboto = 'Roboto';

  final bool _isLightMode =
      SchedulerBinding.instance.window.platformBrightness == Brightness.light;

  bool get isLightMode => _isLightMode;

  static ThemeData lightTheme() {
    return ThemeData(
      backgroundColor: MyColors.backgroundColor,
      primaryColor: MyColors.primaryColor,
      scaffoldBackgroundColor: MyColors.whiteColor,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      colorScheme: const ColorScheme(
        secondary: MyColors.secondaryColor,
        primary: MyColors.colorBTN,
        background: MyColors.colorBTN,
        brightness: Brightness.light,
        error: MyColors.errorColor,
        onBackground: MyColors.backgroundColor,
        onError: MyColors.errorColor,
        onPrimary: MyColors.whiteColor,
        onSecondary: MyColors.secondaryColor,
        onSurface: MyColors.black,
        surface: MyColors.whiteColor,
      ),
      errorColor: MyColors.errorColor,
      primaryIconTheme:
          const IconThemeData(color: MyColors.primaryColor, size: 24),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: MyColors.colorBTN, // b,utton text color
        ),
      ),
      // Text
      primaryTextTheme: const TextTheme(
          bodyText1: TextStyle(
            fontFamily: roboto,
            color: MyColors.colorBTN,
            fontSize: Dimens.textSize16,
            fontWeight: FontWeight.w400,
          ),
          bodyText2: TextStyle(
            fontFamily: roboto,
            color: Colors.grey,
            fontSize: Dimens.textSize14,
            fontWeight: FontWeight.w400,
          ),
          caption: TextStyle(
            fontFamily: roboto,
            color: Colors.white,
            fontSize: Dimens.textSize14,
            fontWeight: FontWeight.w700,
          ),
          subtitle1: TextStyle(
            fontFamily: roboto,
            color: MyColors.primaryColor,
            fontSize: Dimens.textSize10,
            fontWeight: FontWeight.w500,
          ),
          subtitle2: TextStyle(
            fontFamily: roboto,
            color: MyColors.secondaryColor,
            fontSize: Dimens.textSize10,
            fontWeight: FontWeight.w500,
          )),
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontFamily: roboto,
          height: 1.5,
          fontWeight: FontWeight.w800,
          fontSize: 24,
          color: MyColors.primaryColor,
        ),
        headline2: TextStyle(
          fontFamily: roboto,
          color: MyColors.colorBTN,
          fontSize: Dimens.textSize17,
          fontWeight: FontWeight.w500,
        ),
        headline3: TextStyle(
          fontFamily: roboto,
          color: MyColors.black,
          fontSize: Dimens.textSize14,
          fontWeight: FontWeight.w600,
        ),
        headline5: TextStyle(
          fontFamily: roboto,
          color: MyColors.colorBTN,
          fontSize: Dimens.textSize17,
          fontWeight: FontWeight.w300,
        ),
        subtitle1: TextStyle(
          fontFamily: roboto,
          color: Colors.white,
          fontSize: Dimens.textSize12,
          fontWeight: FontWeight.w500,
        ),
        subtitle2: TextStyle(
          fontFamily: roboto,
          color: MyColors.primaryColor,
          fontSize: Dimens.textSize10,
          fontWeight: FontWeight.w500,
        ),
        caption: TextStyle(
          fontFamily: roboto,
          color: MyColors.black,
          fontSize: Dimens.textSize14,
          fontWeight: FontWeight.w400,
        ),
        headline4: TextStyle(
          fontFamily: roboto,
          color: MyColors.whiteColor,
          fontSize: Dimens.textSize16,
          fontWeight: FontWeight.w700,
        ),
        bodyText1: TextStyle(
          fontFamily: roboto,
          color: MyColors.primaryColor,
          fontSize: Dimens.textSize14,
          fontWeight: FontWeight.w700,
        ),
        button: TextStyle(
          fontFamily: roboto,
          color: MyColors.primaryColor,
          fontSize: Dimens.textSize14,
          fontWeight: FontWeight.w700,
        ),
        bodyText2: TextStyle(
          fontFamily: roboto,
          color: Colors.grey,
          fontSize: Dimens.textSize12,
          fontWeight: FontWeight.w500,
        ),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      backgroundColor: MyColors.black,
      primaryColor: MyColors.primaryColor,
      primaryColorLight: MyColors.primaryColorLight,
      scaffoldBackgroundColor: MyColors.primaryColorLight,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme(
        secondary: MyColors.secondaryColor,
        primary: MyColors.primaryColor,
        background: MyColors.black,
        brightness: Brightness.dark,
        error: MyColors.errorColor,
        onBackground: MyColors.backgroundColor,
        onError: MyColors.errorColor,
        onPrimary: MyColors.primaryColor,
        onSecondary: MyColors.secondaryColor,
        onSurface: MyColors.blackSurface,
        surface: MyColors.blackSurface,
      ),

      errorColor: MyColors.errorColor,
      dividerColor: Colors.white,
      primaryIconTheme:
          const IconThemeData(color: MyColors.primaryColor, size: 24),

      // Text
      primaryTextTheme: const TextTheme(
        bodyText1: TextStyle(
          fontFamily: roboto,
          color: Colors.white,
          fontSize: Dimens.size15,
          fontWeight: FontWeight.w300,
        ),
        bodyText2: TextStyle(
          fontFamily: roboto,
          color: Colors.white54,
          fontSize: Dimens.size14,
          fontWeight: FontWeight.w100,
        ),
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontFamily: roboto,
          color: Colors.white,
          fontSize: Dimens.size22,
          fontWeight: FontWeight.w700,
        ),
        headline2: TextStyle(
          fontFamily: roboto,
          color: Colors.white,
          fontSize: Dimens.size15,
          fontWeight: FontWeight.w700,
        ),
        subtitle1: TextStyle(
          fontFamily: roboto,
          color: Colors.white,
          fontSize: Dimens.size16,
          fontWeight: FontWeight.w400,
        ),
        subtitle2: TextStyle(
          fontFamily: roboto,
          color: Colors.white,
          fontSize: Dimens.textSize11,
          fontWeight: FontWeight.w500,
        ),
        headline4: TextStyle(
          fontFamily: roboto,
          color: Colors.white,
          fontSize: Dimens.textSize18,
          fontWeight: FontWeight.w600,
        ),
        headline3: TextStyle(
          fontFamily: roboto,
          color: Colors.white,
          fontSize: Dimens.textSize16,
          fontWeight: FontWeight.w600,
        ),
        headline5: TextStyle(
          fontFamily: roboto,
          color: MyColors.colorBTN,
          fontSize: Dimens.textSize17,
          fontWeight: FontWeight.w300,
        ),
        caption: TextStyle(
          fontFamily: roboto,
          color: Colors.white,
          fontSize: Dimens.textSize14,
          fontWeight: FontWeight.w400,
        ),
        bodyText1: TextStyle(
          fontFamily: roboto,
          color: Colors.white,
          fontSize: Dimens.textSize12,
          fontWeight: FontWeight.w500,
        ),
        bodyText2: TextStyle(
          fontFamily: roboto,
          color: Colors.grey,
          fontSize: Dimens.textSize12,
          fontWeight: FontWeight.w500,
        ),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }
}
