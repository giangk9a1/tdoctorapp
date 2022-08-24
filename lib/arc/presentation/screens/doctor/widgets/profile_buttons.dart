import 'package:flutter/material.dart';

import '../../../../data/models/response_models/doctor_response_model.dart';
import '../doctor.dart';

class ProfileButtons extends StatelessWidget {
  const ProfileButtons({Key? key, required this.size, required this.data})
      : super(key: key);

  final Size size;
  final DoctorInfo? data;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.4,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Row(
              children: [
                OutlinedButton(
                  child: Text('Hỏi miễn phí'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    fixedSize: Size(120, 50),
                    onPrimary: Colors.white,
                    primary: Colors.greenAccent,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.1,
                ),
                OutlinedButton(
                  child: Text('Đặt khám riêng tư'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    fixedSize: Size(120, 50),
                    onPrimary: Colors.white,
                    primary: Colors.greenAccent,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton(
              child: Text(
                  'CHAT VỚI ${data?.doctorName?.toUpperCase() ?? 'THẠC SĨ - BÁC SĨ NỘI TRÚ LÊ THỊ PHƯƠNG THẢO'}'),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                fixedSize: Size(double.infinity, 70),
                onPrimary: Colors.white,
                primary: Colors.red,
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: OutlinedButton(
              child: Text('Chat ngay với hỗ trợ viên'),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                fixedSize: Size(double.infinity, 50),
                onPrimary: Colors.white,
                primary: Colors.greenAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
