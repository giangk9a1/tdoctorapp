import 'package:flutter/material.dart';
import 'package:riverhotel/arc/presentation/screens/clinic/widgets/title_custums.dart';
import '../../../../../src/constants.dart';
import 'custom_button2.dart';
import 'item_info.dart';
import 'package:riverhotel/arc/presentation/widgets/commons/common.dart';

class ItemService extends StatelessWidget {
  final String image;
  final String imageICon;
  final String text;
  final VoidCallback? onTap;
  const ItemService(
      {Key? key,
      required this.image,
      required this.imageICon,
      required this.text,
      required this.onTap,})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 20.0),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 10,),
            Expanded(
              flex: 1,
              child: CircleAvatar(
                child: CircleAvatar(
                  child: Image.asset(image),
                  radius: 15,
                ),
                radius: 25,
              ),
            ),
            SizedBox(width: 10,),
            Expanded(
                flex: 3,
                child:Text(text
                ,style: TextStyle(fontSize: 16.0,color: Colors.black),
                )
            ),
            Spacer(),
            Expanded(
              flex: 1,
              child: CircleAvatar(
                child: CircleAvatar(
                  child: Image.asset(imageICon),
                  radius: 15,
                ),
                radius: 15,
              ),
            ),
          ],
        ),
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
    );
  }
}
