import 'package:flutter/material.dart';
import 'package:notification_nttu/API/ThoiKhoaBieuAPI.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../Model/ThoiKhoaBieuModel.dart';
import 'package:notification_nttu/shared_preferences.dart';
import '../../Model/usermodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:notification_nttu/Screen/tinhnang/myfunction.dart';

void main() {
  runApp(MaterialApp(
    home: TimetableApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class EventScreen extends StatelessWidget {
  final DateTime selectedDay;

  EventScreen({required this.selectedDay});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class TimetableApp extends StatefulWidget {
  const TimetableApp({Key? key}) : super(key: key);

  @override
  State<TimetableApp> createState() => _TimetableAppState();
}

class _TimetableAppState extends State<TimetableApp> {
  DateTime today = DateTime.now();
  List<TKB> timetableData = [];
  UserModel usermodel = new UserModel();

  Future<void> checkLoginStatus() async {
    final UserModel um = await UserPreferences.getUserData();
    setState(() {
      usermodel = um;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thời khóa biểu"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: content(),
    );
  }

  Widget content() {
    return Column(
      children: [
        Container(
          child: TableCalendar(
            locale: "en_US",
            rowHeight: 43,
            headerStyle: HeaderStyle(formatButtonVisible: false),
            selectedDayPredicate: (day) => isSameDay(day, today),
            focusedDay: today,
            firstDay: DateTime.utc(2023, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            onDaySelected: _onDaySelected,
          ),
        ),
        SizedBox(
          height: 50,
        ),
        ElevatedButton(
          onPressed: () async {
            List<TKB> timetable = await ThoiKhoabieuAPI().getThoiKhoaBieu(
                usermodel.id,
                MyFunction().convertDateSQL(today),
                usermodel.isgiangvien);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    Lichhoc(thoikhoabieu: timetable, usermodel: usermodel),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
                horizontal: 125, vertical: 8), // Điều chỉnh kích thước nút
          ),
          child: Text("Lịch học", style: TextStyle(fontSize: 16)),
        ),
        SizedBox(
          height: 5,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Lichthi(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
                horizontal: 130, vertical: 7), // Điều chỉnh kích thước nút
          ),
          child: Text("Lịch thi", style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }

  // onDaySelected
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) async {
    setState(() {
      today = selectedDay;
    });
    List<TKB> timetable = await ThoiKhoabieuAPI().getThoiKhoaBieu(usermodel.id,
        MyFunction().convertDateSQL(selectedDay), usermodel.isgiangvien);

    if (timetable.isNotEmpty) {
      // Mở màn hình "Lichhoc" với dữ liệu của ngày được chọn
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Tatca(timetableData: timetable,usermodel: usermodel),
        ),
      );
    } else {
      // Nếu không có sự kiện nào trong ngày được chọn, hiển thị thông báo
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Thông báo'),
          content: Text('Không có lịch học nào trong ngày này.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}

class Tatca extends StatefulWidget {
  final List<TKB> timetableData;
  final UserModel usermodel; 

  Tatca({required this.timetableData, required this.usermodel});

  @override
  _TatcaState createState() => _TatcaState();
}

class _TatcaState extends State<Tatca> {
  @override
  Widget build(BuildContext context) {
    widget.timetableData
        .sort((a, b) => (a.tietBatDau ?? 0).compareTo(b.tietBatDau ?? 0));

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text(widget.usermodel.isgiangvien=='1'?'Lịch dạy':'Lịch học',
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.timetableData.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                  'Tiết ${widget.timetableData[index].tietBatDau ?? ''}'),
                              SizedBox(width: 2),
                              Text('-'),
                              SizedBox(width: 2),
                              Text(
                                  ' ${widget.timetableData[index].tietKetThuc ?? ''}'),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                  '${widget.timetableData[index].tenLop ?? ''}'),
                              SizedBox(height: 5),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  ' : ${widget.timetableData[index].tenMonHoc ?? ''}',
                                  maxLines: 1, // Đảm bảo text có thể xuống dòng
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                              SizedBox(height: 5),
                            ],
                          ),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Địa điểm: ${widget.timetableData[index].phongHoc ?? ''}'),
                          Text(
                              'Loại lớp: ${widget.timetableData[index].loaiLop ?? ''}'),
                          Text(
                              'Giảng viên: ${widget.usermodel.isgiangvien=='1'?widget.usermodel.hoten:widget.timetableData[index].hoTen ?? ''}'),
                        ],
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Lichhoc extends StatefulWidget {
  final UserModel usermodel;
  List<TKB> thoikhoabieu;
  DateTime ngayhoc = DateTime.now();
  Lichhoc({required this.thoikhoabieu, required this.usermodel});

  @override
  _LichhocState createState() => _LichhocState();
}

class _LichhocState extends State<Lichhoc> {

  @override
  Widget build(BuildContext context) {
    widget.thoikhoabieu
        .sort((a, b) => (a.tietBatDau ?? 0).compareTo(b.tietBatDau ?? 0));
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text(
            (widget.usermodel.isgiangvien=='1'?'Lịch dạy ':'Lịch học ') + '( ${widget.ngayhoc.day}-${widget.ngayhoc.month}-${widget.ngayhoc.year} ) ',
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.thoikhoabieu.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                  'Tiết ${widget.thoikhoabieu[index].tietBatDau ?? ''}'),
                              SizedBox(width: 2),
                              Text('-'),
                              SizedBox(width: 2),
                              Text(
                                  ' ${widget.thoikhoabieu[index].tietKetThuc ?? ''}'),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                  '${widget.thoikhoabieu[index].tenLop ?? ''}'),
                              SizedBox(height: 5),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  ' : ${widget.thoikhoabieu[index].tenMonHoc ?? ''}',
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                              SizedBox(height: 5),
                            ],
                          ),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Địa điểm: ${widget.thoikhoabieu[index].phongHoc ?? ''}'),
                          Text(
                              'Loại lớp: ${widget.thoikhoabieu[index].loaiLop ?? ''}'),
                          Text(
                              'Giảng viên: ${widget.usermodel.isgiangvien=='1'?widget.usermodel.hoten:widget.thoikhoabieu[index].hoTen ?? ''}'),
                        ],
                      ));
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () async {
                    setState(() {
                      widget.ngayhoc =
                          widget.ngayhoc.subtract(Duration(days: 1));
                    });

                    // Tải dữ liệu lịch học mới cho ngày mới
                    List<TKB> newTimetable =
                        await ThoiKhoabieuAPI().getThoiKhoaBieu(
                      widget.usermodel.id,
                      MyFunction().convertDateSQL(widget.ngayhoc),
                      widget.usermodel.isgiangvien,
                    );

                    setState(() {
                      widget.thoikhoabieu = newTimetable;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () async {
                    setState(() {
                      widget.ngayhoc = widget.ngayhoc.add(Duration(days: 1));
                    });

                    // Tải dữ liệu lịch học mới cho ngày mới
                    List<TKB> newTimetable =
                        await ThoiKhoabieuAPI().getThoiKhoaBieu(
                      widget.usermodel.id,
                      MyFunction().convertDateSQL(widget.ngayhoc),
                      widget.usermodel.isgiangvien,
                    );

                    setState(() {
                      widget.thoikhoabieu = newTimetable;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Lichthi extends StatefulWidget {
  @override
  _LichthiState createState() => _LichthiState();
}

class _LichthiState extends State<Lichthi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text('Lịch thi',
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }
}
