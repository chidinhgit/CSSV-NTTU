class SinhVienModel {
  String id;
  String mssv;
  String matKhau;
  String hoTen;
  String dienThoai;
  String idKhoa;
  String tenLop;
  String diaChi;
  String gioiTinh;
  String noiSinh;
  String ngaySinh;

  SinhVienModel({
    this.id = "",
    this.mssv = "",
    this.matKhau = "",
    this.hoTen = "",
    this.dienThoai = "",
    this.idKhoa = "",
    this.tenLop = "",
    this.diaChi = "",
    this.gioiTinh = "",
    this.noiSinh = "",
    this.ngaySinh = "",
  });

  factory SinhVienModel.fromJson(Map<String, dynamic> json) {
    return SinhVienModel(
      id: json['ID'].toString() ?? "",
      mssv: json['MSSV'] ?? "",
      matKhau: json['MatKhau'] ?? "",
      hoTen: json['HoTen'] ?? "",
      dienThoai: json['DienThoai'] ?? "",
      idKhoa: json['ID_Khoa'].toString() ?? "",
      tenLop: json['TenLop'] ?? "",
      diaChi: json['DiaChi'] ?? "",
      gioiTinh: json['GioiTinh'] ?? "",
      noiSinh: json['NoiSinh'] ?? "",
      ngaySinh: json['NgaySinh'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['MSSV'] = this.mssv;
    data['MatKhau'] = this.matKhau;
    data['HoTen'] = this.hoTen;
    data['DienThoai'] = this.dienThoai;
    data['ID_Khoa'] = this.idKhoa;
    data['TenLop'] = this.tenLop;
    data['DiaChi'] = this.diaChi;
    data['GioiTinh'] = this.gioiTinh;
    data['NoiSinh'] = this.noiSinh;
    data['NgaySinh'] = this.ngaySinh;
    return data;
  }
}
