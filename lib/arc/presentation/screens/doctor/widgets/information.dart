import '../../../../data/models/response_models/doctor_response_model.dart';
import '../doctor.dart';

class Information extends StatelessWidget {
  const Information({Key? key, required this.size, required this.data})
      : super(key: key);

  final Size size;
  final Data? data;

  int _calculateRating(List<dynamic> rating) {
    if (rating.isEmpty) {
      return 5;
    }
    int sum = 0;
    rating.forEach((element) {
      sum += int.parse(element['number_star']);
    });
    return sum ~/ 5;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.5,
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'Tdoctor: ${data?.doctorId ?? "90123"}',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.red, fontWeight: FontWeight.bold),
          ),
          Expanded(
              child: Image.network(
            'https://tdoctor.vn/public/images/doctor/${data?.profileImage ?? 'drlethiphuongthao.jpg'}',
          )),
          RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            ignoreGestures: true,
            itemCount: _calculateRating(data?.rating ?? []),
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
