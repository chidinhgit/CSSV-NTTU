// api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Model/ykiencanhanmodel.dart';

class APIykiencanhan {
  final String apiUrl;
  APIykiencanhan(
      {this.apiUrl = 'http://apicssv.daihocsontt.edu.vn:8668/View/index.php/ykiencanhan/'});
  Future<List<YKienCaNhan>> fetchYKienCaNhan() async {
    try{
    final response = await http.get(Uri.parse(apiUrl + 'listall'));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
       return responseData.map((json) => YKienCaNhan.fromJson(json)).toList();
     } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load ý kiến: $e');
    }
  }

  Future<bool> guiYKienCaNhan(YKienCaNhan ykien) async {
    try{
      final response = await http.post(Uri.parse(apiUrl + 'insert'),
        headers: <String, String>
        {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(ykien.toJson()),
      );
      if (response.statusCode == 200) {
        return true;
      }
      else
      {
        throw Exception('Failed to upload data');
        //return false;
      }
    } catch (e) {
        throw Exception('Failed to upload ý kiến: $e');
    }
  }
  Future<bool> capnhatYKienCaNhan(YKienCaNhan ykien) async {
    try{
      final response = await http.put(Uri.parse(apiUrl + 'update'),
        headers: <String, String>
        {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(ykien.toJson()),
      );
      if (response.statusCode == 200) {
        return true;
      }
      else
      {
        throw Exception('Failed to upload data');
        //return false;
      }
    } catch (e) {
      throw Exception('Failed to upload ý kiến: $e');
    }
  }
}