import '../doctor.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Thạc sĩ - Bác sĩ nội trú Lê Phương Thảo',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.red),
            textAlign: TextAlign.left,
            maxLines: 2,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          height: 70,
          width: 70,
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
      ],
    );
  }
}
