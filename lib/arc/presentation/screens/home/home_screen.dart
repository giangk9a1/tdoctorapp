import 'package:flutter/material.dart';
import 'package:riverhotel/arc/presentation/widgets/commons/common.dart';
import 'package:riverhotel/src/config/route_keys.dart';
import 'package:riverhotel/src/constants.dart';
import 'package:riverhotel/translation_key.dart';

import '../../../../src/styles/style.dart';
import 'home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: theme.primaryColor,
            child: Column(
              children: [
                const SizedBox(height: 50),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: Dimens.size16),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            TranslationKey.inviteTitle.tr(),
                            style: theme.textTheme.subtitle1,
                          ),
                          const SizedBox(height: Dimens.size6),
                          Text(
                            TranslationKey.inviteDescription.tr(),
                            style: theme.textTheme.headline4,
                          ),
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                          onTap: () => navigator.pushNamed(RouteKey.invite),
                          child: Container(
                            height: Dimens.size32,
                            padding: const EdgeInsets.symmetric(
                                horizontal: Dimens.size20),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: theme.backgroundColor,
                                borderRadius: BorderRadius.circular(
                                    Dimens.defaultBorderRadius)),
                            child: Text(
                              TranslationKey.inviteFriend.tr(),
                              style: theme.textTheme.button,
                            ),
                          ))
                    ],
                  ),
                ),
                const SizedBox(height: Dimens.size20),
                Container(
                  decoration: BoxDecoration(
                      color: theme.backgroundColor,
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(30))),
                  child: Column(
                    children: [
                      const SizedBox(height: Dimens.size20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ItemFeature(
                            onTap: () {},
                            color: const Color(0xff5DCEC1),
                            image: ImageAssetPath.icBackview,
                            text: TranslationKey.menuTestHome.tr(),
                          ),
                          ItemFeature(
                            onTap: () {},
                            color: const Color(0xff518FEC),
                            image: ImageAssetPath.icHealthcare,
                            text: TranslationKey.menuResult.tr(),
                          ),
                          ItemFeature(
                            onTap: () {},
                            color: const Color(0xffFB73AF),
                            spacing: 10,
                            image: ImageAssetPath.icProfessional,
                            text: TranslationKey.menuOnline.tr(),
                          )
                        ],
                      ),
                      const SizedBox(height: Dimens.size32),
                      Row(
                        children: [
                          ItemMenu(
                            onTap: () {},
                            image: ImageAssetPath.icDoctorHome,
                            text: TranslationKey.menuHome.tr(),
                          ),
                          ItemMenu(
                            onTap: () {},
                            image: ImageAssetPath.icDoctorVideo,
                            text: TranslationKey.menuVideo.tr(),
                          ),
                          ItemMenu(
                            onTap: () {},
                            image: ImageAssetPath.icDoctorChat,
                            text: TranslationKey.menuChat.tr(),
                          ),
                        ],
                      ),
                      const SizedBox(height: Dimens.size32),
                      Row(
                        children: [
                          ItemMenu(
                            onTap: () {},
                            image: ImageAssetPath.icAppointment,
                            text: TranslationKey.menuAppointment.tr(),
                          ),
                          ItemMenu(
                            onTap: () {},
                            image: ImageAssetPath.icDrugstore,
                            text: TranslationKey.menuDrugstore.tr(),
                          ),
                          ItemMenu(
                            onTap: () {},
                            image: ImageAssetPath.icHealth,
                            text: TranslationKey.menuHealth.tr(),
                          ),
                        ],
                      ),
                      const SizedBox(height: Dimens.size32),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(height: 10, color: const Color(0xffF0F5FA)),
          const SizedBox(height: Dimens.size16),
          const BannerHome()
        ],
      ),
    );
  }
}
