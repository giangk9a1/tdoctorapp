import 'package:flutter/material.dart';
import 'package:riverhotel/arc/presentation/screens/clinic/widgets/title_custums.dart';
import '../../../../../src/constants.dart';
import 'custom_button2.dart';
import 'item_info.dart';
import 'package:riverhotel/arc/presentation/widgets/commons/common.dart';

class ItemPay extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback? onTap;
  const ItemPay(
      {Key? key,
      required this.image,
      required this.text,
      required this.onTap,})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.only(top: 25.0,bottom: 25.0,left: 10,right: 10),
      margin: EdgeInsets.only(top: 10.0, bottom: 20.0),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              child:CircleAvatar(
                child: CircleAvatar(
                  child: Image.asset(image),
                  radius: 18,
                ),
                radius: 30,
              ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                )
            ),
            Container(
                margin: EdgeInsets.only(top: 4),
                child:Text(text
                ,style: TextStyle(fontSize: 13.0,color: Colors.black,fontWeight: FontWeight.w500),
                )
            ),
          ],
        ),
      ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        )
    );
  }
}
