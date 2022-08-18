import 'package:flutter/material.dart';
import 'package:riverhotel/arc/presentation/screens/clinic/widgets/title_custums.dart';

class StepCustum extends StatelessWidget {
  final String? text;
  final VoidCallback onTap;
  final IconData icons;
  final String? title;
  const StepCustum({
    Key? key,
    required this.onTap,
    required this.text,
    required this.icons,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
      padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
              child: CircleAvatar(
            radius: 20.0,
            backgroundColor: theme.primaryColor,
            child: Icon(icons),
          )),
          Expanded(
            flex: 5,
              child: ListTile(
            onTap: onTap,
            title: Text(
              title ?? '',
              style: TextStyle(
                color: theme.primaryColor,
                fontSize: 18.0,
              ),
            ),
            subtitle: ListBody(children: [
              Text(
                text ?? '',
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
