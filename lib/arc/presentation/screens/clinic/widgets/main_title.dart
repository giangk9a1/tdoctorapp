import 'package:flutter/material.dart';
import 'package:riverhotel/src/styles/dimens.dart';

class MainTitle extends StatelessWidget {
  MainTitle({Key? key, required this.title}) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Center(
                child: Text(title,
                    maxLines: 4,
                    style: const TextStyle(
                      fontSize: Dimens.size22,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                    textAlign: TextAlign.center)),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.all(8),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90),
              ),
              child: FittedBox(
                child: Column(
                  children: [
                    Icon(
                      Icons.check,
                      color: Colors.blue,
                    ),
                    Text(
                      'Chính thức',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
