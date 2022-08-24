import '../../../src/data/data.dart';
import 'package:riverhotel/arc/data/requests/base_req.dart';
import 'package:riverhotel/src/bloc/bloc.dart';
import 'package:riverhotel/src/data/base_service.dart';
import 'package:riverhotel/src/network/app_client.dart';

class ClinicService extends BaseService {
  final BaseReq baseReq;
  static const LIMIT = 10;
  ClinicService(this.baseReq);

  Future<DataResult> getListClinic(
      int page, int? province, String? speciality) async {
    return await client.request(
      baseReq.getListClinic,
      Method.get,
      useIDToken: true,
      params: {
        "limit": LIMIT,
        "page": page,
        "province": province ?? null,
        "speciality": speciality ?? null
      },
    );
  }

  Future<DataResult> getListProvince() async {
    return await client.request(
      baseReq.getListProvince,
      Method.get,
      useIDToken: true,
    );
  }

  Future<DataResult> getListSpeciality() async {
    return await client.request(
      baseReq.getListSpeciality,
      Method.get,
      useIDToken: true,
    );
  }

  Future<DataResult> getDetailClinic(String clinicId) async {
    return await client.request(
      baseReq.getListSpeciality,
      Method.get,
      useIDToken: true,
      params: {"clinic_id": clinicId},
    );
  }
}
