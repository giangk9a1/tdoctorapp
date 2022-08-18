class LoginResponseModel {
  int? status;
  bool? success;
  Data? data;
  String? detail;

  LoginResponseModel({this.status, this.success, this.data, this.detail});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    detail = json['detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['detail'] = detail;
    return data;
  }
}

class Data {
  String? token;
  CurrentUser? currentUser;

  Data({this.token, this.currentUser});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    currentUser = json['current_user'] != null
        ? CurrentUser.fromJson(json['current_user'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    if (currentUser != null) {
      data['current_user'] = currentUser!.toJson();
    }
    return data;
  }
}

class CurrentUser {
  String? userId;
  String? email;
  String? emailInfo;
  String? fullname;
  String? phone;
  String? password;
  String? avatar;
  String? gender;
  String? userStatus;
  String? userTypeId;
  String? createdAt;
  String? updatedAt;
  String? useDate;
  String? paid;
  String? addpress;
  String? latLongAddress;
  bool? sex;
  String? idFacebook;
  String? idGoogle;
  String? present;
  String? balance;
  String? showPhone;
  String? referType;
  String? referId;
  String? provinceId;
  String? districtId;
  String? isSentMessage;
  String? isReferral;
  String? referralCode;

  CurrentUser(
      {this.userId,
      this.email,
      this.emailInfo,
      this.fullname,
      this.phone,
      this.password,
      this.avatar,
      this.gender,
      this.userStatus,
      this.userTypeId,
      this.createdAt,
      this.updatedAt,
      this.useDate,
      this.paid,
      this.addpress,
      this.latLongAddress,
      this.sex,
      this.idFacebook,
      this.idGoogle,
      this.present,
      this.balance,
      this.showPhone,
      this.referType,
      this.referId,
      this.provinceId,
      this.districtId,
      this.isSentMessage,
      this.isReferral,
      this.referralCode});

  CurrentUser.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    email = json['email'];
    emailInfo = json['email_info'];
    fullname = json['fullname'];
    phone = json['phone'];
    password = json['password'];
    avatar = json['avatar'];
    gender = json['gender'];
    userStatus = json['user_status'];
    userTypeId = json['user_type_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    useDate = json['use_date'];
    paid = json['paid'];
    addpress = json['addpress'];
    latLongAddress = json['lat_long_address'];
    sex = json['sex'];
    idFacebook = json['id_facebook'];
    idGoogle = json['id_google'];
    present = json['present'];
    balance = json['balance'];
    showPhone = json['show_phone'];
    referType = json['refer_type'];
    referId = json['refer_id'];
    provinceId = json['province_id'];
    districtId = json['district_id'];
    isSentMessage = json['isSentMessage'];
    isReferral = json['is_referral'];
    referralCode = json['referral_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['email'] = email;
    data['email_info'] = emailInfo;
    data['fullname'] = fullname;
    data['phone'] = phone;
    data['password'] = password;
    data['avatar'] = avatar;
    data['gender'] = gender;
    data['user_status'] = userStatus;
    data['user_type_id'] = userTypeId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['use_date'] = useDate;
    data['paid'] = paid;
    data['addpress'] = addpress;
    data['lat_long_address'] = latLongAddress;
    data['sex'] = sex;
    data['id_facebook'] = idFacebook;
    data['id_google'] = idGoogle;
    data['present'] = present;
    data['balance'] = balance;
    data['show_phone'] = showPhone;
    data['refer_type'] = referType;
    data['refer_id'] = referId;
    data['province_id'] = provinceId;
    data['district_id'] = districtId;
    data['isSentMessage'] = isSentMessage;
    data['is_referral'] = isReferral;
    data['referral_code'] = referralCode;
    return data;
  }
}
