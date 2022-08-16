import 'package:riverhotel/arc/presentation/models/models.dart';

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
      if (token?.isNotEmpty ?? false) {
        navigator.pushNamed(RouteKey.main);
      } else {
        navigator.pushNamed(RouteKey.intro);
      }
    }
  }
}
