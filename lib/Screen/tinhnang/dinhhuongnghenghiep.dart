import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DinhHuongNgheNghiep(),
    );
  }
}

class DinhHuongNgheNghiep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logoAPBAR.png',
              height: 180,
              width: 180,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ListTile(
            title: Text(
              "Định hướng nghề nghiệp, tạo việc làm và hướng dẫn tham gia kỳ thi ĐGNL cho học sinh THPT địa bàn TP. Vị Thanh, Hậu Giang",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(height: 15, thickness: 1.5),
          ListTile(
            title: Text(
              "NTTU – Vào lúc 14h00 ngày 30/11/2023 vừa qua, tại Hội trường Khu trung tâm hành chính Thành phố Vị Thanh – tỉnh Hậu Giang. Ban thường vụ Thành Đoàn Thành phố Vị Thanh đã phối hợp cùng Trường ĐH Nguyễn Tất Thành, Hiệp hội Doanh nghiệp Châu Á Thái Bình Dương, Hiệp hội Đào tạo và Phát triển nguồn nhân lực Thành phố Vị Thanh cùng tổ chức chương trình “Tư vấn hướng nghiệp, giới thiệu việc làm cho đoàn viên, thanh niên và hướng dẫn đánh giá năng lực cho học sinh khối 12, năm học 2023-2024”",
              style: TextStyle(fontSize: 15),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10), // Khoảng cách giữa Text và Image
            child: Image.asset('assets/images/photo1.jpg'),
          ),
          SizedBox(
              height: 5), 
          Text(
            "Đại diện Ban thường vụ Thành Đoàn Thành phố Vị Thanh, Trường ĐH Nguyễn Tất Thành; Hiệp hội Doanh nghiệp Châu Á Thái Bình Dương; Hiệp hội Đào tạo và Phát triển nguồn nhân lực Thành phố Vị Thanh",
            style: TextStyle(fontSize: 13, fontStyle: FontStyle.italic,),
            textAlign: TextAlign.center,
          ),
          ListTile(
            title: Text(
              "Chương trình thu hút hơn 500 học sinh, đoàn viên, thanh niên từ các trường THPT trên địa bàn Thành phố Vị Thanh đến tham gia.",
              style: TextStyle(fontSize: 15),
            ),
          ),
          ListTile(
            title: Text(
              "Tại chương trình, các em được TS. Nguyễn Thanh Phương – Giám đốc Trung tâm Quan hệ doanh nghiêp và Việc làm sinh viên Trường ĐH Nguyễn Tất Thành, giải đáp thắc mắc, tư vấn định hướng nghề nghiệp tương lai, chọn hướng đi phù hợp với năng lực, sở thích, điều kiện của bản thân sau khi tốt nghiệp THPT, cũng như thông tin về nhu cầu việc làm, kỳ thi đánh giá năng lực cho học sinh khối 12… Chương trình diễn ra rất sôi nổi, các em học sinh THPT rất quan tâm đến những chương trình đào tạo, các chính sách đãi ngộ, điều kiện học tập tại Trường ĐH Nguyễn Tất Thành, cũng như cơ hội nghề nghiệp, việc làm sau này của mình khi tốt nghiệp. Trong suốt thời gian trương trinh diễn ra, rất nhiều câu hỏi đã được gửi tới TS. Nguyễn Thanh Phương.",
              style: TextStyle(fontSize: 15),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Image.asset('assets/images/photo2.jpg'),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Image.asset('assets/images/photo3.jpg'),
          ),
          SizedBox(
              height: 5), // Adjust the spacing between image and text as needed
          Text(
            "Rất nhiều câu hỏi đã được gửi tới TS. Nguyễn Thanh Phương Phương – Giám đốc Trung tâm Quan hệ doanh nghiêp và Việc làm sinh viên Trường ĐH Nguyễn Tất Thành",
            style: TextStyle(fontSize: 13, fontStyle: FontStyle.italic,),
            textAlign: TextAlign.center,
          ),
          ListTile(
            title: Text(
              "Cũng trong dịp này, Trường ĐH Nguyễn Tất Thành và Hiệp hội Đào tạo và Phát triển nguồn nhân lực Thành phố Vị Thanh đã trao tặng 15 suất học bổng, mỗi suất trị giá 500.000 đồng, cùng nhiều quà tặng khác cho đoàn viên, thanh niên là học sinh khối 12 có thành tích vượt khó học tốt trên địa bàn thành phố.",
              style: TextStyle(fontSize: 15),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Image.asset('assets/images/photo4.jpg'),
          ),
          SizedBox(
              height: 5), // Adjust the spacing between image and text as needed
          Text(
            "Rất nhiều câu hỏi đã được gửi tới TS. Nguyễn Thanh Phương Phương – Giám đốc Trung tâm Quan hệ doanh nghiêp và Việc làm sinh viên Trường ĐH Nguyễn Tất Thành",
            style: TextStyle(fontSize: 13, fontStyle: FontStyle.italic,),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
