import 'package:flutter/material.dart';
import 'package:riverhotel/arc/presentation/widgets/commons/dialog.dart';
import 'package:riverhotel/src/config/config.dart';

import '../../../../src/base_widget_state/base_cubit_stateful_widget.dart';
import '../../../../src/constants.dart';
import '../../../../src/styles/style.dart';
import '../../blocs/blocs.dart';

class SplashScreen extends BaseCubitStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState
    extends BaseCubitStateFulWidgetState<SplashBloc, SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero).then((value) {
      bloc.fetchProvinces(context);
    });
  }

  @override
  Widget buildContent(BuildContext context, state) {
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
