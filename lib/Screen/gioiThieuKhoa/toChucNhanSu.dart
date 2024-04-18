import 'package:flutter/material.dart';
import 'package:notification_nttu/Screen/gioiThieuKhoa/SoDoTocChucKhoa.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thông tin cá nhân',
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: toChucNhanSu(),
    );
  }
}



  class toChucNhanSu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sơ đồ tổ chức nhân sự'),
      ),
      body:  SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                      child: Text(
                        'Tổ chức nhân sự Khoa Công nghệ thông tin',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                      child: Text(
                        'Ngày đăng:11/03/2023',
                        style: TextStyle(

                            fontSize: 15
                        ),
                      ),
                    ),
                  ],
                ),
                const  Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                      child: Text(
                        'TỔ CHỨC NHÂN SỰ KHOA CÔNG NGHỆ THÔNG TIN, '
                            '\nTRƯỜNG ĐẠI HỌC NGUYỄN TẤT THÀNH',
                        style: TextStyle(

                            fontSize: 15
                        ),
                      ),
                    ),
                  ],

                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: Image.asset(
                    'assets/images/gioiThieu/1.jpg',
                    width: 400,
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: Image.asset(
                    'assets/images/gioiThieu/2.jpg',
                    width: 400,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/gioiThieu/3.jpg',
                    width: 400,
                    height: 240 ,
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/gioiThieu/4.jpg',
                    width: 400,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/gioiThieu/5.jpg',
                    width: 400,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/gioiThieu/6.jpg',
                    width: 400,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/gioiThieu/7.jpg',
                    width: 400,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/gioiThieu/8.jpg',
                    width: 400,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),

          ),
        ),
      ),
    );
  }
}
