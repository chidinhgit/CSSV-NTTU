// api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/giangVienModel.dart';

class GiangVienAPI {
  final String apiUrl;
  GiangVienAPI(
      {this.apiUrl =
          'http://apicssv.daihocsontt.edu.vn:8668/View/index.php/giangvien/'});
  Future<List<GiangVienModel>> getGiangVien(String id) async {
    if (id.isEmpty) return [];
    try {
      final response = await http.get(Uri.parse(apiUrl + 'listbyid?id=' + id));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        // ignore: unnecessary_type_check
        if (responseData is List) {
          return responseData
              .map((data) => GiangVienModel.fromJson(data))
              .toList();
        } else if (responseData is Map<String, dynamic>) {
          return [
            GiangVienModel.fromJson(responseData as Map<String, dynamic>)
          ];
        } else {
          throw Exception('Invalid response data format');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load giảng viên: $e');
    }
  }

  Future<bool> themGiangVien(GiangVienModel gv) async {
    try {
      final response = await http.post(
        Uri.parse('${apiUrl}insert'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(gv.toJson()),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to upload data');
        //return false;
      }
    } catch (e) {
      throw Exception('Failed to upload giảng viên: $e');
    }
  }

  Future<bool> capnhatGiangVien(GiangVienModel gv) async {
    try {
      final response = await http.put(
        Uri.parse('${apiUrl}update'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(gv.toJson()),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to upload data');
        //return false;
      }
    } catch (e) {
      throw Exception('Failed to update giảng viên: $e');
    }
  }
}
