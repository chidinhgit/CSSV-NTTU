class GiangVienModel {
  String id;
  String maNV;
  String matKhau;
  String hoTen;
  String dienThoai;
  String email;
  String quyen;
  String idKhoa;
  String diaChi;
  String gioiTinh;
  String noiSinh;
  String ngaySinh;

  GiangVienModel({
    this.id = "",
    this.maNV = "",
    this.matKhau = "",
    this.hoTen = "",
    this.dienThoai = "",
    this.email = "",
    this.quyen = "",
    this.idKhoa = "",
    this.diaChi = "",
    this.gioiTinh = "",
    this.noiSinh = "",
    this.ngaySinh = "",
  });

  factory GiangVienModel.fromJson(Map<String, dynamic> json) {
    return GiangVienModel(
      id: json['ID'].toString() ?? "",
      maNV: json['MaNV'] ?? "",
      matKhau: json['MatKhau'] ?? "",
      hoTen: json['HoTen'] ?? "",
      dienThoai: json['DienThoai'] ?? "",
      email: json['Email'] ?? "",
      quyen: json['Quyen'].toString() ?? "",
      idKhoa: json['ID_Khoa'].toString() ?? "",
      diaChi: json['DiaChi'] ?? "",
      gioiTinh: json['GioiTinh'] ?? "",
      noiSinh: json['NoiSinh'] ?? "",
      ngaySinh: json['NgaySinh'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['MaNV'] = this.maNV;
    data['MatKhau'] = this.matKhau;
    data['HoTen'] = this.hoTen;
    data['DienThoai'] = this.dienThoai;
    data['Email'] = this.email;
    data['Quyen'] = this.quyen;
    data['ID_Khoa'] = this.idKhoa;
    data['DiaChi'] = this.diaChi;
    data['GioiTinh'] = this.gioiTinh;
    data['NoiSinh'] = this.noiSinh;
    data['NgaySinh'] = this.ngaySinh;
    return data;
  }
}
