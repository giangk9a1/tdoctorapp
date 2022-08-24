import '../../../src/data/data.dart';
import 'package:riverhotel/arc/data/requests/base_req.dart';
import 'package:riverhotel/src/bloc/bloc.dart';
import 'package:riverhotel/src/data/base_service.dart';
import 'package:riverhotel/src/network/app_client.dart';

class DoctorService extends BaseService {
  final BaseReq baseReq;
  static const LIMIT = 10;
  DoctorService(this.baseReq);

  Future<DataResult> getListDoctor(
      int page, int? province, String? speciality) async {
    return await client.request(
      baseReq.getListDoctor,
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

  Future<DataResult> getDetailDoctor(int doctorID) async {
    return await client.request(
      baseReq.getDetailDoctor + "$doctorID",
      Method.get,
      useIDToken: true,
    );
  }
}
