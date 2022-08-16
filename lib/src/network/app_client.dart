// ignore_for_file: non_constant_identifier_names

import 'dart:collection';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:riverhotel/arc/presentation/widgets/commons/dialog.dart';
import 'package:riverhotel/src/bloc/bloc.dart';
import 'package:riverhotel/src/config/app_config.dart';
import 'package:riverhotel/src/utilities/utilities.dart';

enum Method { post, put, patch, delete, get }

class AppClient {
  final dio = Dio();

  Future<dynamic> request(
    url,
    Method method, {
    body,
    params,
    useIDToken = true,
  }) async {
    dio
      ..options.baseUrl = AppConfig().apiEndpoint
      ..options.connectTimeout = 5000
      ..options.receiveTimeout = 5000
      ..httpClientAdapter
      ..options.headers = {'Content-Type': 'application/json; charset=UTF-8'};
    if (useIDToken) {
      final token = await appPreference.token;
      if (token != null) dio.options.headers["Tdoctor-Token"] = token;
    }

    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: false,
          responseHeader: false,
          request: false,
          requestBody: false));
    }

    try {
      if (method == Method.post) {
        final result = await dio.post(url, data: body, queryParameters: params);
        return DataResult.success(result.data);
      } else if (method == Method.put) {
        final result = await dio.put(url, data: body, queryParameters: params);
        return DataResult.success(result.data);
      } else if (method == Method.patch) {
        final result =
            await dio.patch(url, data: body, queryParameters: params);
        return DataResult.success(result.data);
      } else if (method == Method.delete) {
        final result = await dio.delete(url, queryParameters: params);
        return DataResult.success(result.data);
      }
      final result = await dio.get(url, queryParameters: params);
      return DataResult.success(result.data);
    } catch (e) {
      return DataResult.failure(APIFailure(e.toString()));
    }
  }

  Future<dynamic> requestUploadImage(url, Method method, File file) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path, filename: fileName),
    });

    return await request(url, method, body: formData);
  }
}
