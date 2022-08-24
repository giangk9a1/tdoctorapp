class DoctorResponseModel {
  int? status;
  Data? data;
  bool? success;
  String? message;

  DoctorResponseModel({this.status, this.data, this.success, this.message});

  DoctorResponseModel.fromJson(Map<String, dynamic> json) {
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
  List<DoctorInfo>? data;

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
      data = <DoctorInfo>[];
      json['data'].forEach((v) {
        data!.add(new DoctorInfo.fromJson(v));
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

class DoctorInfo {
  int? doctorId;
  String? userId;
  int? doctorClinicId;
  String? doctorName;
  String? doctorUrl;
  String? profileImage;
  String? doctorDescription;
  String? doctorFullinfo;
  String? clinicalAchievements;
  String? experience;
  String? training;
  String? doctorAddress;
  String? featured;
  String? provinceId;
  String? price;
  String? createdAt;
  String? updatedAt;
  String? orderDoctor;
  String? doctorTimework;
  String? doctorClinic;
  String? status;
  String? vote;
  String? top;
  String? supporterId;
  String? supporterId2;
  Doctorspeciality? doctorspeciality;
  List<dynamic>? rating;
  User? user;

  DoctorInfo(
      {this.doctorId,
      this.userId,
      this.doctorClinicId,
      this.doctorName,
      this.doctorUrl,
      this.profileImage,
      this.doctorDescription,
      this.doctorFullinfo,
      this.clinicalAchievements,
      this.experience,
      this.training,
      this.doctorAddress,
      this.featured,
      this.provinceId,
      this.price,
      this.createdAt,
      this.updatedAt,
      this.orderDoctor,
      this.doctorTimework,
      this.doctorClinic,
      this.status,
      this.vote,
      this.top,
      this.supporterId,
      this.supporterId2,
      this.doctorspeciality,
      this.rating,
      this.user});

  DoctorInfo.fromJson(Map<String, dynamic> json) {
    doctorId = json['doctor_id'];
    userId = json['user_id'];
    doctorClinicId = json['doctor_clinic_id'];
    doctorName = json['doctor_name'];
    doctorUrl = json['doctor_url'];
    profileImage = json['profile_image'];
    doctorDescription = json['doctor_description'];
    doctorFullinfo = json['doctor_fullinfo'];
    clinicalAchievements = json['clinical_achievements'];
    experience = json['experience'];
    training = json['training'];
    doctorAddress = json['doctor_address'];
    featured = json['featured'];
    provinceId = json['province_id'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    orderDoctor = json['order_doctor'];
    doctorTimework = json['doctor_timework'];
    doctorClinic = json['doctor_clinic'];
    status = json['status'];
    vote = json['vote'];
    top = json['top'];
    supporterId = json['supporter_id'];
    supporterId2 = json['supporter_id2'];
    doctorspeciality = json['doctorspeciality'] != null
        ? new Doctorspeciality.fromJson(json['doctorspeciality'])
        : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    rating = json['rating'] as List?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doctor_id'] = doctorId;
    data['user_id'] = userId;
    data['doctor_clinic_id'] = doctorClinicId;
    data['doctor_name'] = doctorName;
    data['doctor_url'] = doctorUrl;
    data['profile_image'] = profileImage;
    data['doctor_description'] = doctorDescription;
    data['doctor_fullinfo'] = doctorFullinfo;
    data['clinical_achievements'] = clinicalAchievements;
    data['experience'] = experience;
    data['training'] = training;
    data['doctor_address'] = doctorAddress;
    data['featured'] = featured;
    data['province_id'] = provinceId;
    data['price'] = price;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['order_doctor'] = orderDoctor;
    data['doctor_timework'] = doctorTimework;
    data['doctor_clinic'] = doctorClinic;
    data['status'] = status;
    data['vote'] = vote;
    data['top'] = top;
    data['supporter_id'] = supporterId;
    data['supporter_id2'] = supporterId2;
    data['rating'] = rating;
    if (doctorspeciality != null) {
      data['doctorspeciality'] = doctorspeciality!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class Doctorspeciality {
  String? specialityId;
  String? doctorId;
  Speciality? speciality;

  Doctorspeciality({this.specialityId, this.doctorId, this.speciality});

  Doctorspeciality.fromJson(Map<String, dynamic> json) {
    specialityId = json['speciality_id'];
    doctorId = json['doctor_id'];
    speciality = json['speciality'] != null
        ? new Speciality.fromJson(json['speciality'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['speciality_id'] = specialityId;
    data['doctor_id'] = doctorId;
    if (speciality != null) {
      data['speciality'] = speciality!.toJson();
    }
    return data;
  }
}

class Speciality {
  int? specialityId;
  String? specialityName;
  String? enSpecialityName;
  String? frSpecialityName;
  String? specialtyUrl;
  String? specialityImage;
  String? specialityDesc;

  Speciality(
      {this.specialityId,
      this.specialityName,
      this.enSpecialityName,
      this.frSpecialityName,
      this.specialtyUrl,
      this.specialityImage,
      this.specialityDesc});

  Speciality.fromJson(Map<String, dynamic> json) {
    specialityId = json['speciality_id'];
    specialityName = json['speciality_name'];
    enSpecialityName = json['en_speciality_name'];
    frSpecialityName = json['fr_speciality_name'];
    specialtyUrl = json['specialty_url'];
    specialityImage = json['speciality_image'];
    specialityDesc = json['speciality_desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['speciality_id'] = specialityId;
    data['speciality_name'] = specialityName;
    data['en_speciality_name'] = enSpecialityName;
    data['fr_speciality_name'] = frSpecialityName;
    data['specialty_url'] = specialtyUrl;
    data['speciality_image'] = specialityImage;
    data['speciality_desc'] = specialityDesc;
    return data;
  }
}

class User {
  String? userId;
  String? avatar;

  User({this.userId, this.avatar});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = userId;
    data['avatar'] = avatar;
    return data;
  }
}

class DoctorDetailResponseModel {
  int? status;
  DoctorInfo? data;
  bool? success;
  String? message;

  DoctorDetailResponseModel(
      {this.status, this.data, this.success, this.message});

  DoctorDetailResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new DoctorInfo.fromJson(json['data']) : null;
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
