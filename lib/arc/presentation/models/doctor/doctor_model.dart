import 'package:riverhotel/arc/data/models/data_models/data_models.dart';
import 'package:riverhotel/arc/data/models/response_models/doctor_response_model.dart';
import 'package:riverhotel/arc/data/models/response_models/province_response_model.dart';
import '../../../data/models/response_models/specialty_response_model.dart';

class DoctorScreenModel {
  List<DoctorInfo>? listDoctor;
  List<ProvinceModel>? listProvince;
  List<SpecialtyModel>? listSpeciality;
  DoctorInfo? doctor;
}

class DoctorScreenParams {}
