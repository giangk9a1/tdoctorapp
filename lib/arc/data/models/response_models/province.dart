class Province {
  final String? name;
  final int? code;
  final String? codename;
  final String? divisionType;
  final int? phoneCode;
  final List<Districts>? districts;

  Province({
    this.name,
    this.code,
    this.codename,
    this.divisionType,
    this.phoneCode,
    this.districts,
  });

  Province.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        code = json['code'] as int?,
        codename = json['codename'] as String?,
        divisionType = json['division_type'] as String?,
        phoneCode = json['phone_code'] as int?,
        districts = (json['districts'] as List?)
            ?.map((dynamic e) => Districts.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'name': name,
        'code': code,
        'codename': codename,
        'division_type': divisionType,
        'phone_code': phoneCode,
        'districts': districts?.map((e) => e.toJson()).toList()
      };
}

class Districts {
  final String? name;
  final int? code;
  final String? codename;
  final String? divisionType;
  final String? shortCodename;
  final List<Wards>? wards;

  Districts({
    this.name,
    this.code,
    this.codename,
    this.divisionType,
    this.shortCodename,
    this.wards,
  });

  Districts.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        code = json['code'] as int?,
        codename = json['codename'] as String?,
        divisionType = json['division_type'] as String?,
        shortCodename = json['short_codename'] as String?,
        wards = (json['wards'] as List?)
            ?.map((dynamic e) => Wards.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'name': name,
        'code': code,
        'codename': codename,
        'division_type': divisionType,
        'short_codename': shortCodename,
        'wards': wards?.map((e) => e.toJson()).toList()
      };
}

class Wards {
  final String? name;
  final int? code;
  final String? codename;
  final String? divisionType;
  final String? shortCodename;

  Wards({
    this.name,
    this.code,
    this.codename,
    this.divisionType,
    this.shortCodename,
  });

  Wards.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        code = json['code'] as int?,
        codename = json['codename'] as String?,
        divisionType = json['division_type'] as String?,
        shortCodename = json['short_codename'] as String?;

  Map<String, dynamic> toJson() => {
        'name': name,
        'code': code,
        'codename': codename,
        'division_type': divisionType,
        'short_codename': shortCodename
      };
}
