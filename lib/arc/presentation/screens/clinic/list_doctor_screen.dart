import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../../../src/constants.dart';
import '../../widgets/commons/custom_app_bar.dart';
import 'package:flutter_svg/svg.dart';
import '../../widgets/commons/dialog.dart';
import 'package:riverhotel/arc/presentation/screens/clinic/widgets/widget.dart';

class ListDoctorScreen extends StatefulWidget {
  const ListDoctorScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ListDoctorScreenState();
}

class _ListDoctorScreenState extends State<ListDoctorScreen> {
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
        child: CustomButton2(onTap: (){}, text: 'Gọi hotline 02873999789',color:theme.primaryColor),
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
        children: [
          CustumsTitle(text: 'Gặp các bác sĩ của chúng tôi'),
          Container(
            margin: EdgeInsets.only(top: 5,bottom: 4,left: 10,right: 10),
            child: Text(
                'Ngày và giờ hiển thị theo giờ Việt Nam (GMT+7:00)'
                    ,style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ItemDoctor(
            onTap: (){},
            image: ImageAssetPath.icDemo,
            text: 'GS. TS. BS. Nguyễn Đức Công',
            time: '28,04,2022',
            onTap1: () {  },
          ),
          ItemDoctor(
            onTap: (){},
            image: ImageAssetPath.icDemo,
            text: 'GS. TS. BS. Nguyễn Đức Công',
            time: '28,04,2022',
            onTap1: () {  },
          ),
        ],
      ),
    );
  }
}
