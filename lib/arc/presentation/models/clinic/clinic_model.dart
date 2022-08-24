import 'package:riverhotel/arc/data/models/response_models/clinic_response_model.dart';
import 'package:riverhotel/arc/data/models/response_models/province_response_model.dart';
import '../../../data/models/response_models/specialty_response_model.dart';

class ClinicScreenModel {
  List<ClinicInfo>? listClinic;
  List<ProvinceModel>? listProvince;
  List<SpecialtyModel>? listSpeciality;
  ClinicInfo? clinic;
}

class ClinicScreenParams {}
