class LichDayGiangVienModel {
  String MaLopHocPhan;
  String ID_SinhVien;
  String NgayHoc;
  String ID_GiangVien;
  String HoTen;
  String TenMonHoc;
  String TietBatDau;
  String TietKetThuc;

  LichDayGiangVienModel({
    this.MaLopHocPhan = "",
    this.ID_SinhVien = "",
    this.NgayHoc = "",
    this.ID_GiangVien = "",
    this.HoTen = "",
    this.TenMonHoc = "",
    this.TietBatDau = "",
    this.TietKetThuc = "",
  });

  factory LichDayGiangVienModel.fromJson(Map<String, dynamic> json) {
    return LichDayGiangVienModel(
      MaLopHocPhan: json['MaLopHocPhan'].toString() ?? "",
      ID_SinhVien: json['ID_SinhVien'].toString() ?? "",
      NgayHoc: json['NgayHoc'] ?? "",
      ID_GiangVien: json['ID_GiangVien'].toString() ?? "",
      HoTen: json['HoTen'] ?? "",
      TenMonHoc: json['TenMonHoc'].toString() ?? "",
      TietBatDau: json['TietBatDau'].toString() ?? "",
      TietKetThuc: json['TietKetThuc'].toString() ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MaLopHocPhan'] = this.MaLopHocPhan;
    data['ID_SinhVien'] = this.ID_SinhVien;
    data['NgayHoc'] = this.NgayHoc;
    data['ID_GiangVien'] = this.ID_GiangVien;
    data['HoTen'] = this.HoTen;
    data['TenMonHoc'] = this.TenMonHoc;
    data['TietBatDau'] = this.TietBatDau;
    data['TietKetThuc'] = this.TietKetThuc;
    return data;
  }
}