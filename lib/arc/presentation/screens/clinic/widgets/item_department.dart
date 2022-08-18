import 'package:flutter/material.dart';
import 'package:riverhotel/arc/presentation/screens/clinic/widgets/title_custums.dart';
import '../../../../../src/constants.dart';
import 'custom_button2.dart';
import 'item_info.dart';
import 'package:riverhotel/arc/presentation/widgets/commons/common.dart';

class ItemDepartment extends StatelessWidget {
  final String image;
  final String text;
  final int? price;
  final String ? time;
  final VoidCallback? onTap;
  const ItemDepartment(
      {Key? key,
      required this.image,
      required this.text,
      required this.onTap,
      required this.price, required this.time})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 5.0,left: 5),
      padding: EdgeInsets.all(4),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: CircleAvatar(
                child: CircleAvatar(
                  child: Image.asset(image),
                  radius: 26,
                ),
                radius: 40,
              ),
            ),
            Expanded(
                flex: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustumsTitle(text: text,fontSize: 17,),
                    ItemInfo(
                      image: ImageAssetPath.icTime,
                      text: 'Lịch đặt tiếp theo ${time}, 15:00 ',
                      color: Colors.grey,
                      size: 14.0,
                    ),
                    SizedBox(height: 5,),
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child:CustomButton2(onTap: (){}, text: '${price}',width: 110,color: theme.backgroundColor,),
                    )
                  ],
                )),
          ],
        ),
      ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
    );
  }



}
