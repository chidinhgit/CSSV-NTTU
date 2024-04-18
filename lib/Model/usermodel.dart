class UserModel {
  String username; //Ma SV or GV
  String isgiangvien; //1: Nguoi dung giang vien
  String hoten; //Ho ten
  String status; //trang thai dang nhap
  String id; //ID sinh vien hoac giang vien
  String dienthoai;
  String diachi;
  String noisinh;
  String gioitinh;
  String ngaysinh;

  UserModel({
    this.username = "",
    this.isgiangvien = "0",
    this.hoten = "",
    this.status = "",
    this.id = "",
    this.dienthoai = "",
    this.diachi = "",
    this.noisinh = "",
    this.gioitinh = "",
    this.ngaysinh = "",
  });
}
