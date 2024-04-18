import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'question.dart';
import 'question_widget.dart';
import 'next.dart';
import 'options.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trắc nghiệm nghề nghiệp',
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Quiz(),
    );
  }
}

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  bool pressed = false;

  List<Question> _question = [
    Question(id: '1', title: 'Câu hỏi 1', options: {
      'Trả lời 1': false,
      'Trả lời 2': true,
      'Trả lời 3': false,
      'Trả lời 4': false
    }),
    Question(id: '2', title: 'Câu hỏi 2', options: {
      'Trả lời 1': false,
      'Trả lời 2': true,
      'Trả lời 3': false,
      'Trả lời 4': false
    }),
    Question(id: '3', title: 'Câu hỏi 3', options: {
      'Trả lời 1': false,
      'Trả lời 2': false,
      'Trả lời 3': true,
      'Trả lời 4': false
    }),
  ];

  int index = 0;
  int correct = 0;
  double score = 0;
  double roundedscore = 0;
  bool selected = false;

  void nextQuestion() {
    if (index == _question.length - 1) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: ((context) => ResultBox(
                roundedscore: roundedscore,
                correctanswers: correct,
                questionlength: _question.length,
                onPressed: startOver,
              )));
    } else {
      if (pressed) {
        setState(() {
          index++;
          pressed = false;
          selected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Mời bạn vui lòng chọn đáp án cho câu hỏi này.'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20),
        ));
      }
    }
  }

  void scoreD(bool value) {
    if (selected) {
      return;
    } else {
      if (value == true) {
        correct++;
        score = score + 10 / _question.length;
        String inString = score.toStringAsFixed(2);
        roundedscore = double.parse(inString);
      }
      setState(() {
        pressed = true;
        selected = true;
      });
    }
  }

  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      roundedscore = 0;
      correct = 0;
      pressed = false;
      selected = false;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Trắc nghiệm nghề nghiệp'),
          automaticallyImplyLeading: false),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text(
                    'Điểm: $roundedscore',
                    textAlign: TextAlign.left,
                  ),
                )),
            QuestionWid(
                question: _question[index].title,
                index: index,
                total: _question.length),
            Divider(
              color: Colors.black,
              thickness: 0.3,
            ),
            SizedBox(
              height: 20,
            ),
            for (int i = 0; i < _question[index].options.length; i++)
              TextButton(
                  onPressed: () =>
                      scoreD(_question[index].options.values.toList()[i]),
                  child: OptionCard(
                    option: _question[index].options.keys.toList()[i],
                    color: pressed
                        ? _question[index].options.values.toList()[i] == true
                            ? Colors.green
                            : Colors.red
                        : Color.fromARGB(255, 238, 238, 238),
                  ))
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22),
        child: NextQuestion(nextQuestion: nextQuestion, pressed: pressed),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
