import 'package:dio/dio.dart';

class SendMessageRequest {
  String? chatTo;
  String? createRoom;
  String? currentID;
  String? clientName;
  String? myName;
  String? message;
  MultipartFile? file;

  SendMessageRequest(
      {this.chatTo,
      this.createRoom,
      this.currentID,
      this.clientName,
      this.file,
      this.myName,
      this.message});

  SendMessageRequest.fromJson(Map<String, dynamic> json) {
    chatTo = json['chat_to'];
    createRoom = json['create_room'];
    currentID = json['currentID'];
    clientName = json['clientName'];
    myName = json['myName'];
    message = json['message'];
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chat_to'] = chatTo;
    data['create_room'] = createRoom;
    data['currentID'] = currentID;
    data['clientName'] = clientName;
    data['myName'] = myName;
    data['message'] = message;
    data['file'] = file;
    return data;
  }
}
