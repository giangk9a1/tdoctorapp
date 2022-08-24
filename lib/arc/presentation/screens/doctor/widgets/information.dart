import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:riverhotel/src/styles/style.dart';

import '../../../../data/models/response_models/doctor_response_model.dart';
import '../doctor.dart';

class Information extends StatelessWidget {
  const Information({Key? key, required this.size, required this.data})
      : super(key: key);

  final Size size;
  final DoctorInfo? data;

  int _calculateRating(List<dynamic> rating) {
    if (rating.isEmpty) {
      return 5;
    }
    int sum = 0;
    rating.forEach((element) {
      sum += int.parse(element['number_star']);
    });
    return sum ~/ 5;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.35,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.01,
          ),
          Text(
            'TDOCTOR: BS${data?.doctorId ?? "90123"}',
            style: Theme.of(context).textTheme.headline4!.copyWith(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Expanded(
              child: Image.network(
            'https://tdoctor.vn/public/images/doctor/${data?.profileImage ?? 'drlethiphuongthao.jpg'}',
            width: 150,
          )),
          SizedBox(
            height: size.height * 0.01,
          ),
          RatingBar.builder(
            initialRating: 5,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            ignoreGestures: true,
            itemSize: 30,
            itemCount: _calculateRating(data?.rating ?? []),
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Text(
            'Số nhận xét: 0',
            style: TextStyle(
                fontSize: Dimens.size14,
                color: Color.fromARGB(255, 15, 15, 18)),
          ),
          SizedBox(
            height: 5,
          ),
          Text('Số câu trả lời: 0',
              style: TextStyle(fontSize: Dimens.size14, color: MyColors.black)),
        ],
      ),
    );
  }
}
