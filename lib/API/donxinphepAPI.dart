import '../Model/donxinphepModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DonXinPhepAPI {
  final String apiUrl;

  DonXinPhepAPI({this.apiUrl = 'http://apicssv.daihocsontt.edu.vn:8668/View/index.php/xinphep/'});

  Future<void> insertDonXinPhep(NgayXinPhep xinphep) async {
    print(xinphep.toJson());
    try {
      final response = await http.post(Uri.parse(apiUrl + 'insert'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(xinphep.toJson()),
      );

      if (response.statusCode == 200) {
        print('Đã thêm đơn xin phép thành công');
      } else {
        throw Exception('Failed to insert đơn xin phép');
      }
    } catch (e) {
      throw Exception('Failed to insert đơn xin phép: $e');
    }
  }
  Future<String?> layIDGiangVien(DateTime selectedDay, String userId) async {
    try {
      // Xây dựng URL để gửi yêu cầu lấy ID giảng viên
      String myapiurl = 'http://apicssv.daihocsontt.edu.vn:8668/View/index.php/sinhvien/lichhocsinhvien?id=$userId&ngayhoc=${selectedDay.toString()}';

      // Gửi yêu cầu lấy ID giảng viên và đợi phản hồi
      final response = await http.get(Uri.parse(myapiurl));

      // Kiểm tra mã trạng thái của phản hồi
      if (response.statusCode == 200) {
        // Phân tích dữ liệu JSON nhận được từ phản hồi
        final responseData = json.decode(response.body);

        // Kiểm tra xem responseData có phải là danh sách không
        if (responseData is List) {
          // Lặp qua từng phần tử trong danh sách để tìm 'ID_GiangVien'
          for (var item in responseData) {
            // Kiểm tra xem phần tử hiện tại có chứa 'ID_GiangVien' không
            if (item.containsKey('ID_GiangVien')) {
              // Lấy ID giảng viên từ phần tử hiện tại và trả về
              String? idGiangVien = item['ID_GiangVien']?.toString();
              return idGiangVien;
            }
          }
        }

        // Nếu không tìm thấy 'ID_GiangVien' trong danh sách, trả về null
        return null;
      } else {
        // Nếu không thành công, ném ra một ngoại lệ với thông báo lỗi
        throw Exception('Failed to load ID giảng viên');
      }
    } catch (e) {
      // Nếu có lỗi, ném ra một ngoại lệ với thông báo lỗi cụ thể
      throw Exception('Failed to load ID giảng viên: $e');
    }
  }
}