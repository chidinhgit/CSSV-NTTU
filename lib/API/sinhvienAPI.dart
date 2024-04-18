// api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/sinhVienModel.dart';
import '../Model/lichdaygiangvienModel.dart';

class SinhVienAPI {
  final String apiUrl;
  SinhVienAPI(
      {this.apiUrl =
          'http://apicssv.daihocsontt.edu.vn:8668/View/index.php/sinhvien/'});
  Future<List<SinhVienModel>> getSinhVien(String id) async {
    if (id.isEmpty) return [];
    try {
      final response = await http.get(Uri.parse(apiUrl+'listbyid?id='+id));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        // ignore: unnecessary_type_check
        if (responseData is List) {
          return responseData
              .map((data) => SinhVienModel.fromJson(data))
              .toList();
        } else if (responseData is Map<String, dynamic>) {
          return [SinhVienModel.fromJson(responseData as Map<String, dynamic>)];
        } else {
          throw Exception('Invalid response data format');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load sinh viên: $e');
    }
  }
  Future <List<LichDayGiangVienModel>> getSinhVienLichhoc(String id, String ngayhoc ) async
  {
    if (id.isEmpty) return [];
    try
    {
      final response = await http.get(Uri.parse(apiUrl+'lichhocsinhvien?id='+id+'&ngayhoc='+ngayhoc));
      if (response.statusCode == 200)
      {
        final List<dynamic> responseData = json.decode(response.body);
        // ignore: unnecessary_type_check
        if (responseData is List)
        {
          return responseData.map((data) => LichDayGiangVienModel.fromJson(data)).toList();
        }
        else if (responseData is Map<String, dynamic>)
        {
          return [LichDayGiangVienModel.fromJson(responseData as Map<String, dynamic>)];
        }
        else
        {
          throw Exception('Invalid response data format');
        }
      }
      else
      {
        throw Exception('Failed to load data');
      }
    }
    catch (e)
    {
      throw Exception('Failed to load sinh viên: $e');
    }
  }

  Future<bool> themSinhVien(SinhVienModel sv) async {
    try {
      final response = await http.post(
        Uri.parse('${apiUrl}insert'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(sv.toJson()),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to upload data');
        //return false;
      }
    } catch (e) {
      throw Exception('Failed to upload sinh viên: $e');
    }
  }

  Future<bool> capnhatSinhVien(SinhVienModel sv) async {
    try {
      final response = await http.put(
        Uri.parse('${apiUrl}update'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(sv.toJson()),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to upload data');
        //return false;
      }
    } catch (e) {
      throw Exception('Failed to update sinh viênn: $e');
    }
  }
}
