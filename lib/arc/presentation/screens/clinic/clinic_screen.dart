import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:riverhotel/arc/presentation/screens/clinic/widgets/widget.dart';
import '../../../../src/constants.dart';
import '../../widgets/commons/custom_app_bar.dart';
import '../../widgets/commons/dialog.dart';

class ClinicScreen extends StatefulWidget {
  const ClinicScreen({Key? key}) : super(key: key);
  @override
  State<ClinicScreen> createState() => _ClinicScreenState();
}

class _ClinicScreenState extends State<ClinicScreen> {
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
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: 10.0,bottom: 10.0,left: 15.0,right: 15.0),
        child: CustumsButtons1(onTap: (){}, text: 'Đặt khám ngay',color:theme.primaryColor, icons: IconData(0xe3ac, fontFamily: 'MaterialIcons'),),
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
      body: ListView(
        padding: EdgeInsets.all(10.0) ,
        children: [
          ItemClinic(context),
          SizedBox(height: 20,),
          ListDepartment(context),
          SizedBox(height: 20,),
          ListService(context),
          SizedBox(height: 20,),
          ListPay(context),
          SizedBox(height: 20,),
          ListInsurance(context),
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.only(top: 30.0,bottom: 30.0,left: 20.0,right: 20.0),
            child: Column(
              children: [
                ListBody(
                  children: [
                    Text('Tìm hiểu thêm về bảo lãnh viện phí và yêu cầu bồi thường',style: TextStyle(fontSize: 18.0,color: Colors.white,),textAlign: TextAlign.center,),
                  ],
                ),
                SizedBox(height: 20,),
                CustomButton2(onTap: (){}, text: 'Tìm hiểu thêm',width: 200,color: theme.backgroundColor,),
              ],
            ),
            decoration: BoxDecoration(
              color: theme.primaryColor,
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
      ),
    );
  }
}
Widget ItemClinic(BuildContext context){
  final theme = Theme.of(context);
  return Container(
        child: Column(
          children: [
            const CustumsTitle(text: "Đặt hẹn phòng khám"),
            SizedBox(height: 10),
            const BannerClinic(),
            const ItemInfo(
              image: ImageAssetPath.icLoca,
              text: "Lầu 1, toà nhà Mplaza, 39 Lê Duẩn, Bến Nghé, Q1",
              size: 14,
              color: Colors.black,
            ),
            const ItemInfo(
              image: ImageAssetPath.icClock,
              text: "07:00 - 22:00 hằng ngày",
              size: 14,
              color: Colors.black,
            ),
            Row(
              children: [
                Expanded(
                  child: CustumsButtons1(
                    onTap: () {},
                    icons: IconData(0xe3ac, fontFamily: 'MaterialIcons'),
                    text: "02873999789",
                    heigth: 40,
                    colorBg: Colors.white,
                    color: theme.primaryColor,
                  ),
                ),
                Expanded(
                  child: CustumsButtons1(
                    onTap: () {},
                    icons: IconData(0xe77f, fontFamily: 'MaterialIcons'),
                    text: "Chỉ đường",
                    heigth: 40,
                    colorBg: theme.primaryColor,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 10), // changes position of shadow
            ),
          ],
        )
    );
}
Widget ListDepartment(BuildContext context){
  final theme = Theme.of(context);
  return Container(
      child: Column(
        children: [
          const CustumsTitle(text: "Đặt hẹn khám ngay"),
          SizedBox(height: 20.0,),
          ItemDepartment(
            onTap: () {},
            image: ImageAssetPath.icDemo,
            text: 'Khám nội khoa',
            price: 500000,
            time: '28,04,2022',
          ),
          ItemDepartment(
            onTap: () {},
            image: ImageAssetPath.icDemo,
            text: 'Khám nội khoa',
            price: 500000,
            time: '28,04,2022',
          ),
          ItemDepartment(
            onTap: () {},
            image: ImageAssetPath.icDemo,
            text: 'Khám nội khoa',
            price: 500000,
            time: '28,04,2022',
          ),
          ItemDepartment(
            onTap: () {},
            image: ImageAssetPath.icDemo,
            text: 'Khám nội khoa',
            price: 500000,
            time: '28,04,2022',
          ),
          SizedBox(height: 20,),
          CustomButton2(onTap: (){}, text: 'Xem tất cả dịch vụ',color: Colors.white,width: 200,),
          SizedBox(height: 30,),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 10), // changes position of shadow
          ),
        ],
      ));

}
Widget ListService(BuildContext context){
  return Container(
      child: Column(
        children: [
          const CustumsTitle(text: "Các dịch vụ tại phòng khám"),
          SizedBox(
            height: 20.0,
          ),
          ItemService(text: 'Khoa Nhi',image: ImageAssetPath.icDemo,onTap: (){},imageICon: ImageAssetPath.icDrop,),
          ItemService(text: 'Khoa Nhi',image: ImageAssetPath.icDemo,onTap: (){},imageICon: ImageAssetPath.icDrop,),
          ItemService(text: 'Khoa Nhi',image: ImageAssetPath.icDemo,onTap: (){},imageICon: ImageAssetPath.icDrop,),
          ItemService(text: 'Khoa Nhi',image: ImageAssetPath.icDemo,onTap: (){},imageICon: ImageAssetPath.icDrop,),
          ItemService(text: 'Khoa Nhi',image: ImageAssetPath.icDemo,onTap: (){},imageICon: ImageAssetPath.icDrop,),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 10), // changes position of shadow
          ),
        ],
      ));

}
Widget ListPay(BuildContext context){
  return Container(
      child: Column(
        children: [
          const CustumsTitle(text: "Hình thức thanh toán"),
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              SizedBox(width: 2,),
              Expanded(
                child: ItemPay(
                  onTap: () {},
                  image: ImageAssetPath.icPay1,
                  text: 'Tiền mặt',
                ),
              ),
              SizedBox(width: 5,),
              Expanded(
                child: ItemPay(
                  onTap: () {},
                  image: ImageAssetPath.icPay2,
                  text: 'Thẻ tín dụng',
                ),
              ),
              SizedBox(width: 5,),
              Expanded(
                child: ItemPay(
                  onTap: () {},
                  image: ImageAssetPath.icPay3,
                  text: 'Momo',
                ),
              ),
              SizedBox(width: 2,),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 10), // changes position of shadow
          ),
        ],
      ));
}
Widget ListInsurance(BuildContext context){
  final theme = Theme.of(context);
  return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          const CustumsTitle(text: "Phạm vi bảo hiểm",fontSize: 18,),
          SizedBox(height: 10.0,),
          Container(
            margin: EdgeInsets.only(left: 2.0,bottom: 2.0,top: 12),
            child:ListBody(
              children: [
                Text('TDoctor đang liên kết với những đối tác bảo hiểm lớn sau đây nhằm '
                    'mang đến cho tất cả bệnh nhân dịch vụ chăm sóc sức khoẻ với chi phí tốt nhất',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10.0,),
                Row(
                  children: [
                    SizedBox(width: 2,),
                    Expanded(
                      child: ItemLogo(
                        onTap: () {},
                        image: ImageAssetPath.icLogo1,
                      ),
                    ),
                    SizedBox(width: 5,),
                    Expanded(
                      child: ItemLogo(
                        onTap: () {},
                        image: ImageAssetPath.icLogo2,
                      ),
                    ),
                    SizedBox(width: 5,),
                    Expanded(
                      child: ItemLogo(
                        onTap: () {},
                        image: ImageAssetPath.icLogo3,
                      ),
                    ),
                    SizedBox(width: 2,),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 2,),
                    Expanded(
                      child: ItemLogo(
                        onTap: () {},
                        image: ImageAssetPath.icLogo4,
                      ),
                    ),
                    SizedBox(width: 5,),
                    Expanded(
                      child: ItemLogo(
                        onTap: () {},
                        image: ImageAssetPath.icLogo5,
                      ),
                    ),
                    SizedBox(width: 5,),
                    Expanded(
                      child: ItemLogo(
                        onTap: () {},
                        image: ImageAssetPath.icLogo6,
                      ),
                    ),
                    SizedBox(width: 2,),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 10), // changes position of shadow
          ),
        ],
      )
  );
}
