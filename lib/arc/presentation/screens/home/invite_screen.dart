import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:riverhotel/arc/presentation/widgets/commons/custom_app_bar.dart';
import 'package:riverhotel/arc/presentation/widgets/commons/custom_button.dart';
import 'package:riverhotel/arc/presentation/widgets/commons/dialog.dart';
import 'package:riverhotel/src/constants.dart';

import '../../../../src/styles/style.dart';

class InviteScreen extends StatefulWidget {
  const InviteScreen({Key? key}) : super(key: key);

  @override
  State<InviteScreen> createState() => _InviteScreenState();
}

class _InviteScreenState extends State<InviteScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(30)),
              gradient: const LinearGradient(
                  colors: [
                    Color.fromRGBO(86, 180, 253, 1),
                    // Color.fromRGBO(125, 197, 253, 1),
                    // Color.fromRGBO(160, 213, 254, 1),
                    // Color.fromRGBO(189, 226, 254, 1),
                    // Color.fromRGBO(214, 237, 255, 1),
                    // Color.fromRGBO(232, 245, 255, 1),
                    Color.fromRGBO(245, 251, 255, 1)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                CustomAppBar.withLeading(
                  action: [
                    IconButton(
                      onPressed: () => navigator.pop(),
                      icon: SvgPicture.asset(
                        ImageAssetPath.icNavHome,
                        color: const Color.fromRGBO(27, 29, 44, 1),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: Dimens.size44),
                  child: Image.asset(ImageAssetPath.icInvite),
                ),
                const SizedBox(height: Dimens.size20),
                Text(
                  "MỜI BẠN BÈ VÀ NHẬN THÊM",
                  style: theme.textTheme.caption,
                ),
                const SizedBox(height: Dimens.size12),
                Text(
                  "100.000đ TIỀN THƯỞNG",
                  style: theme.textTheme.headline1,
                ),
                const SizedBox(height: Dimens.size30),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: Dimens.size16),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Mã này sẽ ',
                      style: theme.textTheme.caption,
                      children: [
                        TextSpan(
                          text: 'giảm 100.000đ',
                          style: theme.textTheme.caption
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                            text:
                                ' cho lần thăm khám đầu tiên. Khi đó bạn cũng sẽ ',
                            style: theme.textTheme.caption),
                        TextSpan(
                          text: 'nhận 100.000đ ',
                          style: theme.textTheme.caption
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text:
                              'tiền thưởng cho lần thăm khám tiếp theo hoặc đơn hàng tại NhaThuocTDoctor.com',
                          style: theme.textTheme.caption,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: Dimens.size20),
              ],
            ),
          ),
          const SizedBox(height: Dimens.size24),
          Container(
            height: Dimens.size48,
            margin: const EdgeInsets.symmetric(horizontal: Dimens.size16),
            padding: const EdgeInsets.symmetric(horizontal: Dimens.size12),
            decoration: BoxDecoration(
              color: theme.backgroundColor,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  height: Dimens.size32,
                  padding:
                      const EdgeInsets.symmetric(horizontal: Dimens.size10),
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "M22W2",
                    style: theme.primaryTextTheme.caption,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    SvgPicture.asset(ImageAssetPath.icCopy),
                    const SizedBox(width: Dimens.size10),
                    Text(
                      'Sao chép',
                      style: theme.primaryTextTheme.bodyText2,
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: Dimens.size24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: Dimens.size16),
              const Expanded(child: Divider()),
              const SizedBox(width: Dimens.size4),
              Text('HOẶC', style: theme.textTheme.headline3),
              const SizedBox(width: Dimens.size4),
              const Expanded(child: Divider()),
              const SizedBox(width: Dimens.size16),
            ],
          ),
          const SizedBox(height: Dimens.size24),
          CustomButton(
            onTap: () {},
            text: 'Chia sẻ mã khuyến mãi',
          ),
          const SizedBox(height: Dimens.size24),
        ],
      ),
    );
  }
}
