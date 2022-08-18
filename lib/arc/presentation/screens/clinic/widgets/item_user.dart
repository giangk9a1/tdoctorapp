import 'package:flutter/material.dart';
import 'package:riverhotel/arc/presentation/screens/clinic/widgets/title_custums.dart';
import '../../../../../src/constants.dart';
import 'custom_button2.dart';
import 'item_info.dart';
import 'package:riverhotel/arc/presentation/widgets/commons/common.dart';

class ItemUser extends StatelessWidget {
  final String image;
  final String text;
  final String time;
  final VoidCallback? onTap;
  const ItemUser({Key? key,
    required this.image,
    required this.text,
    required this.onTap,
    required this.time,
  })
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
                  radius: 32,
                ),
                radius: 40,
              ),
            ),
            Expanded(
                flex: 5,
                child: ListTile(
                  onTap: onTap,
                  title: Text(
                    text ?? '',
                    style: TextStyle(
                      color: theme.primaryColor,
                      fontSize: 18.0,
                    ),
                  ),
                  subtitle: ListBody(children: [
                    Text(
                      time ?? '',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0,
                      ),
                    )
                  ]),
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
        )
    );
  }
}
