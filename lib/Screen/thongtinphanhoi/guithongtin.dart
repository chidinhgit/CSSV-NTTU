import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:notification_nttu/Model/ykiencanhanmodel.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(
    home: FeedbackForm(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FeedbackForm(),
    );
  }
}

class FeedbackForm extends StatefulWidget {
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController idSinhVienController = TextEditingController();
  TextEditingController tieuDeController = TextEditingController();
  TextEditingController noiDungController = TextEditingController();
  Future<void> _submitForm() async {
    final yKien = YKienCaNhan(
      idSinhVien: int.parse(idSinhVienController.text),
      tieuDe: tieuDeController.text,
      noiDung: noiDungController.text,
      phanHoi: "",
    );

    final apiUrl = 'http://apicssv.daihocsontt.edu.vn:8668/View/index.php/ykiencanhan/insert'; // Thay thế URL này bằng URL của server của bạn
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(yKien.toJson()),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Yêu cầu POST thành công')),
        );
      } else {
        print(response.statusCode);
        throw Exception('Failed to post dataa');
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to post dataaa')),
      );
    }
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gửi ý kiến cá nhân'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: idSinhVienController,
                decoration: InputDecoration(labelText: 'ID Sinh viên'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập ID Sinh viên';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: tieuDeController,
                decoration: InputDecoration(labelText: 'Tiêu đề'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập tiêu đề';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: noiDungController,
                decoration: InputDecoration(labelText: 'Nội dung'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập nội dung';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _submitForm();
                  }
                },
                child: Text('Gửi'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class YKienCaNhan {
  final int idSinhVien;
  final String tieuDe;
  final String noiDung;
  final String phanHoi;

  YKienCaNhan({
    required this.idSinhVien,
    required this.tieuDe,
    required this.noiDung,
    required this.phanHoi,
  });

  Map<String, dynamic> toJson() {
    return {
      'ID_SinhVien': idSinhVien,
      'TieuDe': tieuDe,
      'NoiDung': noiDung,
      'PhanHoi': phanHoi,
    };
  }
}


