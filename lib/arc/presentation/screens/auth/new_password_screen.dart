import 'package:flutter/material.dart';

import '../../../../src/constants.dart';
import '../../widgets/widget.dart';
import 'confirm_phone_screen.dart';
import 'widgets/item_required.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
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
                    'TẠO MẬT KHẨU MỚI',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: theme.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 40),
                  CustomTextfield.noBorder(
                    isPassword: true,
                    preIcon: Image.asset(ImageAssetPath.icPassword),
                    hindText: 'Nhập mật khẩu',
                  ),
                  const SizedBox(height: 20),
                  const ItemRequired(
                    complete: true,
                    requiredText: 'Ít nhất 8 ký tự',
                  ),
                  const SizedBox(height: 10),
                  const ItemRequired(
                    complete: false,
                    requiredText: 'Bao gồm chữ cái',
                  ),
                  const SizedBox(height: 10),
                  const ItemRequired(
                    complete: true,
                    requiredText: 'Bao gồm số',
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
