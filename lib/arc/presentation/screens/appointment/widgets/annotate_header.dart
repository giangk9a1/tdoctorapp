import 'package:flutter/material.dart';

import '../../../../data/models/response_models/doctor_response_model.dart';

class AnnotateHeader extends StatelessWidget {
  const AnnotateHeader({
    Key? key,
    required this.doctor,
    required this.size,
  }) : super(key: key);

  final DoctorInfo? doctor;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, top: 20),
          child: Text(
            'Bạn đang đặt lịch khám với ${doctor?.doctorName}',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        SizedBox(height: size.height * 0.01),
        const Padding(
          padding: EdgeInsets.only(left: 12, top: 20, right: 10),
          child: Text(
            'Phí khám bệnh là 200k/1 ca tư vấn, trong đó bạn có thể: nhắn tin, gọi điện, gọi video với bác sĩ',
            style: TextStyle(fontSize: 20, color: Colors.pink),
          ),
        ),
        const Padding(
          padding: const EdgeInsets.only(left: 12, top: 10, right: 10),
          child: Text(
            'Bạn hãy điền đầy đủ thông tin lịch hẹn vào bên dưới để hệ thống xác nhận',
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 12, top: 10),
          child: Text(
            'Hỗ trợ: Sđt/Zalo: 0393167234, hoặc chat với của chúng tôi',
            style: TextStyle(fontSize: 12, color: Colors.red),
          ),
        ),
      ],
    );
  }
}
