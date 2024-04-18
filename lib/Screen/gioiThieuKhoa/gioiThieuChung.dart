import 'package:flutter/material.dart';
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
      home: gioiThieuChung(),
    );
  }
}

class gioiThieuChung extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giới thiệu chung Khoa CNTT'),
      ),
      body:  SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                      child: Text(
                        'Giới thiệu chung Khoa CNTT',
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
                        'Ngày đăng:15/01/2019',
                        style: TextStyle(

                            fontSize: 15
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
                        'Giá trị cốt lõi: Chuyên nghiệp – Hội nhập - Trách nhiệm',
                        style: TextStyle(
                            fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],

                ),
                const Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                        child: Text(
                          'Khoa Công nghệ thông tin (CNTT) được thành lập vào ngày 26 tháng 05 năm 2011 theo Quyết định 137/QĐNTT-TC của Hiệu trưởng Trường Đại học Nguyễn Tất Thành.',
                          style: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            color: Colors.blueAccent
                          ),

                        ),
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                      child: Text(
                        '·       Tầm nhìn của Khoa CNTT',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.orangeAccent
                        ),
                      ),
                    ),
                  ],

                ),
                const Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
                        child: Text(
                          'Đến năm 2025, Khoa Công nghệ Thông tin - Đại học Nguyễn Tất Thành là nơi uy tín về  đào tạo và cung cấp nguồn nhân lực công nghệ thông tin có trình độ và chất lượng tiên tiến trong khu vực để đáp ứng các yêu cầu về quản lý, sản xuất, dịch vụ và ứng dụng của công nghệ thông tin trong nước và quốc tế.',
                          style: TextStyle(
                              fontSize: 15,

                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                      child: Text(
                        '·       Sứ mệnh của Khoa CNTT',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.orangeAccent
                        ),
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 2),
                        child: Text(
                          'Khoa đào tạo nguồn nhân lực chất lượng cao, có năng lực khởi nghiệp và hội nhập, có sức cạnh tranh cao trên thị trường lao động trong nước và quốc tế thông qua đào tạo, đổi mới sáng tạo; nghiên cứu ứng dụng, phát triển công nghệ và chuyển giao tri thức đa ngành, đa lĩnh vực, dựa trên liên minh chiến lược, với các doanh nghiệp, viện nghiên cứu và trường đại học; với môi trường năng động sáng tạo.'
                          '\n'
                          '\nTầm nhìn và Sứ mệnh của Nhà trường và Khoa nhất quán với nhau trong việc nêu rõ các mục tiêu là “cung cấp nguồn nhân lực chất lượng cao đáp ứng yêu cầu của thị trường trong và ngoài nước”, nguồn nhân lực này có khả năng “nghiên cứu ứng dụng” và thực hiện trách nhiệm “phục vụ cho sự phát triển kinh tế xã hội”. Các mục tiêu này được tất cả cán bộ của Khoa đồng thuận chuyển tải vào Mục tiêu giáo dục và Kết quả học tập mong đợi của chương trình để giúp người học đạt được',
                          style: TextStyle(
                            fontSize: 15,

                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                      child: Text(
                        '·       Chính sách chất lượng:',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.orangeAccent
                        ),
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 2),
                        child: Text(
                          '- Liên tục cải tiến chương trình, phương pháp dạy-học, quản lý đào tạo nhằm nâng cao chất lượng hoạt động đào tạo theo hướng phát huy năng lực, phẩm chất và tính tích cực của người học, hình thành khả năng học tập suốt đời.'
                              '\n'
                              '\n- Cập nhật và ứng dụng các tiến bộ của khoa học công nghệ của cuộc cách mạng công nghệ 4.0 vào quá trình đào tạo và nghiên cứu.'
                              '\n'
                              '\n- Tiếp tục tăng cường hoạt động NCKH của giảng viên và học viên; trở thành đơn vị cung cấp các giải pháp khoa học cho những vấn đề liên quan đến công nghệ thông tin.'
                              '\n'
                              '\n- Xây dựng văn hóa của Khoa tạo nên môi trường giáo dục tốt, thân thiện, luôn tạo điều kiện thuận lợi để sinh viên, học viên phát huy tối đa năng lực, sở trường của bản thân; là nơi phấn đấu rèn luyện phẩm chất đạo đức, trau dồi nghiệp vụ chuyên môn.'
                              '\n'
                              '\n- Không ngừng nâng cao chất lượng đội ngũ thông qua việc tuyển chọn, đào tạo đội ngũ giảng viên có trình độ chuyên môn cao và năng lực giảng dạy, nghiên cứu phù hợp.'
                              '\n'
                              '\n- Tăng cường hợp tác với các đơn vị sử dụng lao động để nắm bắt nhu cầu, phối hợp trong công tác đào tạo và tạo việc làm cho người học. Duy trì và mở rộng liên kết với các cơ sở giáo dục trong và ngoài nước nhằm trao đổi chuyên môn và cung cấp cho người học những CTĐT đa dạng theo tiêu chuẩn quốc tế.'
                          ,style: TextStyle(
                            fontSize: 15,

                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const  Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '- Triết lý giáo dục của Khoa: \n',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.orangeAccent,
                              ),
                            ),
                            TextSpan(
                              text: '“Chuyên nghiệp - Trách nhiệm –Hội nhập”',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: '- Chuyên nghiệp: ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue, // Màu xanh
                              ),
                            ),
                            TextSpan(
                              text:
                    'mục đích đào tạo học viên có chuyên  '
                      '\nmôn giỏi và kỹ năng tốt, từ việc học,môi trường xung   '
                    '\nquanh và việc tự học phải luôn được đẩy mạnh, khơi dậy '
                    '\nđộng cơ và thái độ đúng đắn, với tinh thần kiên trì và '
                    '\ntích cực để có được tay nghề cao. Tính chuyên nghiệp '
                    '\nđược thể hiện trong suy nghĩ, nhận thức, hành xử và  '
                    '\ntrong các mối quan hệ xã hội,là đích đến của quá trình'
                        '\nđào tạo tại Khoa.',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.black, // Màu đen cho phần còn lại
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: '- Trách nhiệm: ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue, // Màu xanh
                              ),
                            ),
                            TextSpan(
                              text:
                              'việc rèn đạo đức cho người học được '
                                  '\nđào tạo tại Khoa CNTT luôn được quan tâm hàng đầu,'
                                  '\nthể hiện tinh thần trách nhiệm của Khoa đối với thế hệ '
                                  '\ntrẻ, cũng như giúp bản thân người học nhận ra giá trị  '
                                  '\ncủa tinh thần trách nhiệm đối với bản thân, đối với tập '
                                  '\nthể, đối với tổ chức, với xã hội. Trách nhiệm trong việc '
                                  '\nluôn tự rèn luyện, không ngừng học tập, mọi lúcn mọi '
                                  '\n nơi. '

                              ,style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.black, // Màu đen cho phần còn lại
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: '- Hội nhập: ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue, // Màu xanh
                              ),
                            ),
                            TextSpan(
                              text:
                              'người học phải được đào tạo theo xu   '
                                  '\nhướng hội nhập quốc tế, xu hướng hội nhập quốc tế'
                                  '\nđược đánh giá theo tiêu chuẩn của khu vực và quốc tế. '
                                  '\nGiáo dục người học có khả năng tiếp nhận và vận dụng   '
                                  '\nkiến mới, tinh hoa văn hóa trên thế giới nhằm thúc đẩy '
                                  '\nsự phát triển sự nghiệp bản thân của người học,của, '
                                  '\nKhoa của Nhà trường, cũng như sự phát triển, tiến bộ  '
                                  '\n quốc gia. '

                              ,style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black, // Màu đen cho phần còn lại
                            ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                        child: Text(
                          ' Trong quá trình đào tạo, Khoa liên tục thực hiện các hoạt động cải tiến nâng cao chất lượng chương trình thông qua việc chỉnh lý, bổ sung CTĐT nhằm đáp ứng những thay đổi, những yêu cầu mới của xã hội. Cụ thể, Khoa dựa trên: CTĐT từ các Trường uy tín nước ngoài cũng như các cơ sở giáo dục lớn trong nước, ý kiến phản hồi của doanh nghiệp (người sử dụng lao động), ý kiến đánh giá của người học (cựu học viên và học viên) để tiến hành điều chỉnh CTĐT ít nhất 2 năm 1 lần. Các bên liên quan đều có thể tiếp cận với bản mô tả CTĐT và đề cương các môn học một cách dễ dàng và thuận tiện nhất.'
                          '\n '
                          '\nVề chất lượng đội ngũ và hoạt động NCKH: nhiều giảng viên tham gia thực hiện các đề tài NCKH các cấp, nhiều đề tài được đánh giá chất lượng khá, tốt và xuất sắc; có các báo cáo tham luận tại các hội nghị, hội thảo có nội dung liên quan đến ngành đào tạo; có các bài báo khoa học công bố trên các tạp chí chuyên ngành uy tín. giảng viên của Khoa cũng tham gia biên soạn giáo trình phục vụ ngành đào tạo. Một số giảng viên là chủ biên hoặc tham gia viết nhiều sách chuyên khảo, tài liệu tham khảo liên quan đến ngành đào tạo.'
                          '\n'
                          '\n thức được tầm quan trọng của việc kiểm định chất lượng CTĐT, theo chỉ đạo của Nhà trường, Khoa CNTT đã thực hiện nghiêm túc việc TĐG chất lượng và chuẩn bị cho quá trình kiểm định CTĐT. Năm 2020, theo kế hoạch kiểm định được thông qua, Nhà trường đã tổ chức tập huấn cho toàn thể thành viên Hội đồng TĐG chất lượng CTĐT. Sau quá trình nghiên cứu tài liệu, thu thập và xử lí minh chứng, viết dự thảo báo cáo, nghe ý kiến tư vấn của các chuyên gia, thảo luận và chỉnh sửa, Khoa CNTT đã hoàn thành báo cáo TĐG CTĐT ngành CNTT. Báo cáo TĐG CTĐT ngành CNTT đã mô tả rõ ràng và đầy đủ các hoạt động của CTĐT, trong đó, chỉ ra những điểm mạnh, những điểm tồn tại, khó khăn cũng như Kế hoạch hành động chất lượng trong thời gian tới. Nội dung chi tiết của báo cáo sẽ được thể hiện trong phần II, phần TĐG theo những tiêu chuẩn, tiêu chí.'
                          ,
                          style: TextStyle(
                              fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                      child: Text(
                        '·       Hệ thống đảm bảo chất lượng của chương trình',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.orangeAccent
                        ),
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                        child: Text(
                          'Hệ thống ĐBCL bên trong (IQA) của Khoa là một bộ phận của hệ thống đảm bảo chất lượng tổng thể của nhà trường (TQM). Hệ thống này nhằm giúp Khoa vận hành, theo dõi, giám sát, đánh gía và cải tiến liên tục chương trình. Các hoạt động ĐBCL của Khoa bao gồm đảm bảo chất lượng đầu vào (chương trình, giảng viên, học viên, sinh viên, nguồn lực cơ sở vật chất-trang thiết bị), đảm bảo chất lượng tiến trình (các hoạt động dạy và học, nghiên cứu khoa học, phục vụ cộng đồng của giảng viên và sinh viên) và đảm bảo chất lượng đầu ra (sinh viên/ học viên tốt nghiệp, thành quả nghiên cứu khoa học và chuyển giao công nghệ của giảng viên và sinh viên/ học viên, sự hài lòng của các bên liên quan).',
                          style: TextStyle(
                              fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 5, 5, 5),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'KHOA CÔNG NGHỆ THÔNG TIN',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
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

