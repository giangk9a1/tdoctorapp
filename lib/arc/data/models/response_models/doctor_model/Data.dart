import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.total,
      this.perPage, 
      this.currentPage, 
      this.lastPage, 
      this.nextPageUrl, 
      this.prevPageUrl, 
      this.from, 
      this.to, 
      this.data,});

  Data.fromJson(dynamic json) {
    total = json['total'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    lastPage = json['last_page'];
    nextPageUrl = json['next_page_url'];
    prevPageUrl = json['prev_page_url'];
    from = json['from'];
    to = json['to'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  num? total;
  String? perPage;
  num? currentPage;
  num? lastPage;
  String? nextPageUrl;
  dynamic prevPageUrl;
  num? from;
  num? to;
  List<Data>? data;
Data copyWith({  num? total,
  String? perPage,
  num? currentPage,
  num? lastPage,
  String? nextPageUrl,
  dynamic prevPageUrl,
  num? from,
  num? to,
  List<Data>? data,
}) => Data(  total: total ?? this.total,
  perPage: perPage ?? this.perPage,
  currentPage: currentPage ?? this.currentPage,
  lastPage: lastPage ?? this.lastPage,
  nextPageUrl: nextPageUrl ?? this.nextPageUrl,
  prevPageUrl: prevPageUrl ?? this.prevPageUrl,
  from: from ?? this.from,
  to: to ?? this.to,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = total;
    map['per_page'] = perPage;
    map['current_page'] = currentPage;
    map['last_page'] = lastPage;
    map['next_page_url'] = nextPageUrl;
    map['prev_page_url'] = prevPageUrl;
    map['from'] = from;
    map['to'] = to;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}