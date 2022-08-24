import 'package:flutter/material.dart';
import 'package:riverhotel/src/styles/colors.dart';
import 'package:riverhotel/src/styles/style.dart';

class SymptomTextField extends StatelessWidget {
  const SymptomTextField({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.2,
      width: size.width,
      child: Column(children: const [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Triệu chứng",
              style: TextStyle(color: MyColors.black, fontSize: Dimens.size14),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextField(
            style: TextStyle(color: Colors.black),
            minLines: 3,
            maxLines: 8,
            decoration: InputDecoration(
              hintText: 'Chào bác sĩ, em có triệu chứng này cần bác sĩ tư vấn',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ]),
    );
  }
}
