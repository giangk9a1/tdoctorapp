class RegisterRequestModel {
  String? mobilePhone;
  String? password;
  String? referId;

  RegisterRequestModel({this.mobilePhone, this.password, this.referId});

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    mobilePhone = json['mobile_phone'];
    password = json['password'];
    referId = json['refer_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mobile_phone'] = mobilePhone;
    data['password'] = password;
    data['refer_id'] = referId;
    return data;
  }
}
