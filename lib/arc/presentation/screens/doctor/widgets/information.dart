import '../doctor.dart';

class Information extends StatelessWidget {
  const Information({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.5,
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'TDOCTOR: 90213',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.red, fontWeight: FontWeight.bold),
          ),
          Expanded(
              child: Image.network(
            'https://cdn.bookingcare.vn/fr/w1200/2020/12/21/102227-bs-le-thi-phuong-thao.jpg',
          )),
          RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Text(
            'Số nhận xét: 0',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Text('Số câu trả lời: 0',
              style: Theme.of(context).textTheme.headlineSmall)
        ],
      ),
    );
  }
}
