class TKB {
  String? tenMonHoc;
  String? maLopHocPhan;
  String? tenLop;
  String? loaiLop;
  String? hoTen;
  int? nhom;
  String? phongHoc;
  int? tietBatDau;
  int? tietKetThuc;

  TKB(
      {this.tenMonHoc,
      this.maLopHocPhan,
      this.tenLop,
      this.loaiLop,
      this.hoTen,
      this.nhom,
      this.phongHoc,
      this.tietBatDau,
      this.tietKetThuc});

  TKB.fromJson(Map<String, dynamic> json) {
    tenMonHoc = json['TenMonHoc'];
    maLopHocPhan = json['MaLopHocPhan'];
    tenLop = json['TenLop'];
    loaiLop = json['LoaiLop'];
    hoTen = json['HoTen'];
    nhom = json['Nhom'];
    phongHoc = json['PhongHoc'];
    tietBatDau = json['TietBatDau'];
    tietKetThuc = json['TietKetThuc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TenMonHoc'] = this.tenMonHoc;
    data['MaLopHocPhan'] = this.maLopHocPhan;
    data['TenLop'] = this.tenLop;
    data['LoaiLop'] = this.loaiLop;
    data['HoTen'] = this.hoTen;
    data['Nhom'] = this.nhom;
    data['PhongHoc'] = this.phongHoc;
    data['TietBatDau'] = this.tietBatDau;
    data['TietKetThuc'] = this.tietKetThuc;
    return data;
  }
}
