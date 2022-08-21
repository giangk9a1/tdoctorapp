import 'send_message_response.dart';

class MessageResponseModel {
  int? status;
  bool? success;
  DataChat? data;

  MessageResponseModel({this.status, this.success, this.data});

  MessageResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    data = json['data'] != null ? DataChat.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataChat {
  int? total;
  int? perPage;
  int? currentPage;
  int? lastPage;

  int? from;
  int? to;
  List<MessageModel>? data;

  DataChat(
      {this.total,
      this.perPage,
      this.currentPage,
      this.lastPage,
      this.from,
      this.to,
      this.data});

  DataChat.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    lastPage = json['last_page'];

    from = json['from'];
    to = json['to'];
    if (json['data'] != null) {
      data = <MessageModel>[];
      json['data'].forEach((v) {
        data!.add(MessageModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['per_page'] = perPage;
    data['current_page'] = currentPage;
    data['last_page'] = lastPage;

    data['from'] = from;
    data['to'] = to;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MessageModel {
  int? id;
  String? userId;
  String? roomId;
  String? message;
  String? messageType;
  String? messageStatus;
  String? createDate;
  Attach? attach;

  MessageModel(
      {this.id,
      this.userId,
      this.roomId,
      this.message,
      this.messageType,
      this.messageStatus,
      this.createDate,
      this.attach});

  MessageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    roomId = json['room_id'].toString();
    message = json['message'];
    messageType = json['message_type'].toString();
    messageStatus = json['message_status'];
    createDate = json['create_date'];
    attach = json['attach'] != null ? Attach.fromJson(json['attach']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['room_id'] = roomId;
    data['message'] = message;
    data['message_type'] = messageType;
    data['message_status'] = messageStatus;
    data['create_date'] = createDate;
    if (attach != null) {
      data['attach'] = attach!.toJson();
    }
    return data;
  }
}
