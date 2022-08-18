import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../../../src/constants.dart';
import '../../widgets/commons/custom_app_bar.dart';
import 'package:flutter_svg/svg.dart';
import '../../widgets/commons/dialog.dart';
import 'package:riverhotel/arc/presentation/screens/clinic/widgets/widget.dart';

class ListServiceScreen extends StatefulWidget {
  const ListServiceScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ListServiceScreenState();
}

class _ListServiceScreenState extends State<ListServiceScreen> {
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
          CustumsTitle(text: 'Tất cả dịch vụ'),
          SizedBox(
            height: 10,
          ),
          ItemDepartment(
            onTap: _modalBottomSheetMenu,
            image: ImageAssetPath.icDemo,
            text: 'Khám nội khoa',
            price: 500000,
            time: '28,04,2022',
          ),
          ItemDepartment(
            onTap: _modalBottomSheetMenu,
            image: ImageAssetPath.icDemo,
            text: 'Khám nội khoa',
            price: 500000,
            time: '28,04,2022',
          ),
          ItemDepartment(
            onTap: _modalBottomSheetMenu,
            image: ImageAssetPath.icDemo,
            text: 'Khám nội khoa',
            price: 500000,
            time: '28,04,2022',
          ),
          ItemDepartment(
            onTap: _modalBottomSheetMenu,
            image: ImageAssetPath.icDemo,
            text: 'Khám nội khoa',
            price: 500000,
            time: '28,04,2022',
          ),
        ],
      ),
    );
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
              height: 300,
              color:
                  Colors.transparent, //could change this to Color(0xFF737373),
              child: new Container(
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0))),
                child: ListView(
                  padding: const EdgeInsets.all(20.0),
                  children: [
                    SizedBox(height: 12),
                    Center(
                      child: Text(
                        'Đặt hẹn khám ngay',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    CustumsButtons1(
                      onTap: () {},
                      icons: IconData(0xe4a2, fontFamily: 'MaterialIcons'),
                      text: "02873999789",
                      heigth: 50,
                      colorBg: Colors.red,
                      color: Colors.white,
                    ),
                    Center(
                      child: Text(
                        'Hoặc',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    CustumsButtons1(
                      onTap: () {},
                      icons: IconData(0xee35, fontFamily: 'MaterialIcons'),
                      text: "Chọn bác sĩ cụ thể",
                      heigth: 50,
                      colorBg: Color.fromARGB(255, 8, 148, 217),
                      color: Colors.white,
                    ),
                  ],
                ),
              ));
        });
  }
}
