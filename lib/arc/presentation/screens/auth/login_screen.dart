import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:riverhotel/src/config/route_keys.dart';

import '../../../../src/constants.dart';

import '../../widgets/widget.dart';
import 'forget_password.dart';
import 'register_screen.dart';
import 'widgets/hotline_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isRemember = false;

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
                    'ĐĂNG NHẬP',
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
                  CustomTextfield.noBorder(
                    isPassword: true,
                    preIcon: Image.asset(ImageAssetPath.icPassword),
                    hindText: 'Nhập mật khẩu',
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgetPasswordScreen())),
                          child: const Text(
                            "Quên mật khẩu?",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                isRemember = !isRemember;
                                setState(() {});
                              },
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 500),
                                transitionBuilder: (Widget child,
                                    Animation<double> animation) {
                                  return ScaleTransition(
                                      scale: animation, child: child);
                                },
                                child: isRemember
                                    ? Image.asset(ImageAssetPath.icChecked)
                                    : Image.asset(ImageAssetPath.icCheck),
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'Ghi nhớ',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  CustomButton(
                      onTap: () => navigator.pushNamed(RouteKey.main),
                      text: 'Đăng nhập'),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(ImageAssetPath.icFacebook),
                      const SizedBox(width: 16),
                      Image.asset(ImageAssetPath.icGoogle),
                    ],
                  ),
                  const Spacer(),
                  RichText(
                    text: TextSpan(
                      text: 'Bạn chưa có tài khoản? ',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: 'Đăng ký ngay',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: theme.primaryColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterScreen())),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const HotlineButton(),
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
