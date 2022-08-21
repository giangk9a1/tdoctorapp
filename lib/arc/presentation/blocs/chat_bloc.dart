import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverhotel/arc/data/models/response_models/chat_response_model.dart';
import 'package:riverhotel/arc/presentation/models/models.dart';
import 'package:riverhotel/src/config/app_config.dart';
import 'package:riverhotel/src/utilities/utilities.dart';
import 'package:riverhotel/static_variable.dart';

import '../../../src/bloc/bloc.dart';
import '../../data/models/models.dart';
import '../../data/models/response_models/send_image_response_model.dart';
import '../../data/services/services.dart';

class ChatBloc extends BaseCubit<ChatScreenParam, ChatScreenModel> {
  final ChatService _service;
  ChatBloc(this._service) : super(InitialState());

  @override
  void initState() {
    super.initState();
    final params = ChatScreenParam();
    final model = ChatScreenModel();
    emit(LoadedState<ChatScreenParam, ChatScreenModel>(params, model));
  }

  Future<void> initData() async {
    if (latestLoadedState is LoadedState) {
      emit(latestLoadedState!.copyWith(isShowLoading: true));
      final result = await _service.getListRoom();
      final chatResponse = ChatResponseModel.fromJson(result.data);
      model.listRoom = chatResponse.data;
      emit(latestLoadedState!.copyWith(isShowLoading: false, model: model));
    }
  }

  Future<void> loadMessage(String roomID) async {
    if (latestLoadedState is LoadedState) {
      emit(latestLoadedState!.copyWith(isShowLoading: true));
      final result = await _service.loadMessage(roomID);
      final chatResponse = MessageResponseModel.fromJson(result.data);
      model.listMessage = chatResponse.data?.data;
      emit(latestLoadedState!.copyWith(isShowLoading: false, model: model));
    }
  }

  Future<void> sendMessage(SendMessageRequest sendMessageRequest) async {
    if (latestLoadedState is LoadedState) {
      emit(latestLoadedState!.copyWith(isShowLoading: true));
      final result = await _service.sendMessage(sendMessageRequest);
      final chatResponse = SendMessageResponse.fromJson(result.data);
      final listMessage = model.listMessage ?? [];
      listMessage.insertAll(0, [
        MessageModel(
          userId: StaticVariable.user?.userId,
          id: chatResponse.data?.id,
          createDate: chatResponse.data?.createdDate,
          message: chatResponse.data?.message,
        )
      ]);
      model.listMessage = listMessage;
      LoggerUtils.d(chatResponse.toJson());
      emit(latestLoadedState!.copyWith(isShowLoading: false, model: model));
    }
  }

  Future<void> sendImage(
    SendMessageRequest sendMessageRequest,
    XFile file,
  ) async {
    if (latestLoadedState is LoadedState) {
      emit(latestLoadedState!.copyWith(isShowLoading: true));
      final result = await _service.sendImage(sendMessageRequest, file);
      final chatResponse = SendImageResponse.fromJson(result.data);
      final listMessage = model.listMessage ?? [];
      listMessage.insertAll(0, [
        MessageModel(
          userId: StaticVariable.user?.userId,
          id: chatResponse.data?.id,
          message: chatResponse.data?.message,
          attach: chatResponse.attach,
        )
      ]);
      model.listMessage = listMessage;
      LoggerUtils.d(chatResponse.toJson());
      emit(latestLoadedState!.copyWith(isShowLoading: false, model: model));
    }
  }
}
