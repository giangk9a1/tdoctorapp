import 'package:riverhotel/arc/data/models/response_models/doctor_response_model.dart';
import 'package:riverhotel/arc/data/services/doctor_profile_service.dart';
import 'package:riverhotel/arc/presentation/models/doctor_profile/doctor_profile_model.dart';
import 'package:riverhotel/src/bloc/bloc.dart';
import 'package:riverhotel/src/utilities/utilities.dart';

class DoctorProfileBloc
    extends BaseCubit<DoctorProfileParam, DoctorProfileModel> {
  final DoctorProfileService _service;
  DoctorProfileBloc(this._service) : super(InitialState());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final params = DoctorProfileParam();
    final model = DoctorProfileModel();
    emit(LoadedState<DoctorProfileParam, DoctorProfileModel>(params, model));
  }

  Future<void> getDoctorProfile(int doctorId) async {
    if (latestLoadedState is LoadedState) {
      emit(latestLoadedState!.copyWith(isShowLoading: true));
      final result = await _service.getDoctor(doctorId);
      if (result.data['success'] == true) {
        model.doctor = DoctorResponseModel.fromJson(result.data);
        print(model.doctor);
        print("DATA" + result.data['data'].toString());
        print("OBJECT" + "${DoctorResponseModel.fromJson(result.data)}");
      } else {
        print("not ok");
      }
      print("CHINGCHONG" + result.toString());
      emit(latestLoadedState!.copyWith(isShowLoading: false, model: model));
      print(model.doctor);
    }
  }
}
