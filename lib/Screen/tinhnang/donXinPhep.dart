import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../Model/ThoiKhoaBieuModel.dart';
import '../../Model/donxinphepModel.dart';
import '../../Model/lichdaygiangvienModel.dart';
import '../../Model/usermodel.dart';
import '../../shared_preferences.dart';
import '../../API/ThoiKhoaBieuAPI.dart';
import 'myfunction.dart';
import '../../API/donxinphepAPI.dart';
import '../../API/sinhvienAPI.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}

class DonXinPhep extends StatefulWidget {
  @override
  _DonXinPhepState createState() => _DonXinPhepState();
}
class _DonXinPhepState extends State<DonXinPhep> {
  UserModel usermodel = new UserModel();
  DateTime today = DateTime.now();
  String? _selectedLecturer;
  DateTime? _selectedDate;
  List<LichDayGiangVienModel> _danhSachGiangVien = [];
  List<String> _danhSachGiangVienStr = [];
  TextEditingController _lyDoController = TextEditingController();
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    final UserModel um = await UserPreferences.getUserData();
    setState(()
    {
      usermodel = um;
    });
  }
  // Chuỗi có thể là null
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) async {
    if (await coLichHoc(selectedDay)) {
      layVaCapNhatDanhSachGiangVien(selectedDay,usermodel.id);
    } else {
      // Xử lý khi không có lịch học vào ngày được chọn
    }
    setState(() {
      _selectedDate = selectedDay;

    });

    print('Ngày đã chọn: $_selectedDate');


  }
  // Hàm xử lý khi nhấn nút "Lưu"
  void _onSaveButtonPressed() async {

    if ((_selectedDate!=null) && (_selectedLecturer != null)) {
      String lyDo = _lyDoController.text.trim();
      String ngayhoc = MyFunction().convertDateSQL(_selectedDate!);
      String idGV = _selectedLecturer.toString().split('-')[0];
      // Kiểm tra xem lý do đã được nhập hay chưa
      if (lyDo.isNotEmpty) {
        // Tạo một đối tượng DonXinPhepModel
          NgayXinPhep donXinPhep = NgayXinPhep(
          idSinhVien: usermodel.id,
          idGiangVien: "",
          ngayXinPhep: ngayhoc,
          lyDo: lyDo,
        );

        try {
          // Gửi đơn xin phép lên server bằng API
          await DonXinPhepAPI().insertDonXinPhep(donXinPhep);

          // Hiển thị thông báo thành công
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Đã gửi đơn xin phép thành công')),
          );
        } catch (e) {
          // Hiển thị thông báo lỗi nếu có lỗi xảy ra
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Đã xảy ra lỗi khi gửi đơn xin phép: $e')),
          );
        }
      } else {
        // Hiển thị thông báo nếu lý do chưa được nhập
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Vui lòng nhập lý do xin phép')),
        );
      }
    } else {
      // Hiển thị thông báo nếu ngày hoặc giảng viên chưa được chọn
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Vui lòng chọn ngày và giảng viên')),
      );
    }
  }
  // Hàm kiểm tra xem có lịch học vào ngày được chọn không
  Future<bool> coLichHoc(DateTime selectedDay) async {
    try {
      List<TKB> timetable = await ThoiKhoabieuAPI().getThoiKhoaBieu(
        usermodel.id,
        MyFunction().convertDateSQL(selectedDay),
        usermodel.isgiangvien,
      );
      if (timetable.isNotEmpty) {
        return true; //  Có lịch học
      } else {
        return false; //Không Có lịch học
      }
    } catch (e) {
      // Hiển thị hộp thoại thông báo lỗi
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Lỗi'),
          content: Text('Đã xảy ra lỗi khi tải dữ liệu. Vui lòng thử lại sau.'),
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
      // In ra lỗi trong console
      print('Không thể tải dữ liệu thời gian biểu: $e');
      // Trả về giá trị mặc định khi gặp lỗi
      return false;
    }
  }


  // Hàm lấy và cập nhật danh sách giảng viên dạy trong ngày được chọn
  Future<void> layVaCapNhatDanhSachGiangVien(DateTime selectedDay, String userId ) async {
    try {
      //List<String> danhSachGiangVien = await ThoiKhoabieuAPI().layDanhSachGiangVien(selectedDay,usermodel.id);
      List<LichDayGiangVienModel> danhSachGiangVien = await SinhVienAPI().getSinhVienLichhoc(userId, MyFunction().convertDateSQL(selectedDay));
      // In danh sách giảng viên từ API ra console để kiểm tra
      print('Danh sách giảng viên từ API: $danhSachGiangVien');

      setState(() {
        _danhSachGiangVien = danhSachGiangVien;
        _danhSachGiangVienStr = danhSachGiangVien.map<String>((item)
        {
          String tenGV = item.ID_GiangVien;
          String idGV = item.HoTen;
          String tBD = item.TietBatDau;
          String tKT = item.TietKetThuc;
          return idGV + '-' + tenGV + '(Tiết' + tBD + '-' + tKT +')';
        }).toList();
      });
    } catch (e) {
      // Xử lý lỗi nếu cần
      print('Lỗi khi lấy danh sách giảng viên: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đơn Xin Phép'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Ngày Xin Phép:',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 10),
              Container(

                child: TableCalendar(
                  locale: "en_US",
                  rowHeight: 43,
                  headerStyle: HeaderStyle(formatButtonVisible: false),
                  selectedDayPredicate: (day) => _selectedDate != null ? isSameDay(day, _selectedDate!) : false, // Kiểm tra _selectedDate không null trước khi sử dụng nó
                  focusedDay: _selectedDate ?? today,
                  firstDay: DateTime.utc(2023, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  onDaySelected: _onDaySelected,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Giảng Viên:',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 10),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), // Độ cong của góc
                  border: Border.all(
                    width: 2, // Độ dày của viền
                    color: Colors.black26, // Màu sắc của viền
                  ),
                ),
                child: // Hiển thị indicator khi danh sách đang được tải
                DropdownButton<String>(
                  isExpanded: true,
                  isDense: true,
                  value: _selectedLecturer,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedLecturer = newValue;
                    });
                  },
                  items: [
                    // Thêm một mục đầu tiên với giá trị null và văn bản mô tả
                    DropdownMenuItem<String>(
                      value: null,
                      child: Text('Chọn giảng viên'),
                    ),
                    // Thêm các mục còn lại từ danh sách giảng viên
                    ..._danhSachGiangVienStr.asMap().entries.map<DropdownMenuItem<String>>((entry) {
                      int index = entry.key;
                      String value = entry.value;
                      return DropdownMenuItem<String>(
                        value: '$value-$index', // Kết hợp giá trị với chỉ số để đảm bảo tính duy nhất
                        child: Text(value),
                      );
                    }).toList(),
                  ],
                ),


              ),


              SizedBox(height: 20),
              TextField(
                controller: _lyDoController,
                decoration: InputDecoration(labelText: 'Lý do'),
              ),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {_onSaveButtonPressed(); },
                child: Text(
                  'Lưu',
                  style: TextStyle(fontSize: 16.0,),
                ),
              ),
              // Thêm khoảng cách giữa các nút
            ],
          ),
        ),

      ),
    );
  }
}