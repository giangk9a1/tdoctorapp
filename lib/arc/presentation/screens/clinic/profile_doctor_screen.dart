import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../../../src/constants.dart';
import '../../widgets/commons/custom_app_bar.dart';
import 'package:flutter_svg/svg.dart';
import '../../widgets/commons/dialog.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:riverhotel/arc/presentation/screens/clinic/widgets/widget.dart';

class ProfileDoctorScreen extends StatefulWidget {
  const ProfileDoctorScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ProfileDoctorScreenState();
}

class _ProfileDoctorScreenState extends State<ProfileDoctorScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: CustomAppBar.withLeading(
          action: [
            IconButton(
              onPressed: () => navigator.pop(),
              icon: SvgPicture.asset(ImageAssetPath.icNavHome),
            )
          ],
        ),
        body: ListView(
          children: [
            informDoctor(),
            inforIn(),
            educationAndExperience(),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(top: 10.0,bottom: 10.0,left: 15.0,right: 15.0),
              child: CustomButton2(onTap: (){}, text: 'Tiếp tục',color:theme.primaryColor),
              decoration: BoxDecoration(
                color: theme.backgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 10), // changes position of shadow
                  ),
                ],
              )
              ,),
          ],
        ));
  }
}
Widget inforIn(){
  return Container(
    child: Column(
      children: [
        StepCustum(
          text:
         "Hô hấp \nNội tổng quát",
          onTap: () {},
          icons: IconData(0xe3ac, fontFamily: 'MaterialIcons'),
          title: 'Chuyên khoa',
        ),
        StepCustum(
          text:
          "Đại học Y dược thành phố Hồ Chí Minh",
          onTap: () {},
          icons: IconData(0xe3ac, fontFamily: 'MaterialIcons'),
          title: 'Nơi đào tạo',
        ),
      ],
    ),
  );
}
Widget informDoctor() {
  return Center(
    child: Container(
      padding: EdgeInsets.fromLTRB(10.0, 15.0, 5.0, 5.0),
      child: Column(
        children:<Widget> [
          Container(
            child: CircleAvatar(
              child:  CircleAvatar(
                backgroundImage: AssetImage(ImageAssetPath.icAvataDor),
                radius: 170,
              ),
              radius: 180,
              backgroundColor: Colors.white,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              "GS. TS. BS. Nguyễn Đức Công",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Text(
              "-- Đã tiêm vaccie COVID 19 --",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Text(
              "Bác sĩ Nguyễn Đức Công chuyên điều trị tăng huyết áp,\nđái tháo đường, hen suyễn, bệnh phổi tắc nghẽn mãn\ntính đau nhức xương khớp, ho mãn tính...",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 5),
              child: RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              )),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Text(
              "124 đánh giá",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          color: const Color(0xffF2F9FF)),
    ),
  );
}
Widget educationAndExperience() {
  return Center(
    child: Container(
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 5.0, 5.0),
        child: Column(
          children: [
            textRow("Chuyên điều trị", [
              "Bệnh lý cơ xương khớp: thoái hoá khớp, thoái hoá khớp, thoát vị đĩa đệm,...",
              "Bệnh lý tự miễn: viêm khớp dạng thấp, lupus ban đỏ hệ thống, xơ cứng bì,..."
            ]),
            textRow("Quá trình công tác", [
              "2015 - nay: phòng khám dị ứng - miễn dịch lâm sàng, đại học Y dược TPHCM"
            ]),
            textRow("Đào tạo trong nước", [
              "2010 - 2014: bác sĩ nội trú chuyên ngành nội khoa, đại học Y dược TPHCM"
            ]),
            textRow("Đào tạo liên tục", [
              "2018:",
              "2019:"
            ]),
          ],
        ),
        decoration:DottedDecoration(
            shape: Shape.box,
            borderRadius: BorderRadius.circular(10),
            dash: <int>[5,10]
        )
    ),
  );
}
Widget textRow(String title, List<String> content) {
  return Center(
    child: Container(
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Icon(Icons.verified_sharp,color:Color(0xff5ECEC2)),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              )
          ),
          Container(
              child: Column(
                children: [
                  for (String text in content)
                    Container(
                        margin: EdgeInsets.only(left: 12),
                        child: Row(
                          children: [
                            Container(
                              width: 8.0,
                              height: 8.0,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black
                              ),
                            ),
                            Expanded(
                                child: ListTile(
                                  title: Text(text,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),),))
                          ],
                        )
                    ),
                ],
              )),
        ],
      ),
    ),
  );
}