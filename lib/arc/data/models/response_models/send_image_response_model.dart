import '../models.dart';
import 'login_response_model.dart';

class SendImageResponse {
  bool? status;
  String? imageUrl;
  Attach? attach;
  MessageModel? data;
  int? dataId;
  int? createdDate;

  SendImageResponse(
      {this.status,
      this.imageUrl,
      this.attach,
      this.data,
      this.dataId,
      this.createdDate});

  SendImageResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    imageUrl = json['image_url'];
    attach = json['attach'] != null ? Attach.fromJson(json['attach']) : null;
    data = json['data'] != null ? MessageModel.fromJson(json['data']) : null;
    dataId = json['data_id'];
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['image_url'] = imageUrl;
    if (attach != null) {
      data['attach'] = attach!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['data_id'] = dataId;
    data['created_date'] = createdDate;
    return data;
  }
}
