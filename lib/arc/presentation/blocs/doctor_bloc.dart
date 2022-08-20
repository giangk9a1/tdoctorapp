import 'package:riverhotel/arc/data/services/dortor_service.dart';
import 'package:riverhotel/arc/presentation/models/doctor/doctor_model.dart';
import 'package:riverhotel/src/bloc/base_cubit.dart';
import 'package:riverhotel/src/bloc/base_state.dart';
import 'package:riverhotel/src/utilities/utilities.dart';

class DoctorBloc extends BaseCubit<DoctorScreenParams, DoctorScreenModel> {
  final DoctorService _service;

  DoctorBloc(this._service) : super(InitialState());

  @override
  void initState() {
    super.initState();
    final params = DoctorScreenParams();
    final model = DoctorScreenModel();
    emit(LoadedState<DoctorScreenParams, DoctorScreenModel>(params, model));
  }
  Future<void> getDoctor() async{
    if(latestLoadedState is LoadedState){
      emit(latestLoadedState!.copyWith(isShowLoading: true));
      final result = await _service.getDoctor();
      if(result.data['success']== true){
        model.listDoctor = result.data['data'];
        LoggerUtils.d(model.listDoctor?.length);
      }
      emit(latestLoadedState!.copyWith(isShowLoading: false, model: model));
    }
  }
}