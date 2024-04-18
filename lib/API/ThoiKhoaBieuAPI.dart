import 'package:dio/dio.dart';
import '../Model/ThoiKhoaBieuModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ThoiKhoabieuAPI {
  final String apiUrl;
  ThoiKhoabieuAPI(
      {this.apiUrl = 'http://apicssv.daihocsontt.edu.vn:8668/View/index.php/'});
  Future<List<TKB>> getThoiKhoaBieu(
      String id_, String ngayhoc, String isgv) async {
    try {
      String myapiurl_ = "";
      if (isgv == '1')
        myapiurl_ =
            this.apiUrl + 'giangvien/lichhoc?id=' + id_ + '&ngayhoc=' + ngayhoc;
      else
        myapiurl_ =
            this.apiUrl + 'sinhvien/lichhoc?id=' + id_ + '&ngayhoc=' + ngayhoc;
      final response = await http.get(Uri.parse(myapiurl_));
      print(myapiurl_);
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        return responseData.map((json) => TKB.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load thong baos: $e');
    }
  }
}
