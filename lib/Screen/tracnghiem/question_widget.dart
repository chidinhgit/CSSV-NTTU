import 'package:flutter/material.dart';

class QuestionWid extends StatelessWidget {
  const QuestionWid(
      {Key? key,
      required this.question,
      required this.index,
      required this.total})
      : super(key: key);

  final String question;
  final int index;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        'Câu hỏi ${index + 1}/$total: $question',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
