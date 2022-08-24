import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../clinic.dart';

class CommentSection extends StatefulWidget {
  const CommentSection({
    Key? key,
    required this.size,
    required this.doctorName,
  }) : super(key: key);

  final Size size;
  final String? doctorName;

  @override
  State<CommentSection> createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  TextEditingController _commentController = TextEditingController();
  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width,
      height: widget.size.height * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.message),
              SizedBox(
                width: widget.size.width * 0.01,
              ),
              Expanded(
                child: Text(
                  'NHẬN XÉT VỀ ${widget.doctorName?.toUpperCase()}',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: Colors.pink),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              'Bạn đã sử dụng dịch vụ của Thạc sĩ - Bác sĩ nội trú Lê Thị Phương Thảo? Hãy chia sẻ cảm nhận của bạn với cộng đồng.Nếu bạn có câu hỏi về sức khỏe và chuyên môn, vui lòng chuyển sang trang Hỏi Bác sĩ để được tư vấn miễn phí.',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          SizedBox(
            height: widget.size.height * 0.03,
          ),
          Text(
            "Bình luận",
            style: Theme.of(context).textTheme.headline6,
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              controller: _commentController,
              onChanged: (value) => print(value),
              minLines: 3,
              maxLines: 8,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Đánh giá của bạn',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          RatingBar.builder(
            itemSize: 25,
            wrapAlignment: WrapAlignment.start,
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
        ],
      ),
    );
  }
}
