class SpecialtyResponseModel {
  int? status;
  List<SpecialtyModel>? data;
  bool? success;
  String? message;

  SpecialtyResponseModel({this.status, this.data, this.success, this.message});

  SpecialtyResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <SpecialtyModel>[];
      json['data'].forEach((v) {
        data!.add(new SpecialtyModel.fromJson(v));
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

class SpecialtyModel {
  String? specialtyUrl;
  String? specialtyName;

  SpecialtyModel({this.specialtyUrl, this.specialtyName});

  SpecialtyModel.fromJson(Map<String, dynamic> json) {
    specialtyUrl = json['specialty_url'];
    specialtyName = json['speciality_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['specialty_url'] = specialtyUrl;
    data['speciality_name'] = specialtyName;
    return data;
  }
}
