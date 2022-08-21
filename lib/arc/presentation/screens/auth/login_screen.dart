import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:riverhotel/arc/presentation/blocs/blocs.dart';
import 'package:riverhotel/src/config/route_keys.dart';

import '../../../../src/base_widget_state/base_cubit_stateful_widget.dart';
import '../../../../src/bloc/bloc.dart';
import '../../../../src/constants.dart';

import '../../../../src/styles/style.dart';
import '../../../data/models/models.dart';
import '../../models/models.dart';
import '../../widgets/widget.dart';
import 'forget_password.dart';
import 'register_screen.dart';
import 'widgets/hotline_button.dart';

class LoginScreen extends BaseCubitStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState
    extends BaseCubitStateFulWidgetState<LoginBloc, LoginScreen> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void listener(BuildContext context, BaseState state) {
    super.listener(context, state);
    if (state is LoadedState) {
      final model = state.model as LoginScreenModel;
      if (model.isRemember ?? false) {
        appPreference.username.then(
            (value) => _phoneController.text = value ?? _phoneController.text);
        appPreference.password.then((value) =>
            _passwordController.text = value ?? _passwordController.text);
      }
    }
  }

  @override
  Widget buildContent(BuildContext context, state) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final model = state.model as LoginScreenModel;

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
              height: Dimens.size48,
              width: size.width,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: Dimens.size10),
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
                    controller: _phoneController,
                    hindText: 'Nhập số điện thoại',
                    keyboardType: TextInputType.number,
                    preIcon: Image.asset(ImageAssetPath.icUser),
                  ),
                  CustomTextfield.noBorder(
                    isPassword: true,
                    controller: _passwordController,
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
                              onTap: () => bloc.changeRemember(),
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 500),
                                transitionBuilder: (Widget child,
                                    Animation<double> animation) {
                                  return ScaleTransition(
                                      scale: animation, child: child);
                                },
                                child: model.isRemember ?? false
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
                  const SizedBox(height: Dimens.size40),
                  CustomButton(
                      onTap: () => bloc.login(
                            _phoneController.text,
                            _passwordController.text,
                          ),
                      text: 'Đăng nhập'),
                  const SizedBox(height: Dimens.size40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        ImageAssetPath.icFacebook,
                        height: Dimens.size40,
                        width: Dimens.size40,
                      ),
                      const SizedBox(width: Dimens.size16),
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
                  const SizedBox(height: Dimens.size20),
                  const HotlineButton(),
                  SizedBox(
                    height: MediaQuery.of(context).viewPadding.bottom +
                        Dimens.size34,
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
