import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riverhotel/src/constants.dart';
import 'package:riverhotel/src/extensions/extension.dart';
import 'package:riverhotel/src/styles/dimens.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final String? subtitle;
  final Widget? leading;
  final bool hasLeading;
  final List<Widget>? action;
  const CustomAppBar({
    Key? key,
    this.title,
    this.leading,
    this.subtitle,
    this.action,
  })  : hasLeading = false,
        super(key: key);
  const CustomAppBar.withLeading({
    Key? key,
    this.title,
    this.subtitle,
    this.leading,
    this.action,
  })  : hasLeading = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: Colors.transparent,
        // Status bar brightness (optional)
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.dark, // For iOS (dark icons)
      ),
      backgroundColor: Colors.white,
      leading: hasLeading
          ? leading ??
              GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                      color: Colors.transparent,
                      height: Dimens.size50,
                      width: Dimens.size50,
                      child: SvgPicture.asset(ImageAssetPath.icBack,
                          fit: BoxFit.scaleDown)))
          : const SizedBox.shrink(),
      automaticallyImplyLeading: false,
      elevation: 0,
      actions: action,
      centerTitle: true,
      title: Text(title ?? '', style: theme.textTheme.headline1),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
