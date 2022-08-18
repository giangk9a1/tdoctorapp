import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:riverhotel/src/constants.dart';
import 'package:riverhotel/src/styles/style.dart';

class BannerClinic extends StatefulWidget {
  const BannerClinic({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BannerClinicState();
}

class _BannerClinicState extends State<BannerClinic> {
  final CarouselController _controller = CarouselController();
  int _currentIndex = 0;
  final List<String> _listImgs = [
    ImageAssetPath.icBannerClinic1,
    ImageAssetPath.icBannerClinic2,
    ImageAssetPath.icBannerClinic1,
    ImageAssetPath.icBannerClinic2,
    ImageAssetPath.icBannerClinic1,
    ImageAssetPath.icBannerClinic2,
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
            autoPlay: false,
            height: Dimens.size200,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              _currentIndex = index;
              setState(() {});
            },
          ),
          items: _listImgs
              .map((i) => ClipRRect(
                  borderRadius:
                      BorderRadius.circular(Dimens.defaultBorderRadius),
                  child: Image.asset(i, fit: BoxFit.cover)))
              .toList(),
        ),
        Positioned(
          bottom: 13.0,
          child: Container(
              width: 40.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: Center(
                child: Text(
                  "${_currentIndex+1} / ${_listImgs.length}",
                  style: TextStyle(
                      color: Color.fromARGB(162, 44, 44, 44), fontSize: 12.0),
                ),
              )),
        ),
      ],
    );
  }
}
