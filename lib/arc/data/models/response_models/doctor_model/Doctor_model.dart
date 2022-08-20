import 'dart:convert';

import 'Data.dart';

DoctorModel doctorModelFromJson(String str) => DoctorModel.fromJson(json.decode(str));
String doctorModelToJson(DoctorModel data) => json.encode(data.toJson());
class DoctorModel {
  DoctorModel({
      this.status, 
      this.data, 
      this.success, 
      this.message,});

  DoctorModel.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    success = json['success'];
    message = json['message'];
  }
  num? status;
  Data? data;
  bool? success;
  String? message;
DoctorModel copyWith({  num? status,
  Data? data,
  bool? success,
  String? message,
}) => DoctorModel(  status: status ?? this.status,
  data: data ?? this.data,
  success: success ?? this.success,
  message: message ?? this.message,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['success'] = success;
    map['message'] = message;
    return map;
  }

}