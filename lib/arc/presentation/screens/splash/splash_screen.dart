import 'package:flutter/material.dart';
import 'package:riverhotel/arc/presentation/widgets/commons/dialog.dart';
import 'package:riverhotel/src/config/config.dart';

import '../../../../src/constants.dart';
import '../../../../src/styles/style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () => navigator.pushNamed(RouteKey.intro),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.backgroundColor,
      child: Center(
        child: Image.asset(
          ImageAssetPath.icSplash,
          height: Dimens.size60,
        ),
      ),
    );
  }
}
