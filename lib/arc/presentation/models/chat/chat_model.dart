import 'package:riverhotel/arc/data/models/response_models/chat_response_model.dart';
import 'package:riverhotel/arc/data/models/response_models/response_models.dart';

class ChatScreenModel {
  List<RoomModel>? listRoom;
  List<MessageModel>? listMessage;
  ChatScreenModel({
    this.listRoom,
    this.listMessage,
  });
}

class ChatScreenParam {}
