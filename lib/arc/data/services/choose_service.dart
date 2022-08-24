import '../../../src/data/data.dart';
import 'package:riverhotel/arc/data/requests/base_req.dart';
import 'package:riverhotel/src/bloc/bloc.dart';
import 'package:riverhotel/src/data/base_service.dart';
import 'package:riverhotel/src/network/app_client.dart';

class ChooseService extends BaseService {
  final BaseReq baseReq;

  ChooseService(this.baseReq);
}
