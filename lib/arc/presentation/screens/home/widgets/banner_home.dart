import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riverhotel/src/extensions/extension.dart';

import '../../../../../src/constants.dart';
import '../../../../../src/styles/style.dart';
import '../../../../../translation_key.dart';

class BannerHome extends StatefulWidget {
  const BannerHome({Key? key}) : super(key: key);

  @override
  State<BannerHome> createState() => _BannerHomeState();
}

class _BannerHomeState extends State<BannerHome> {
  final CarouselController _controller = CarouselController();
  int _currentIndex = 0;
  final List<String> _listImg = [
    ImageAssetPath.icBanner1,
    ImageAssetPath.icBanner1,
    ImageAssetPath.icBanner1,
    ImageAssetPath.icBanner1,
    ImageAssetPath.icBanner1
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: Dimens.size10),
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
            autoPlay: true,
            height: Dimens.size140,
            viewportFraction: 0.65,
            onPageChanged: (index, reason) {
              _currentIndex = index;
              setState(() {});
            },
          ),
          items: _listImg
              .map((i) => ClipRRect(
                  borderRadius:
                      BorderRadius.circular(Dimens.defaultBorderRadius),
                  child: Image.asset(i, fit: BoxFit.cover)))
              .toList(),
        ),
        const SizedBox(height: Dimens.size10),
      ],
    );
  }
}
