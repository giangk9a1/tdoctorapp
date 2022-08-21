import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:riverhotel/src/extensions/extension.dart';

class ColummBuilder extends StatelessWidget {
  final List data;
  final Function itemBuilder;
  final Widget separatorItem;
  const ColummBuilder({
    Key? key,
    required this.data,
    required this.itemBuilder,
    this.separatorItem = const SizedBox(height: 10),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: data.mapIndexed(
          (element, index) {
            final isEnd = index != data.length - 1;
            return Column(
              children: [
                AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 50),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: itemBuilder(index),
                    ),
                  ),
                ),
                if (isEnd) separatorItem
              ],
            );
          },
        ).toList(),
      ),
    );
  }
}
