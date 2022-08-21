class SendMessageResponse {
  int? status;
  MessageResponse? data;
  bool? success;
  String? message;

  SendMessageResponse({this.status, this.data, this.success, this.message});

  SendMessageResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? MessageResponse.fromJson(json['data']) : null;
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['success'] = success;
    data['message'] = message;
    return data;
  }
}

class MessageResponse {
  String? userId;
  int? roomId;
  String? message;
  int? id;
  int? dataId;
  String? createdDate;
  Attach? attach;

  MessageResponse(
      {this.userId,
      this.roomId,
      this.attach,
      this.message,
      this.id,
      this.dataId,
      this.createdDate});

  MessageResponse.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    roomId = json['room_id'];
    message = json['message'];
    id = json['id'];
    dataId = json['data_id'];
    createdDate = json['created_date'];
    attach = json['attach'] != null ? Attach.fromJson(json['attach']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['room_id'] = roomId;
    data['message'] = message;
    data['id'] = id;
    data['data_id'] = dataId;
    data['created_date'] = createdDate;
    if (attach != null) {
      data['attach'] = attach!.toJson();
    }
    return data;
  }
}

class Attach {
  int? id;
  String? messageId;
  String? userId;
  String? fileName;
  String? url;
  String? details;
  String? status;
  String? createDate;

  Attach(
      {this.id,
      this.messageId,
      this.userId,
      this.fileName,
      this.url,
      this.details,
      this.status,
      this.createDate});

  Attach.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    messageId = json['message_id'].toString();
    userId = json['user_id'];
    fileName = json['file_name'];
    url = json['url'];
    details = json['details'].toString();
    status = json['status'].toString();
    createDate = json['create_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['message_id'] = messageId;
    data['user_id'] = userId;
    data['file_name'] = fileName;
    data['url'] = url;
    data['details'] = details;
    data['status'] = status;
    data['create_date'] = createDate;
    return data;
  }
}
