import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import '../../../../src/constants.dart';
import '../../widgets/commons/custom_app_bar.dart';
import 'package:flutter_svg/svg.dart';
import '../../widgets/commons/dialog.dart';
import 'package:riverhotel/arc/presentation/screens/clinic/widgets/widget.dart';
class ListUserDependentScreen extends StatefulWidget {
  const ListUserDependentScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ListUserDependentScreenState();
}

class _ListUserDependentScreenState extends State<ListUserDependentScreen> {
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
          CustumsTitle(text: 'Bạn đặt lịch cho ai?'),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(top: 10.0,bottom: 10.0,left: 15.0,right: 15.0),
            child: CustomButton2(onTap: (){}, text: 'Thêm người phụ thuộc',color:theme.primaryColor),
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
          ItemUser(text: 'Nguyễn Hoàng Minh',time: '22/11/1986',image: ImageAssetPath.icAvataDor,onTap: (){},),
        ],
      ),
    );
  }
}
