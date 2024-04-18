import 'package:flutter/material.dart';
import '../../Model/thongBaoModel.dart';
import 'thongBaoNho.dart';
import 'thongBaoKhoa_notifier.dart' as Notifier;
import '../../Model/thongBaoModel.dart' as Model;
import 'ImagesTBaoRandom.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: thongBaoKhoa(),
    );
  }
}

class thongBaoKhoa extends StatefulWidget {
  @override
  thongBaoKhoaState createState() => thongBaoKhoaState();
}

class thongBaoKhoaState extends State<thongBaoKhoa>  {
  final Notifier.ThongBaoAPI _thongBaoNotifier = Notifier.ThongBaoAPI();
  List<Model.ThongBaoModel> _thongBaos = [];


  @override
  void initState() {
    super.initState();
    _loadThongBaos();
  }

  Future<void> _loadThongBaos() async {
    try {
      List<Model.ThongBaoModel> thongBaos = await _thongBaoNotifier.fetchThongBaos();
      setState(() {
        _thongBaos = thongBaos.map((thongBao) {
          String randomImagePath = RandomImageSelector.generateRandomImagePath(thongBao.noiDung);
          return ThongBaoModel(
            tieuDe: thongBao.tieuDe,
            noiDung: thongBao.noiDung,
            ngayDang: thongBao.ngayDang,
            imagePath: randomImagePath,
          );
        }).toList();
      });
    } catch (e) {
      print('Không thể tải thông báo: $e');
      // Xử lý lỗi ở đây
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thông báo khoa'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 5, 0, 0),
                  child: Text(
                    'Thông Báo',
                    style: TextStyle(
                      color: Colors.black,
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
            const Divider(
              thickness: 4,
              color: Colors.white,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _thongBaos.length,
              itemBuilder: (context, index) {
                Model.ThongBaoModel thongBao = _thongBaos[index];
                //Hiển thị tiêu đề và nội dung ngắn hơn
                String shortTieuDe = thongBao.tieuDe.length <= 20 ? thongBao.tieuDe : thongBao.tieuDe.substring(0, 20) + '...';
                String shortContent = thongBao.noiDung.length <= 20 ? thongBao.noiDung : thongBao.noiDung.substring(0, 60) + '...';
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => thongBaoNho(
                            title: thongBao.tieuDe,
                            content: thongBao.noiDung,
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            thongBao.imagePath,
                            width: 167,
                            height: 115,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                shortTieuDe,// Tiêu đề
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                shortContent, // Nội dung
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Ngày đăng: ${thongBao.ngayDang}',// ngày đăng
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}