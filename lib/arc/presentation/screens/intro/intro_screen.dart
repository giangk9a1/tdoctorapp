import 'package:flutter/material.dart';
import 'package:riverhotel/src/config/route_keys.dart';
import 'package:riverhotel/translation_key.dart';

import '../../../../src/constants.dart';
import '../../../../src/styles/style.dart';
import '../../widgets/widget.dart';

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
              const SizedBox(height: Dimens.size100),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimens.size16),
                child: Image.asset(ImageAssetPath.icIntro),
              ),
              const SizedBox(height: Dimens.size36),
              Text(
                TranslationKey.slogan.tr(),
                textAlign: TextAlign.center,
                style: theme.textTheme.headline1,
              ),
              const SizedBox(height: Dimens.size12),
              Text(
                TranslationKey.subLogan.tr(),
                style: theme.textTheme.caption,
              ),
              const Spacer(),
              CustomButton(
                onTap: () => navigator.pushNamed(RouteKey.login),
                text: TranslationKey.login.tr(),
              ),
              const SizedBox(height: Dimens.size24),
              CustomButton(
                color: MyColors.errorColor,
                onTap: () => navigator.pushNamed(RouteKey.register),
                text: TranslationKey.createAccount.tr(),
              ),
              const SizedBox(height: Dimens.size24),
            ],
          ),
        ),
      ),
    );
  }
}
