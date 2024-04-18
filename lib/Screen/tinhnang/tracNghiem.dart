import 'package:flutter/material.dart';
import '../tracnghiem/quiz.dart';

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
      home: tracNghiem(),
    );
  }
}

class tracNghiem extends StatefulWidget {
  const tracNghiem({Key? key}) : super(key: key);

  @override
  _tracNghiemState createState() => _tracNghiemState();
}

class _tracNghiemState extends State<tracNghiem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Trắc nghiệm nghề nghiệp')),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 100),
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                'Bắt đầu trắc nghiệm',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 27),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 224, 224, 224)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Quiz()),
                  );
                },
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Text(
                      'Bắt đầu',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    )),
              )
            ],
          ),
        ));
  }
}
