import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../../../src/constants.dart';
import '../../widgets/commons/custom_app_bar.dart';
import 'package:flutter_svg/svg.dart';
import '../../widgets/commons/dialog.dart';
import 'package:riverhotel/arc/presentation/screens/clinic/widgets/widget.dart';
class ProcessScreen extends StatefulWidget {
  const ProcessScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ProcessScreenState();
}

class _ProcessScreenState extends State<ProcessScreen> {
  @override
  Widget build(BuildContext context) {
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
          CustumsTitle(text: 'Quy trình bảo lãnh viện phí'),
          SizedBox(
            height: 10,
          ),
          StepCustum(
            text:
                "Cung cấp cho chúng tôi thẻ bảo hiểm của bạn, giấy tờ tuỳ thân (psssport, CMND/CCCD hoặc giấy khai sinh đối với trẻ em).",
            onTap: () {},
            icons: IconData(0xe19f, fontFamily: 'MaterialIcons'),
            title: 'Bước 1',
          ),
          StepCustum(
            text:
                "Dựa trên những lần thăm khám đã hoàn thành, nhân viên của chúng tôi sẽ tiến hành một quy trình xác nhận với công ty bảo hiểm dựa trên kết quả khám và chẩn đoán.",
            onTap: () {},
            icons: IconData(0xe3ac, fontFamily: 'MaterialIcons'),
            title: 'Bước 2',
          ),
          StepCustum(
            text:
                "Kể từ khi chúng tôi nhận được xác nhận thanh toán từ công ty bảo hiểm của bạn, bạn sẽ ký nhận một phiếu xác nhận yêu cầu bảo hiểm là tóm tắt những chi phí thăm khám và chi trả bất kỳ chi phí thuốc không được bảo lãnh bởi công ty bảo hiểm.",
            onTap: () {},
            icons: IconData(0xe3ac, fontFamily: 'MaterialIcons'),
            title: 'Bước 3',
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 2),
            child: Text.rich(TextSpan(
                text: '* ',
                style: TextStyle(
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                    color: Colors.yellow),
                children: <InlineSpan>[
                  TextSpan(
                    text:
                        'Chúng tôi hỗ trợ các bệnh nhân gửi Phiếu yêu cầu bồi thường bằng cách cung cấp tất cả những t'
                        'ài liệu cần thiết đến công ty bảo hiểm. Yêu cầu được thực hiện và bồi thường trong vòng 7 - 10 ngày làm việc.',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w200,
                        color: Colors.grey),
                  )
                ])),
          ),
        ],
      ),
    );
  }
}
