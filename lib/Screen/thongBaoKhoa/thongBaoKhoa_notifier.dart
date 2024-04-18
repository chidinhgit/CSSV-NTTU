import 'package:dio/dio.dart';
import '../../Model/thongBaoModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ThongBaoAPI {
  final String apiUrl;

  ThongBaoAPI({this.apiUrl = 'http://apicssv.daihocsontt.edu.vn:8668/View/index.php/thongbao/listall'});

  Future<List<ThongBaoModel>> fetchThongBaos() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        return responseData.map((json) => ThongBaoModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load thong baos: $e');
    }
  }
}


