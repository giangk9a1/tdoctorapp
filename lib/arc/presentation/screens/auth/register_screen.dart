import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:riverhotel/arc/presentation/blocs/register_bloc.dart';

import '../../../../src/base_widget_state/base_cubit_stateful_widget.dart';
import '../../../../src/constants.dart';
import '../../../../src/styles/style.dart';
import '../../blocs/blocs.dart';
import '../../models/models.dart';
import '../../widgets/widget.dart';
import 'confirm_account_screen.dart';
import 'login_screen.dart';
import 'widgets/hotline_button.dart';

class RegisterScreen extends BaseCubitStatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState
    extends BaseCubitStateFulWidgetState<RegisterBloc, RegisterScreen> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _referController = TextEditingController();

  @override
  Widget buildContent(BuildContext context, state) {
    final model = state.model as RegisterScreenModel;
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    'ĐĂNG KÝ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: theme.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 40),
                  CustomTextfield.noBorder(
                    controller: _phoneController,
                    hindText: 'Nhập số điện thoại',
                    preIcon: Image.asset(ImageAssetPath.icUser),
                    keyboardType: TextInputType.number,
                  ),
                  CustomTextfield.noBorder(
                    controller: _passwordController,
                    hindText: 'Nhập mật khẩu',
                    isPassword: true,
                    preIcon: Image.asset(ImageAssetPath.icPassword),
                  ),
                  const SizedBox(height: 10),
                  CustomTextfield.noBorder(
                    controller: _referController,
                    hindText: 'Nhập mã giới thiệu (không bắt buộc)',
                    preIcon: Image.asset(ImageAssetPath.icUser),
                  ),
                  const SizedBox(height: 40),
                  CustomButton(
                      onTap: () => bloc.register(
                            _phoneController.text,
                            _passwordController.text,
                            _referController.text,
                          ),
                      text: 'Đăng ký'),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        ImageAssetPath.icFacebook,
                        height: Dimens.size40,
                        width: Dimens.size40,
                      ),
                      const SizedBox(width: 16),
                      Image.asset(
                        ImageAssetPath.icGoogle,
                        height: Dimens.size40,
                        width: Dimens.size40,
                      ),
                    ],
                  ),
                  const Spacer(),
                  RichText(
                    text: TextSpan(
                      text: 'Bạn đã có tài khoản? ',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: 'Đăng nhập ngay',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: theme.primaryColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen())),
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
