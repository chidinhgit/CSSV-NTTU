import 'package:flutter/material.dart';
import 'package:notification_nttu/Screen/gioiThieuKhoa/SoDoTocChucKhoa.dart';

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
      home: coSoVatChat(),
    );
  }
}



class coSoVatChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cơ sở vật chất'),
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
                        'Cơ sở vật chất, '
                            '\nPhòng thực nghiệm Khoa CNTT',
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
                        'Ngày đăng:14/03/2021',
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
                        'Phòng học, Phòng thực nghiệm Khoa CNTT',
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
                        'GIỚI THIỆU PHÒNG HỌC, '
                            '\nPHÒNG THỰC HÀNH KHOA CÔNG NGHỆ THÔNG TIN',
                        style: TextStyle(
                          color: Colors.orangeAccent,
                            fontSize: 15
                        ),
                      ),
                    ),
                  ],
                ),
                const  Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                        child: Text(
                      'Toàn bộ phòng học, phòng làm việc và các phòng chức năng'
                      '\ncó đầy đủ trang thiết bị phù hợp để hỗ trợ các hoạt động đào'
                      '\ntạo và nghiên cứu phục vụ CTĐT như:hệ thống lạnh, chiếu '
                      '\nsáng,thông gió,an toàn.  '
                          '\n'
                      '\nChỉ tính riêng cơ sở An Phú Đông, nơi tổ chức đào tạo ngành CNTT, bảng dưới đây thống kê số lượng phòng học, giảng đường và trang thiết bị hỗ trợ giảng dạy.     '
                       '\n'
                          '\nPhòng thí nghiệm, thực hành và trang thiết bị phù hợp và được cập nhật để hỗ trợ các hoạt động đào tạo và nghiên cứu. '
                      '\n'
                      '\nKhoa CNTT, trường Đại học Nguyễn Tất Thành đảm bảo đủ phòng thí nghiệm, thực hành cũng như các trang thiết bị để phục vụ đào tạo và nghiên cứu của Học viên theo chương trình Thạc sĩ Công nghệ thông tin.'
                          '\n'
                          '\nCác phòng thí nghiệm tại Khoa CNTT được tổ chức theo từng chuyên ngành riêng biệt, đảm bảo đủ số lượng máy tính, máy chủ (Server), các thiết bị, linh kiện đáp ứng cho 30 Học viên học cùng lúc.'
                          ,style: TextStyle(

                              fontSize: 15
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: Image.asset(
                    'assets/images/gioiThieu/coSoVatChat/DsPhongHoc.jpg',
                    width: 350,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
                const  Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                        child: Text(
                      "Cụ thể, mỗi phòng Thí nghiệm được quy hoạch 30 máy tính. Số lượng máy Server của mỗi phòng thay đổi theo nhu cầu. Các linh kiện, thiết bị, vật tư phục vụ đào tạo chuyên ngành như IoT, Network, Multimedia luôn được cập nhật, bổ sung, thay thế thường xuyên, dáp ứng nhu cầu học tập, thí nghiệm và nghiên cứu của Học viên."
                       '\n'
                       "\nNhằm đảm bảo quá trình thí nghiệm, thực hành của Học viên được an toàn, chuyên nghiệp, các Phòng thí nghiệm đã ban hành các tài liệu hướng dẫn, nội quy, các quy tắc an toàn trong mỗi bài thí nghiệm. Đồng thời, các hoạt động tại phòng thí nghiệm cũng được ghi chép lại, phục vụ cho việc lập các kế hoạch hoạt động sau này."
                          '\n'
                          '\nTrong quá trình hoạt động, các máy tính và trang thiết bị trong phòng thí nghiệm, phòng thực hành luôn được duy tu, bảo dưỡng và cập nhật/nâng cấp để đáp ứng nhu cầu về đào tạo và nghiên cứu.'
                          ,style: TextStyle(

                              fontSize: 15
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: Image.asset(
                    'assets/images/gioiThieu/coSoVatChat/BangTkePThiNghiem.jpg',
                    width: 400,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 5,),
                const  Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                        child: Text(
                          'HÌNH ẢNH THƯ VIỆN, PHÒNG THỰC HÀNH',
                          style: TextStyle(
                              fontSize: 15
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/gioiThieu/coSoVatChat/thuVien1.jpg',
                    width: 400,
                    height: 240 ,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 5,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/gioiThieu/coSoVatChat/thuVien2.jpg',
                    width: 400,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 5,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/gioiThieu/coSoVatChat/thuVien3.jpg',
                    width: 400,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 5,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/gioiThieu/coSoVatChat/thuVien4.jpg',
                    width: 400,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 5,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/gioiThieu/coSoVatChat/thuVien5.jpg',
                    width: 400,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 5,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/gioiThieu/coSoVatChat/thuVien6.jpg',
                    width: 400,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 5,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/gioiThieu/coSoVatChat/thuVien7.jpg',
                    width: 400,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 5,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/gioiThieu/coSoVatChat/thuVien8.jpg',
                    width: 400,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 5,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/gioiThieu/coSoVatChat/thuVien9.jpg',
                    width: 400,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 5,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/gioiThieu/coSoVatChat/thuVien10.jpg',
                    width: 400,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 5,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/gioiThieu/coSoVatChat/thuVien11.jpg',
                    width: 400,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 5,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/gioiThieu/coSoVatChat/thuVien12.jpg',
                    width: 400,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 5,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/gioiThieu/coSoVatChat/thuVien13.jpg',
                    width: 400,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 5,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/gioiThieu/coSoVatChat/thuVien14.jpg',
                    width: 400,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 5,),
              ],
            ),

          ),
        ),
      ),
    );
  }
}
