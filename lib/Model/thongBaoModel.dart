class ThongBaoModel {
  int id;
  int idGiangVien;
  String ngayDang;
  String tieuDe;
  String noiDung;
  String file;
  int idKhoa;
  String imagePath;

  ThongBaoModel({
    this.id = 0,
    this.idGiangVien = 0,
    this.ngayDang = "",
    this.tieuDe = "",
    this.noiDung = "",
    this.file = "",
    this.idKhoa = 0,
    this.imagePath = "",
  });

  factory ThongBaoModel.fromJson(Map<String, dynamic> json) => ThongBaoModel(
    id: json['ID'] ?? 0,
    idGiangVien: json['ID_GiangVien'] ?? 0,
    ngayDang: json['NgayDang'] ?? "",
    tieuDe: json['TieuDe'] ?? "",
    noiDung: json['NoiDung'] ?? "",
    file: json['File'] ?? "",
    idKhoa: json['ID_Khoa'] ?? 0,
    imagePath: '',
  );

  Map<String, dynamic> toJson() => {
    'ID': id,
    'ID_GiangVien': idGiangVien,
    'NgayDang': ngayDang,
    'TieuDe': tieuDe,
    'NoiDung': noiDung,
    'File': file,
    'ID_Khoa': idKhoa,
  };
}
