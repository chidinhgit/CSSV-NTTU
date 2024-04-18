import 'package:flutter/material.dart';
import 'package:notification_nttu/Screen/tinhnang/all.dart';

class ResultBox extends StatelessWidget {
  const ResultBox(
      {Key? key,
      required this.roundedscore,
      required this.correctanswers,
      required this.questionlength,
      required this.onPressed})
      : super(key: key);
  final double roundedscore;
  final int correctanswers;
  final int questionlength;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Kết quả',
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              child: Text(
                '$roundedscore điểm.',
                style: TextStyle(color: Colors.white),
              ),
              radius: 65,
              backgroundColor: roundedscore >= 4 ? Colors.green : Colors.red,
            ),
            SizedBox(height: 20),
            Text(
              roundedscore >= 4
                  ? 'Bạn đã trả lời đúng $correctanswers/$questionlength câu hỏi!'
                  : 'Bạn đã trả lời đúng $correctanswers/$questionlength câu hỏi.\nXin vui lòng mời bạn thử lại.',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 30),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                    child: Text('Về home'),
                  ),
                  SizedBox(width: 30),
                  TextButton(
                    onPressed: onPressed,
                    child: Text('Thử lại'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
