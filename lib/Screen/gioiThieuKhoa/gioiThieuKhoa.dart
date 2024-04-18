import 'package:flutter/material.dart';
import 'package:notification_nttu/Screen/gioiThieuKhoa/SoDoTocChucKhoa.dart';
import 'package:notification_nttu/Screen/gioiThieuKhoa/coSoVatChat.dart';
import 'package:notification_nttu/Screen/gioiThieuKhoa/gioiThieuChung.dart';
import 'package:notification_nttu/Screen/gioiThieuKhoa/toChucNhanSu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: MyPageViewContent(),
    );
  }
}



class MyPageViewContent extends StatefulWidget {
  @override
  _MyPageViewContentState createState() => _MyPageViewContentState();
}

class _MyPageViewContentState extends State<MyPageViewContent> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    // Add a listener to the PageController to update _currentPage
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giới Thiệu Khoa CNTT'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,

        child: Column(children: [

          Container(
            width: 417,
            height: 281,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            // Tạo 3 hình giới thiệu đầu trang
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                  child: PageView(
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    children: [
                      buildImage('assets/images/gioiThieu/gioiThieuKhoa1.jpg'),
                      buildImage('assets/images/gioiThieu/gioiThieuKhoa2.jpg'),
                      buildImage('assets/images/gioiThieu/gioiThieuKhoa3.jpg'),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildDot(0),
                      buildDot(1),
                      buildDot(2),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Dòng hiển thị chữ tin tức
          const Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 5, 0, 0),
                child: Text(
                  'Giới thiệu',
                  style: TextStyle(
                    color:Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,

                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 5, 0, 0),
                child: Icon(
                  Icons.circle_notifications,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ],
          ),
          // Khoảng trắng
          const Divider(
            thickness: 4,
            color: Colors.white,
          ),

// Tạo hình và thông báo chữ cho tin tức (thứ 1)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 0, 0),
            child:InkWell(
              onTap: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SoDoToChucPage()),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/images/gioiThieu/GioiThieu1.png',
                      width: 167,
                      height: 115,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 120,
                    child: VerticalDivider(
                      width: 27,
                      thickness: 3,
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: Text(
                          'Sơ đồ tổ chức khoa',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontFamily: 'Readex Pro',
                              fontWeight: FontWeight.normal,
                              color: Colors.blueAccent,
                              fontSize: 18
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                            child: Text(
                              'Sơ đồ tổ chức KCNTT',
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            size: 18,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )),

// Tạo hình và thông báo chữ cho tin tức (thứ 2)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
              child:InkWell(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => toChucNhanSu()),
                  );
                },
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(
                      'assets/images/gioiThieu/GioiThieu2.png',
                      width: 167,
                      height: 115,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: VerticalDivider(
                    width: 27,
                    thickness: 3,
                    color: Colors.white,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Tổ chức nhân sự KCNTT   ',
                      style: TextStyle(
                          fontFamily: 'Readex Pro',
                          fontWeight: FontWeight.normal,
                          color: Colors.blueAccent,
                          fontSize: 18
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Text(
                            'Tổ chức nhân sự...            ',
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              fontWeight: FontWeight.normal,

                            ),
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          size: 18,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          ),
// Tạo hình và thông báo chữ cho tin tức (thứ 3)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
              child:InkWell(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => coSoVatChat()),
                  );
                },
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(
                      'assets/images/gioiThieu/GioiThieu3.png',
                      width: 167,
                      height: 115,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: VerticalDivider(
                    width: 27,
                    thickness: 3,
                    color: Colors.white,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Cơ sở vật chất,Phòng.',
                      style: TextStyle(
                          fontFamily: 'Readex Pro',
                          fontWeight: FontWeight.normal,
                          color: Colors.blueAccent,
                          fontSize: 18
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Text(
                            'Phòng học, Phòng thực..',
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              fontWeight: FontWeight.normal,

                            ),
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          size: 18,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          ),
// Tạo hình và thông báo chữ cho tin tức (thứ 4)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
              child:InkWell(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => gioiThieuChung()),
                  );
                },
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(
                      'assets/images/gioiThieu/GioiThieu4.png',
                      width: 167,
                      height: 115,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: VerticalDivider(
                    width: 27,
                    thickness: 3,
                    color: Colors.white,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Giới thiệu chung Khoa..',
                      style: TextStyle(
                          fontFamily: 'Readex Pro',
                          fontWeight: FontWeight.normal,
                          color: Colors.blueAccent,
                          fontSize: 18
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Text(
                            'Giá trị cốt lõi: '
                                'Chuyên nghiệp\n – Hội nhập - Trách nhiệm',
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              fontWeight: FontWeight.normal,

                            ),
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          size: 18,
                        ),
                      ],
                    ),
                  ],
                ),

              ],
            ),
          ),
          ),

          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 15, 5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Phát triển: @ Sinh Viên K21-Khoa CNTT',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.blueAccent
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget buildImage(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        imagePath,
        width: 300,
        height: 200,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildDot(int index) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _currentPage == index ? Colors.blue : Colors.grey,
        ),
      ),
    );
  }
}
