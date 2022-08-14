import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:riverhotel/arc/presentation/widgets/commons/custom_app_bar.dart';
import 'package:riverhotel/arc/presentation/widgets/commons/dialog.dart';
import 'package:riverhotel/src/constants.dart';

class InviteScreen extends StatefulWidget {
  const InviteScreen({Key? key}) : super(key: key);

  @override
  State<InviteScreen> createState() => _InviteScreenState();
}

class _InviteScreenState extends State<InviteScreen> {
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
      body: Column(
        children: [
          Image.asset(ImageAssetPath.icInvite),
          Text("mời bạn bè và nhận thêm"),
          Text("100.000đ tiền thưởng"),
          Text(
              "Mã này sẽ giảm 100.000đ cho lần thăm khám đầu tiên. Khi đó bạn cũng sẽ nhận 100.000đ tiền thưởng cho lần thăm khám tiếp theo hoặc đơn hàng tại NhaThuocTDoctor.com")
        ],
      ),
    );
  }
}
