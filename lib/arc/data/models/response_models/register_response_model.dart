class RegisterResponseModel {
  int? status;
  bool? success;
  String? detail;

  RegisterResponseModel({this.status, this.success, this.detail});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    detail = json['detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success'] = success;
    data['detail'] = detail;
    return data;
  }
}
