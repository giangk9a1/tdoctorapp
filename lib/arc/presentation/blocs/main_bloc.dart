import 'package:riverhotel/arc/presentation/models/models.dart';

import '../../../src/bloc/bloc.dart';

class MainBloc extends BaseCubit<MainScreenParam, MainScreenModel> {
  MainBloc() : super(InitialState());

  @override
  void initState() {
    super.initState();
    final params = MainScreenParam();
    final model = MainScreenModel();
    emit(LoadedState<MainScreenParam, MainScreenModel>(params, model));
    initData();
  }

  Future<void> initData() async {
    if (latestLoadedState is LoadedState) {
      model.index = 0;
      emit(latestLoadedState!.copyWith(model: model));
    }
  }

  Future<void> changePage(int index) async {
    if (latestLoadedState is LoadedState) {
      model.index = index;
      emit(latestLoadedState!.copyWith(model: model));
    }
  }
}
