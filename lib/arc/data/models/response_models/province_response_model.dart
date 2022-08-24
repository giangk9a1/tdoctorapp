class ProvinceResponseModel {
  int? status;
  List<ProvinceModel>? data;
  bool? success;
  String? message;

  ProvinceResponseModel({this.status, this.data, this.success, this.message});

  ProvinceResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <ProvinceModel>[];
      json['data'].forEach((v) {
        data!.add(new ProvinceModel.fromJson(v));
      });
    }
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = success;
    data['message'] = message;
    return data;
  }
}

class ProvinceModel {
  int? id;
  String? name;

  ProvinceModel({this.id, this.name});

  ProvinceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
