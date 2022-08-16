import 'package:riverhotel/arc/data/models/request_models/request_models.dart';
import 'package:riverhotel/arc/presentation/models/models.dart';
import 'package:riverhotel/src/network/network.dart';

import '../../../src/bloc/bloc.dart';
import '../../../src/data/data.dart';
import '../requests/requests.dart';

class AuthService extends BaseService {
  final BaseReq baseReq;
  AuthService(this.baseReq);

  Future<DataResult> login(LoginRequestModel loginRequestModel) async {
    return await client.request(
      baseReq.loginReq,
      Method.post,
      useIDToken: false,
      body: loginRequestModel.toJson(),
    );
  }

  Future<DataResult> register(RegisterRequestModel registerRequestModel) async {
    return await client.request(
      baseReq.registerReq,
      Method.post,
      useIDToken: false,
      body: registerRequestModel.toJson(),
    );
  }

  Future<DataResult> existedPhone(String phone) async {
    return await client.request(
      baseReq.existedPhoneReq,
      Method.get,
      useIDToken: false,
      params: {"mobile_phone": phone},
    );
  }
}
