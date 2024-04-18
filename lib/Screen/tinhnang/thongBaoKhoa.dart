import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MaterialApp(),
    );
  }
}
class ThongBaoKhoa extends StatefulWidget{
  @override
  _thongBaokhoaState createState() => _thongBaokhoaState();
}
class _thongBaokhoaState extends State<ThongBaoKhoa>{
  List<String> thongBaoList = [
    "Thông báo 1",
    "Thông báo 2",
    "Thông báo 3",
    // Thêm các thông báo khác vào đây nếu cần
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Đặt màu nền của App Bar là màu xanh
        title: Text('Thông báo khoa'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list_alt), // Biểu tượng sẽ được đặt phía sau
            onPressed: () {
              // Xử lý khi biểu tượng được nhấn
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: thongBaoList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4, // Độ nâng của khung Card
              child: ListTile(
                title: Text(thongBaoList[index]),
                // Các thuộc tính và sự kiện khác của ListTile có thể được thêm vào ở đây
              ),
            ),
          );
        },
      ),
      
    );
  }
} 