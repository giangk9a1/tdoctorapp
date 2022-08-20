class DoctorResponseModel {
  final int? status;
  final Data? data;
  final List<dynamic>? error;
  final bool? success;
  final String? message;

  DoctorResponseModel({
    this.status,
    this.data,
    this.error,
    this.success,
    this.message,
  });

  DoctorResponseModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        data = (json['data'] as Map<String, dynamic>?) != null
            ? Data.fromJson(json['data'] as Map<String, dynamic>)
            : null,
        error = json['error'] as List?,
        success = json['success'] as bool?,
        message = json['message'] as String?;

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.toJson(),
        'error': error,
        'success': success,
        'message': message
      };
}

class Data {
  final int? doctorId;
  final String? userId;
  final dynamic doctorClinicId;
  final String? doctorName;
  final String? doctorUrl;
  final String? profileImage;
  final String? doctorDescription;
  final dynamic doctorFullinfo;
  final String? clinicalAchievements;
  final String? experience;
  final String? training;
  final String? doctorAddress;
  final String? featured;
  final dynamic provinceId;
  final dynamic price;
  final String? createdAt;
  final String? updatedAt;
  final String? orderDoctor;
  final String? doctorTimework;
  final String? doctorClinic;
  final String? status;
  final String? vote;
  final String? top;
  final String? supporterId;
  final String? supporterId2;
  final Doctorspeciality? doctorspeciality;
  final List<Language>? language;
  final List<dynamic>? rating;

  Data({
    this.doctorId,
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
    this.language,
    this.rating,
  });

  Data.fromJson(Map<String, dynamic> json)
      : doctorId = json['doctor_id'] as int?,
        userId = json['user_id'] as String?,
        doctorClinicId = json['doctor_clinic_id'],
        doctorName = json['doctor_name'] as String?,
        doctorUrl = json['doctor_url'] as String?,
        profileImage = json['profile_image'] as String?,
        doctorDescription = json['doctor_description'] as String?,
        doctorFullinfo = json['doctor_fullinfo'],
        clinicalAchievements = json['clinical_achievements'] as String?,
        experience = json['experience'] as String?,
        training = json['training'] as String?,
        doctorAddress = json['doctor_address'] as String?,
        featured = json['featured'] as String?,
        provinceId = json['province_id'],
        price = json['price'],
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        orderDoctor = json['order_doctor'] as String?,
        doctorTimework = json['doctor_timework'] as String?,
        doctorClinic = json['doctor_clinic'] as String?,
        status = json['status'] as String?,
        vote = json['vote'] as String?,
        top = json['top'] as String?,
        supporterId = json['supporter_id'] as String?,
        supporterId2 = json['supporter_id2'] as String?,
        doctorspeciality =
            (json['doctorspeciality'] as Map<String, dynamic>?) != null
                ? Doctorspeciality.fromJson(
                    json['doctorspeciality'] as Map<String, dynamic>)
                : null,
        language = (json['language'] as List?)
            ?.map((dynamic e) => Language.fromJson(e as Map<String, dynamic>))
            .toList(),
        rating = json['rating'] as List?;

  Map<String, dynamic> toJson() => {
        'doctor_id': doctorId,
        'user_id': userId,
        'doctor_clinic_id': doctorClinicId,
        'doctor_name': doctorName,
        'doctor_url': doctorUrl,
        'profile_image': profileImage,
        'doctor_description': doctorDescription,
        'doctor_fullinfo': doctorFullinfo,
        'clinical_achievements': clinicalAchievements,
        'experience': experience,
        'training': training,
        'doctor_address': doctorAddress,
        'featured': featured,
        'province_id': provinceId,
        'price': price,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'order_doctor': orderDoctor,
        'doctor_timework': doctorTimework,
        'doctor_clinic': doctorClinic,
        'status': status,
        'vote': vote,
        'top': top,
        'supporter_id': supporterId,
        'supporter_id2': supporterId2,
        'doctorspeciality': doctorspeciality?.toJson(),
        'language': language?.map((e) => e.toJson()).toList(),
        'rating': rating
      };
}

class Doctorspeciality {
  final String? specialityId;
  final String? doctorId;
  final Speciality? speciality;

  Doctorspeciality({
    this.specialityId,
    this.doctorId,
    this.speciality,
  });

  Doctorspeciality.fromJson(Map<String, dynamic> json)
      : specialityId = json['speciality_id'] as String?,
        doctorId = json['doctor_id'] as String?,
        speciality = (json['speciality'] as Map<String, dynamic>?) != null
            ? Speciality.fromJson(json['speciality'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'speciality_id': specialityId,
        'doctor_id': doctorId,
        'speciality': speciality?.toJson()
      };
}

class Speciality {
  final int? specialityId;
  final String? specialityName;
  final String? enSpecialityName;
  final String? frSpecialityName;
  final String? specialtyUrl;
  final String? specialityImage;
  final String? specialityDesc;

  Speciality({
    this.specialityId,
    this.specialityName,
    this.enSpecialityName,
    this.frSpecialityName,
    this.specialtyUrl,
    this.specialityImage,
    this.specialityDesc,
  });

  Speciality.fromJson(Map<String, dynamic> json)
      : specialityId = json['speciality_id'] as int?,
        specialityName = json['speciality_name'] as String?,
        enSpecialityName = json['en_speciality_name'] as String?,
        frSpecialityName = json['fr_speciality_name'] as String?,
        specialtyUrl = json['specialty_url'] as String?,
        specialityImage = json['speciality_image'] as String?,
        specialityDesc = json['speciality_desc'] as String?;

  Map<String, dynamic> toJson() => {
        'speciality_id': specialityId,
        'speciality_name': specialityName,
        'en_speciality_name': enSpecialityName,
        'fr_speciality_name': frSpecialityName,
        'specialty_url': specialtyUrl,
        'speciality_image': specialityImage,
        'speciality_desc': specialityDesc
      };
}

class Language {
  final dynamic languageId;
  final dynamic doctorId;
  final Language? language;

  Language({
    this.languageId,
    this.doctorId,
    this.language,
  });

  Language.fromJson(Map<String, dynamic> json)
      : languageId = json['language_id'],
        doctorId = json['doctor_id'],
        language = (json['language'] as Map<String, dynamic>?) != null
            ? Language.fromJson(json['language'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'language_id': languageId,
        'doctor_id': doctorId,
        'language': language?.toJson()
      };
}
