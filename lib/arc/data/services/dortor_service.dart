import 'package:riverhotel/arc/data/requests/base_req.dart';
import 'package:riverhotel/src/bloc/bloc.dart';
import 'package:riverhotel/src/data/base_service.dart';
import 'package:riverhotel/src/network/app_client.dart';

class DoctorService extends BaseService {
  final BaseReq baseReq;
  DoctorService(this.baseReq);

  Future<DataResult> getDoctor() async {
    return await client.request(
      baseReq.getDoctor,
      Method.get,
      useIDToken: true,
    );
  }
}