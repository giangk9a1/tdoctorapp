import 'package:dio/dio.dart';
import 'package:graphql/client.dart';
import 'package:riverhotel/injector.dart';
import 'package:riverhotel/src/bloc/bloc.dart';
import 'package:riverhotel/src/config/app_config.dart';
import 'package:riverhotel/src/preferences/app_preference.dart';
import 'package:riverhotel/src/utilities/logger.dart';
import 'package:riverhotel/static_variable.dart';

class AppClient {
  Future<DataResult<dynamic>> getAPI(
      String path, Map<String, dynamic>? queryParameters) async {
    Dio? _dio;
    BaseOptions? _options;
    _options = BaseOptions(
      queryParameters: queryParameters,
      baseUrl: AppConfig().apiEndpoint,
      connectTimeout: 5000,
      receiveTimeout: 10000,
      validateStatus: (status) {
        return (status ?? 501) < 500 && status != 401;
      },
    );
    _dio = Dio(_options);
    _dio.interceptors.add(LogInterceptor(responseBody: true));
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      handler.next(options);
    }));
    final result = await _dio.get(path).catchError((onError) {
      DataResult.failure(APIFailure(onError.toString()));
    });
    return DataResult.success(result.data);
  }
}
