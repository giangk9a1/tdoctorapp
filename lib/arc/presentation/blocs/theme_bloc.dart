import 'dart:io';

import 'package:flutter/material.dart';
import 'package:riverhotel/arc/presentation/models/models.dart';
import 'package:riverhotel/src/styles/style.dart';

import '../../../src/bloc/bloc.dart';
import '../../../src/config/config.dart';
import '../../../src/constants.dart';
import '../widgets/commons/dialog.dart';

class ThemeBloc extends BaseCubit<ThemeScreenParam, ThemeScreenModel> {
  ThemeBloc() : super(InitialState());

  @override
  void initState() {
    super.initState();
    final params = ThemeScreenParam();
    final model = ThemeScreenModel(isDarkMode: false);
    emit(LoadedState<ThemeScreenParam, ThemeScreenModel>(params, model));
  }

  Future<void> initTheme(BuildContext context) async {
    if (latestLoadedState is LoadedState) {
      final locate = await appPreference.language;
      final String defaultLocale = Platform.localeName;
      if (locate == null) {
        if (defaultLocale == "en_US") {
          context.setLocale(Constants.languages[1]);
        } else {
          context.setLocale(Constants.languages[0]);
        }
      } else {
        final listLanguage = Constants.languages;
        context.setLocale(listLanguage
            .firstWhere((element) => element.languageCode == locate));
      }
      bool isDarkMode = false;
      final color = await appPreference.colorMode;
      if (color == 'dark') {
        isDarkMode = true;
      }
      if (color == 'light') {
        isDarkMode = false;
      }
      if (color == '') {
        isDarkMode = false;
      }
      if (isDarkMode) {
        model.themeData = MyTheme.darkTheme();
      } else {
        model.themeData = MyTheme.lightTheme();
      }
      model.isDarkMode = isDarkMode;
      emit(latestLoadedState!.copyWith(model: model));
    }
  }

  Future<void> changeTheme(bool isDarkMode) async {
    if (latestLoadedState is LoadedState) {
      if (isDarkMode) {
        model.isDarkMode = true;
        model.themeData = MyTheme.darkTheme();
        appPreference.setColorMode('dark');
      } else {
        model.isDarkMode = false;
        model.themeData = MyTheme.lightTheme();
        appPreference.setColorMode('light');
      }
      emit(latestLoadedState!.copyWith(model: model));
    }
  }
}
