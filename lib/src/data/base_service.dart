import 'package:riverhotel/injector.dart';
import 'package:riverhotel/src/network/app_client.dart';

abstract class BaseService {
  final client = AppDependencies.injector.get<AppClient>();
}
