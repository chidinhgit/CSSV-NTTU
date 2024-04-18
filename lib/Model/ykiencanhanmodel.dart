class YKienCaNhan {
  final int id;
  final int idSinhVien;
  final String tieuDe;
  final String noiDung;
  final String phanHoi;

  YKienCaNhan({
    this.id = 0,
    this.idSinhVien = 0,
    this.tieuDe = "",
    this.noiDung ="",
    this.phanHoi= "",
  });

  factory YKienCaNhan.fromJson(Map<String, dynamic> json) {
    return YKienCaNhan(
      id: json['ID']?? 0,
      idSinhVien: json['ID_SinhVien']?? 0,
      tieuDe: json['TieuDe']?? "",
      noiDung: json['NoiDung']?? "",
      phanHoi: json['PhanHoi']?? "",
    );
  }
  Map<String, dynamic> toJson() => {
    'id': id,
    'ID_SinhVien': idSinhVien,
    'TieuDe': tieuDe,
    'NoiDung': noiDung,
    'PhanHoi': phanHoi,
  };
}