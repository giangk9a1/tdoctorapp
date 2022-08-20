import 'package:riverhotel/src/data/data.dart';

import '../../../src/bloc/bloc.dart';
import '../../../src/network/app_client.dart';
import '../requests/base_req.dart';

class DoctorProfileService extends BaseService {
  final BaseReq baseReq;

  DoctorProfileService(this.baseReq);

  Future<DataResult> getDoctor(int doctorId) async {
    return await client.request(
        baseReq.doctorProfileReq + "$doctorId", Method.get,
        useIDToken: true);
  }
}
