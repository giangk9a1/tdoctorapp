import 'dart:convert';

import 'package:riverhotel/arc/data/models/response_models/login_response_model.dart';
import 'package:riverhotel/arc/presentation/models/models.dart';
import 'package:riverhotel/static_variable.dart';

import '../../../src/bloc/bloc.dart';
import '../../../src/config/config.dart';
import '../widgets/widget.dart';

class SplashBloc extends BaseCubit<SplashScreenParam, SplashScreenModel> {
  SplashBloc() : super(InitialState());

  @override
  void initState() {
    super.initState();
    final params = SplashScreenParam();
    final model = SplashScreenModel();
    emit(LoadedState<SplashScreenParam, SplashScreenModel>(params, model));
    initData();
  }

  Future<void> initData() async {
    if (latestLoadedState is LoadedState) {
      await Future.delayed(const Duration(seconds: 2));
      final token = await appPreference.token;
      final user = await appPreference.userInfo ?? '';
      if (user.isNotEmpty) {
        StaticVariable.user = CurrentUser.fromJson(jsonDecode(user));
      }
      if (token?.isNotEmpty ?? false) {
        navigator.pushNamed(RouteKey.main);
      } else {
        navigator.pushNamed(RouteKey.intro);
      }
    }
  }
}
