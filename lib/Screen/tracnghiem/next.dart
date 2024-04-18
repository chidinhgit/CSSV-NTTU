import 'package:flutter/material.dart';

class NextQuestion extends StatelessWidget {
  const NextQuestion(
      {Key? key, required this.nextQuestion, required this.pressed})
      : super(key: key);
  final VoidCallback nextQuestion;
  final bool pressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          backgroundColor: getColor(
        Color.fromARGB(255, 218, 218, 218),
        Color.fromARGB(255, 228, 228, 228),
      )),
      onPressed: nextQuestion,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          'Câu hỏi tiếp theo',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, color: Colors.black),
        ),
      ),
    );
  }

  MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
    final getColor = (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return colorPressed;
      } else {
        return color;
      }
    };
    return MaterialStateProperty.resolveWith(getColor);
  }
}
