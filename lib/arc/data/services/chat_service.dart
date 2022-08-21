import 'dart:io';
import 'package:path/path.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverhotel/arc/data/models/request_models/request_models.dart';
import 'package:riverhotel/arc/presentation/widgets/commons/dialog.dart';
import 'package:riverhotel/src/config/app_config.dart';
import 'package:riverhotel/src/network/network.dart';
import 'package:riverhotel/src/utilities/utilities.dart';

import '../../../src/bloc/bloc.dart';
import '../../../src/data/data.dart';
import '../../../src/utilities/muti.dart';
import '../requests/requests.dart';
import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart' as p;

class ChatService extends BaseService {
  final BaseReq baseReq;
  ChatService(this.baseReq);

  Future<DataResult> getListRoom() async {
    return await client.request(
      baseReq.chatReq,
      Method.get,
      useIDToken: true,
    );
  }

  Future<DataResult> loadMessage(String roomID) async {
    return await client.request(
      baseReq.message,
      Method.post,
      useIDToken: true,
      body: {"create_room": roomID},
    );
  }

  Future<DataResult> sendMessage(SendMessageRequest sendMessageRequest) async {
    return await client.request(
      baseReq.sendMessage,
      Method.post,
      useIDToken: true,
      body: sendMessageRequest.toJson(),
    );
  }

  Future<DataResult> sendImage(
    SendMessageRequest sendMessageRequest,
    XFile file,
  ) async {
    FormData formData = FormData.fromMap(sendMessageRequest.toJson());
    formData.files.add(
      MapEntry(
        "file",
        MultipartFile.fromFileSync(
          file.path,
          filename: file.name,
          contentType: MediaType("image", "jpeg"),
        ),
      ),
    );
    LoggerUtils.d(formData.fields);
    return await client.requestFormData(
      baseReq.sendImage,
      Method.post,
      formData: formData,
      useIDToken: true,
    );
  }
}
