import 'package:flutter/material.dart';
import 'package:riverhotel/src/utilities/utilities.dart';

import '../../../../src/styles/style.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey.withOpacity(0.3),
      height: size.height,
      width: size.width,
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(microseconds: 550),
          alignment: Alignment.center,
          curve: Curves.fastOutSlowIn,
          padding: const EdgeInsets.all(Dimens.size30),
          decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(Dimens.defaultBorderRadius)),
          height: ResponsiveLayout.isTablet(context)
              ? size.width * 0.2
              : size.width * 0.3,
          width: ResponsiveLayout.isTablet(context)
              ? size.width * 0.2
              : size.width * 0.3,
          // child: Image.asset(
          //   ImageAssetPath.loadingCircle,
          //   fit: BoxFit.contain,
          // ),
        ),
      ),
    );
  }
}
