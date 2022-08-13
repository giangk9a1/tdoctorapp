import 'package:flutter/material.dart';

import '../../../../src/constants.dart';
import '../../widgets/widget.dart';
import 'confirm_phone_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).viewPadding.top),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Image.asset(
              ImageAssetPath.icLogo,
              height: 48,
              width: size.width,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Container(
              width: size.width,
              height: size.height,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  Text(
                    'QUÊN MẬT KHẨU',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: theme.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 40),
                  CustomTextfield.noBorder(
                    hindText: 'Nhập số điện thoại',
                    keyboardType: TextInputType.number,
                    preIcon: Image.asset(ImageAssetPath.icUser),
                  ),
                  const Spacer(),
                  CustomButton(
                      onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ConfirmPhoneScreen()),
                          ),
                      text: 'Tiếp theo'),
                  SizedBox(
                    height: MediaQuery.of(context).viewPadding.bottom + 10,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
