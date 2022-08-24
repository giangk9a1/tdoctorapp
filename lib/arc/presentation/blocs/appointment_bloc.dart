import 'package:riverhotel/arc/data/services/services.dart';
import 'package:riverhotel/arc/presentation/models/models.dart';

import '../../../src/bloc/bloc.dart';

class AppointmentBloc
    extends BaseCubit<AppointmentScreenParam, AppointmentScreenModel> {
  final AppointmentService _service;
  AppointmentBloc(this._service) : super(InitialState());

  @override
  void initState() {
    super.initState();
    final params = AppointmentScreenParam();
    final model = AppointmentScreenModel();
    emit(LoadedState<AppointmentScreenParam, AppointmentScreenModel>(
        params, model));
  }
}
