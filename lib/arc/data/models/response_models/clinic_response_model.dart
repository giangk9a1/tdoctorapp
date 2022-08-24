class ClinicResponseModel {
  int? status;
  Data? data;
  bool? success;
  String? message;

  ClinicResponseModel({this.status, this.data, this.success, this.message});

  ClinicResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['success'] = success;
    data['message'] = message;
    return data;
  }
}

class Data {
  int? total;
  String? perPage;
  int? currentPage;
  int? lastPage;
  String? nextPageUrl;
  String? prevPageUrl;
  int? from;
  int? to;
  List<ClinicInfo>? data;

  Data(
      {this.total,
      this.perPage,
      this.currentPage,
      this.lastPage,
      this.nextPageUrl,
      this.prevPageUrl,
      this.from,
      this.to,
      this.data});

  Data.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    lastPage = json['last_page'];
    nextPageUrl = json['next_page_url'];
    prevPageUrl = json['prev_page_url'];
    from = json['from'];
    to = json['to'];
    if (json['data'] != null) {
      data = <ClinicInfo>[];
      json['data'].forEach((v) {
        data!.add(new ClinicInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = total;
    data['per_page'] = perPage;
    data['current_page'] = currentPage;
    data['last_page'] = lastPage;
    data['next_page_url'] = nextPageUrl;
    data['prev_page_url'] = prevPageUrl;
    data['from'] = from;
    data['to'] = to;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ClinicInfo {
  int? clinicId;
  String? userId;
  String? clinicName;
  String? profileImage;
  String? clinicUrl;
  String? featured;
  String? clinicDesc;
  String? clinicAddress;
  String? clinicTime;
  String? clinicPhone;
  String? facilities;
  String? provinceId;
  String? price;
  String? districtId;
  String? createdAt;
  String? updatedAt;
  String? clinicTimeopen;
  String? vote;
  String? top;
  String? clinicNotification;
  String? clinicClinical;
  String? map;
  String? supporterId;
  String? supporterId2;

  ClinicInfo(
      {this.clinicId,
      this.userId,
      this.clinicName,
      this.profileImage,
      this.clinicUrl,
      this.featured,
      this.clinicDesc,
      this.clinicAddress,
      this.clinicTime,
      this.clinicPhone,
      this.facilities,
      this.provinceId,
      this.price,
      this.districtId,
      this.createdAt,
      this.updatedAt,
      this.clinicTimeopen,
      this.vote,
      this.top,
      this.clinicNotification,
      this.clinicClinical,
      this.map,
      this.supporterId,
      this.supporterId2});

  ClinicInfo.fromJson(Map<String, dynamic> json) {
    clinicId = json['clinic_id'];
    userId = json['user_id'];
    clinicName = json['clinic_name'];
    profileImage = json['profile_image'];
    clinicUrl = json['clinic_url'];
    featured = json['featured'];
    clinicDesc = json['clinic_desc'];
    clinicAddress = json['clinic_address'];
    clinicTime = json['clinic_time'];
    clinicPhone = json['clinic_phone'];
    facilities = json['facilities'];
    provinceId = json['province_id'];
    price = json['price'];
    districtId = json['district_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    clinicTimeopen = json['clinic_timeopen'];
    vote = json['vote'];
    top = json['top'];
    clinicNotification = json['clinic_notification'];
    clinicClinical = json['clinic_clinical'];
    map = json['map'];
    supporterId = json['supporter_id'];
    supporterId2 = json['supporter_id2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clinic_id'] = clinicId;
    data['user_id'] = userId;
    data['clinic_name'] = clinicName;
    data['profile_image'] = profileImage;
    data['clinic_url'] = clinicUrl;
    data['featured'] = featured;
    data['clinic_desc'] = clinicDesc;
    data['clinic_address'] = clinicAddress;
    data['clinic_time'] = clinicTime;
    data['clinic_phone'] = clinicPhone;
    data['facilities'] = facilities;
    data['province_id'] = provinceId;
    data['price'] = price;
    data['district_id'] = districtId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['clinic_timeopen'] = clinicTimeopen;
    data['vote'] = vote;
    data['top'] = top;
    data['clinic_notification'] = clinicNotification;
    data['clinic_clinical'] = clinicClinical;
    data['map'] = map;
    data['supporter_id'] = supporterId;
    data['supporter_id2'] = supporterId2;
    return data;
  }
}

class ClinicDetailResponseModel {
  int? status;
  ClinicInfo? data;
  bool? success;
  String? message;

  ClinicDetailResponseModel(
      {this.status, this.data, this.success, this.message});

  ClinicDetailResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new ClinicInfo.fromJson(json['data']) : null;
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}
