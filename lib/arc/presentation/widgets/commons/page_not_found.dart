import 'package:flutter/material.dart';
import 'package:riverhotel/src/styles/style.dart';
import 'package:riverhotel/translation_key.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(TranslationKey.notFound.tr()),
    );
  }
}
