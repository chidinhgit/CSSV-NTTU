import 'package:shared_preferences/shared_preferences.dart';
import './Model/usermodel.dart';
import './Model/giangVienModel.dart';
import './Model/sinhVienModel.dart';

class UserPreferences {
  static const String _keyUsername = 'username';
  static const String _keyIsgiangvien = 'isgiangvien';
  static const String _keyID = 'id';
  static const String _keyHoten = 'hoten';
  static const String _keyStatus = 'status';
  static const String _keyDienthoai = 'dienthoai';
  static const String _keyDiachi = 'diachi';
  static const String _keyNoisinh = 'noisinh';
  static const String _keyGioitinh = 'gioitinh';
  static const String _keyNgaysinh = 'ngaysinh';

  static Future<void> saveUserData_(String id, String username, String hoten,
      String isgiangvien, String status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUsername, username);
    await prefs.setString(_keyIsgiangvien, isgiangvien);
    await prefs.setString(_keyID, id);
    await prefs.setString(_keyHoten, hoten);
    await prefs.setString(_keyStatus, status);
  }

  static Future<void> saveUserData_GV(GiangVienModel gvmodel) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUsername, gvmodel.maNV);
    await prefs.setString(_keyIsgiangvien, '1');
    await prefs.setString(_keyID, gvmodel.id);
    await prefs.setString(_keyHoten, gvmodel.hoTen);
    await prefs.setString(_keyStatus, '1');
    await prefs.setString(_keyDienthoai, gvmodel.dienThoai);
    await prefs.setString(_keyDiachi, gvmodel.diaChi);
    await prefs.setString(_keyNoisinh, gvmodel.noiSinh);
    await prefs.setString(_keyGioitinh, gvmodel.gioiTinh);
    await prefs.setString(_keyNgaysinh, gvmodel.ngaySinh);
  }

  static Future<void> saveUserData_SV(SinhVienModel svmodel) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUsername, svmodel.mssv);
    await prefs.setString(_keyIsgiangvien, '0');
    await prefs.setString(_keyID, svmodel.id);
    await prefs.setString(_keyHoten, svmodel.hoTen);
    await prefs.setString(_keyStatus, '1');
    await prefs.setString(_keyDienthoai, svmodel.dienThoai);
    await prefs.setString(_keyDiachi, svmodel.diaChi);
    await prefs.setString(_keyNoisinh, svmodel.noiSinh);
    await prefs.setString(_keyGioitinh, svmodel.gioiTinh);
    await prefs.setString(_keyNgaysinh, svmodel.ngaySinh);
  }

  static Future<UserModel> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final UserModel usermodel_ = new UserModel();
    usermodel_.id = prefs.getString(_keyID) ?? "";
    usermodel_.username = prefs.getString(_keyUsername) ?? "";
    usermodel_.hoten = prefs.getString(_keyHoten) ?? "";
    usermodel_.isgiangvien = prefs.getString(_keyIsgiangvien) ?? "";
    usermodel_.status = prefs.getString(_keyStatus) ?? "0";
    usermodel_.dienthoai = prefs.getString(_keyDienthoai) ?? "0";
    usermodel_.diachi = prefs.getString(_keyDiachi) ?? "0";
    usermodel_.noisinh = prefs.getString(_keyNoisinh) ?? "0";
    usermodel_.gioitinh = prefs.getString(_keyGioitinh) ?? "0";
    usermodel_.ngaysinh = prefs.getString(_keyNgaysinh) ?? "0";
    return usermodel_;
  }

  static Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyUsername);
    await prefs.remove(_keyIsgiangvien);
    await prefs.remove(_keyID);
    await prefs.remove(_keyHoten);
    await prefs.remove(_keyStatus);
    await prefs.remove(_keyDienthoai);
    await prefs.remove(_keyDiachi);
    await prefs.remove(_keyNoisinh);
    await prefs.remove(_keyGioitinh);
    await prefs.remove(_keyNgaysinh);
  }
}
