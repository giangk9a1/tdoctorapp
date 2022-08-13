import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../src/constants.dart';
import '../../widgets/widget.dart';
import 'new_password_screen.dart';
import 'widgets/button_resend.dart';

class ConfirmAccountScreen extends StatefulWidget {
  const ConfirmAccountScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmAccountScreen> createState() => _ConfirmAccountScreenState();
}

class _ConfirmAccountScreenState extends State<ConfirmAccountScreen> {
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
                    'XÁC THỰC TÀI KHOẢN',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: theme.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 40),
                  RichText(
                    text: const TextSpan(
                      text:
                          'Chúng tôi đã gửi mã OTP về SMS cho số điện thoại\n',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: '+84 919999789',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.red,
                          ),
                        ),
                        TextSpan(
                          text: ', vui lòng nhập mã dưới đây:',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: PinCodeTextField(
                      appContext: context,
                      length: 4,
                      obscureText: true,
                      cursorColor: const Color.fromRGBO(128, 141, 176, 1),

                      textStyle: theme.textTheme.bodyText1,
                      //  controller: _otpController,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        fieldHeight: size.width * 0.14,
                        fieldWidth: size.width * 0.14,
                        shape: PinCodeFieldShape.box,
                        activeFillColor: Colors.white,
                        inactiveFillColor: Colors.white,
                        selectedFillColor: Colors.white,
                        activeColor: const Color.fromRGBO(128, 141, 176, 1),
                        selectedColor: const Color.fromRGBO(128, 141, 176, 1),
                        inactiveColor: const Color.fromRGBO(128, 141, 176, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      keyboardType: TextInputType.number,
                      animationDuration: const Duration(milliseconds: 300),
                      backgroundColor: Colors.transparent,
                      enableActiveFill: true,
                      onCompleted: (v) {
                        // LoggerUtils.d("Completed");
                      },
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(height: 24),
                  RichText(
                    text: const TextSpan(
                      text:
                          '    Vui lòng chờ mã xác thực \nhoặc nhấn gửi lại mã sau ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: '00:15',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const ButtonResend(),
                  const Spacer(),
                  CustomButton(
                      onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const NewPasswordScreen()),
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
