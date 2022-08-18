import 'package:flutter/material.dart';
import 'package:riverhotel/src/preferences/app_preference.dart';

import '../../../../../injector.dart';
import '../../../../../src/styles/style.dart';
import '../../../../../src/utilities/utilities.dart';
import '../../../../../translation_key.dart';
import 'common.dart';

final navigator = AppDependencies.injector.get<NavigationService>();
final appPreference = AppDependencies.injector.get<AppPreference>();

void showSuccessDialog({
  required BuildContext context,
  required String msg,
}) async {
  await showDialog(
    context: context,
    builder: (_) => AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(Dimens.defaultBorderRadius),
        ),
      ),
      content: Container(
        height: 200,
        decoration: const BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(Dimens.defaultBorderRadius)),
          gradient: LinearGradient(
            colors: [MyColors.whiteColor, Color.fromRGBO(225, 221, 248, 1)],
            stops: [0.0, 1.0],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //  SvgPicture.asset(ImageAssetPath.icSuccess),
            const SizedBox(height: Dimens.size10),
            Text(
              msg,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    ),
  );
}

void showConfirmDialog({
  required BuildContext context,
  required String msg,
  required VoidCallback onTap,
}) async {
  await showDialog(
    context: context,
    builder: (_) => AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(Dimens.defaultBorderRadius),
        ),
      ),
      content: Container(
        height: 200,
        decoration: const BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(Dimens.defaultBorderRadius)),
          gradient: LinearGradient(
            colors: [MyColors.whiteColor, Color.fromRGBO(225, 221, 248, 1)],
            stops: [0.0, 1.0],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: Dimens.size20),
            Text(msg, style: Theme.of(context).textTheme.headline2),
            const SizedBox(height: Dimens.size50),
            Row(
              children: [
                const SizedBox(width: Dimens.size20),
                Flexible(
                  child:
                      CustomButton(onTap: onTap, text: TranslationKey.yes.tr()),
                ),
                const SizedBox(width: Dimens.size20),
                Flexible(
                  child: CustomButton(
                      onTap: () => navigator.pop(),
                      text: TranslationKey.no.tr()),
                ),
                const SizedBox(width: Dimens.size20),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
