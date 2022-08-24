import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:riverhotel/arc/data/models/response_models/province.dart';

class ProvinceService {
  static Future<List<dynamic>> initData(BuildContext context) async {
    final value = await DefaultAssetBundle.of(context)
        .loadString("assets/provinces.json")
        .catchError((e) {
      print("ERROR" + e);
    });
    print(value);
    return json.decode(value);
  }
}
