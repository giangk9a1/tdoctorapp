import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../../../src/constants.dart';
import '../../widgets/commons/custom_app_bar.dart';
import 'package:flutter_svg/svg.dart';
import '../../widgets/commons/dialog.dart';
import 'package:riverhotel/arc/presentation/screens/clinic/widgets/widget.dart';
class ReasonScreen extends StatefulWidget {
  const ReasonScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ReasonScreenState();
}

class _ReasonScreenState extends State<ReasonScreen> {
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
      body: ListView(
        children: [
          CustumsTitle(text: 'Lý do hẹn khám'),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
           child:ListBody(
             children: [
               Text('Vui lòng miêu tả triệu chứng, để lại câu hỏi hoặc dấu hiệu để các Bác sĩ có thể chuẩn bị tốt nhất.'
                 ,style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w300),
               ),
             ],
           ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 8,
                  maxLength: 255,
                  style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w400),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
