class ChatResponseModel {
  int? status;
  List<RoomModel>? data;
  bool? success;
  String? message;

  ChatResponseModel({this.status, this.data, this.success, this.message});

  ChatResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <RoomModel>[];
      json['data'].forEach((v) {
        data!.add(RoomModel.fromJson(v));
      });
    }
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = success;
    data['message'] = message;
    return data;
  }
}

class RoomModel {
  int? id;
  String? name;
  String? createdBy;
  String? createdDate;
  String? createdAt;
  String? updatedAt;

  List<Members>? members;
  List<LatestMessages>? latestMessages;

  RoomModel(
      {this.id,
      this.name,
      this.createdBy,
      this.createdDate,
      this.createdAt,
      this.updatedAt,
      this.members,
      this.latestMessages});

  RoomModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdBy = json['created_by'];
    createdDate = json['created_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];

    if (json['members'] != null) {
      members = <Members>[];
      json['members'].forEach((v) {
        members!.add(Members.fromJson(v));
      });
    }
    if (json['latest_messages'] != null) {
      latestMessages = <LatestMessages>[];
      json['latest_messages'].forEach((v) {
        latestMessages!.add(LatestMessages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_by'] = createdBy;
    data['created_date'] = createdDate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;

    if (members != null) {
      data['members'] = members!.map((v) => v.toJson()).toList();
    }
    if (latestMessages != null) {
      data['latest_messages'] = latestMessages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Members {
  String? userId;
  String? fullname;
  String? userTypeId;
  String? present;

  Members({this.userId, this.fullname, this.userTypeId, this.present});

  Members.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    fullname = json['fullname'];
    userTypeId = json['user_type_id'];
    present = json['present'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['fullname'] = fullname;
    data['user_type_id'] = userTypeId;
    data['present'] = present;
    return data;
  }
}

class LatestMessages {
  int? id;
  String? userId;
  String? roomId;
  String? message;
  String? messageType;
  String? messageStatus;
  String? createDate;

  LatestMessages(
      {this.id,
      this.userId,
      this.roomId,
      this.message,
      this.messageType,
      this.messageStatus,
      this.createDate});

  LatestMessages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    roomId = json['room_id'];
    message = json['message'];
    messageType = json['message_type'];
    messageStatus = json['message_status'];
    createDate = json['create_date'];
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
    return data;
  }
}
