import 'package:riverhotel/arc/data/services/services.dart';
import 'package:riverhotel/arc/presentation/models/models.dart';

import '../../../src/bloc/bloc.dart';

class ChooseBloc extends BaseCubit<ChooseScreenParam, ChooseScreenModel> {
  final ChooseService _service;
  ChooseBloc(this._service) : super(InitialState());

  @override
  void initState() {
    super.initState();
    final params = ChooseScreenParam();
    final model = ChooseScreenModel();
    emit(LoadedState<ChooseScreenParam, ChooseScreenModel>(params, model));
  }
}
