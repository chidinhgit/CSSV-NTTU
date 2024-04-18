import 'package:flutter/material.dart';
import 'package:notification_nttu/Screen/thongBaoKhoa/thongBaoKhoa.dart';
import 'package:notification_nttu/Screen/thongtinphanhoi/guithongtin.dart';
import 'package:notification_nttu/Screen/thongtinphanhoi/ykiencanhanui.dart';
import 'package:notification_nttu/Screen/tinhnang/ThongTinCaNhan.dart';
import 'package:notification_nttu/Screen/ThoiKhoaBieu/TongQuanTKB.dart';
import 'package:notification_nttu/Screen/gioiThieuKhoa/gioiThieuKhoa.dart';
import 'package:notification_nttu/Screen/tinhnang/dinhhuongnghenghiep.dart';
import 'package:notification_nttu/Screen/tinhnang/tracNghiem.dart';
import 'package:notification_nttu/Screen/tinhnang/kehoachcanhan.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                opacity: 0.5,
                image: AssetImage(
                  'assets/images/backgroundgoc.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/banner.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/kcntt.jpg',
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 55,
            left: 0,
            right: 0,
            child: Center(
              child: Material(
                elevation: 15,
                borderRadius: BorderRadius.circular(18),
                color: Colors.white.withOpacity(0.5),
                child: Container(
                  width: 385,
                  padding: EdgeInsets.only(left: 5, right: 5),
                  height: 520,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          expanded('assets/images/school.jpg',
                              'Giới thiệu Khoa CNTT', context),
                          VerticalDivider(
                            color: Colors.black, // Màu của đường dọc
                            width: 1, // Độ rộng của đường dọc
                          ),
                          expanded('assets/images/hoc_tap.png',
                              'Thời khóa biểu', context),
                          VerticalDivider(
                            color: Colors.black,
                            width: 1,
                          ),
                          expanded('assets/images/nganh.png',
                              'Thông báo của khoa', context),
                        ],
                      ),
                      // Divider(
                      //   color: Colors.black, // Màu của đường ngang
                      //   height: 1, // Độ cao của đường ngang
                      // ),
                      Row(
                        children: [
                          expanded('assets/images/nghe.png', 'Kế hoạch cá nhân',
                              context),
                          VerticalDivider(
                            color: Colors.black,
                            width: 1,
                          ),
                          Expanded(child: Container()),
                          VerticalDivider(
                            color: Colors.black,
                            width: 1,
                          ),
                          expanded('assets/images/dinh_hương_nghe.png',
                              'Định hướng nghề nghiệp', context)
                        ],
                      ),
                      // Divider(
                      //   color: Colors.black,
                      //   height: 1,
                      // ),
                      Row(
                        children: [
                          expanded('assets/images/tuyen_sinh.png',
                              'Xem thông tin phản hồi', context),
                          VerticalDivider(
                            color: Colors.black,
                            width: 1,
                          ),
                          expanded('assets/images/phuong_thuc.png',
                              'Thông tin sinh viên', context),
                          VerticalDivider(
                            color: Colors.black,
                            width: 1,
                          ),
                          expanded('assets/images/tu_van.jpg',
                              'Gửi thông tin phản hồi', context)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Expanded expanded(String imagePath, String text, BuildContext context) {
  return Expanded(
    child: InkWell(
      onTap: () {
        if (text == 'Giới thiệu Khoa CNTT') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyPageViewContent()),
          );
        } else if (text == 'Thời khóa biểu') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TimetableApp()),
          );
        } else if (text == 'Thông báo của khoa') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => thongBaoKhoa()),
          );
        } else if (text == 'Kế hoạch cá nhân') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => keHoach()),
          );
        } else if (text == 'Định hướng nghề nghiệp') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DinhHuongNgheNghiep()),
          );
        } else if (text == 'Xem thông tin phản hồi') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UserInterface()),
          );
        } else if (text == 'Thông tin sinh viên') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UserProfilePage()),
          );
        } else if (text == 'Gửi thông tin phản hồi') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FeedbackForm()),
          );
        }
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 25.0),
              width: 65,
              height: 65,
              child: CircleAvatar(
                radius: 43,
                backgroundImage: AssetImage(imagePath),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(height: 5),
            Container(
              width: 90,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 35),
          ],
        ),
      ),
    ),
  );
}
