import 'package:flutter/material.dart';

import '../../../../src/constants.dart';
import '../../widgets/widget.dart';
import '../auth/login_screen.dart';
import '../auth/register_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
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
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 100),
              Image.asset(ImageAssetPath.icIntro),
              const SizedBox(height: 36),
              Text(
                "An tâm sống khoẻ cùng \nTDoctor",
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.5,
                  fontWeight: FontWeight.w800,
                  fontSize: 24,
                  color: theme.primaryColor,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Chăm sóc sức khoẻ và tư vấn miễn phí",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              CustomButton(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen())),
                text: 'Đăng nhập',
              ),
              const SizedBox(height: 24),
              CustomButton(
                color: const Color(0xffFF4852),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterScreen())),
                text: 'Tạo tài khoản',
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
