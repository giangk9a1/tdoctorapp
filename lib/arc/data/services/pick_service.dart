import 'package:flutter/material.dart';

class PickService {
  static String getProvinceName(String param) {
    var name;
    if (param.contains("Thành phố")) {
      name = param.substring(9);
    } else {
      name = param.substring(4);
    }
    return name;
  }

  static Future<DateTime?> pickDateTime(BuildContext context) async {
    DateTime? date = await pickDate(context);
    if (date == null) return null;
    TimeOfDay? time = await pickTime(context);
    if (time == null) return null;

    final dateTime =
        DateTime(date.year, date.month, date.day, time.hour, time.minute);
    return dateTime;
  }

  static Future<DateTime?> pickDate(BuildContext context) => showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100));

  static Future<TimeOfDay?> pickTime(BuildContext context) => showTimePicker(
      context: context, initialTime: const TimeOfDay(hour: 5, minute: 30));
}
