import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:notification_nttu/Model/sinhVienModel.dart';

class LoginSVAPI {
  Future<List<SinhVienModel>> login(String username, String password) async {
    final response = await http.get(Uri.parse('http://apicssv.daihocsontt.edu.vn:8668/View/index.php/sinhvien/login?username=$username&password=$password'));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      // Kiểm tra nếu responseData là một danh sách
      if (responseData is List) {
        // Chuyển đổi từng phần tử trong danh sách thành đối tượng SinhVienModel
        return responseData.map((data) => SinhVienModel.fromJson(data)).toList();
      } else if (responseData is Map<String, dynamic>) {
        // Nếu responseData là một đối tượng, trả về một danh sách gồm một đối tượng SinhVienModel
        return [SinhVienModel.fromJson(responseData as Map<String, dynamic>)];
      } else {
        // Nếu responseData không phải là danh sách hoặc đối tượng, ném ra một ngoại lệ
        throw Exception('Invalid response data format');
      }
    } else {
      throw Exception('Failed to login');
    }
  }

}
