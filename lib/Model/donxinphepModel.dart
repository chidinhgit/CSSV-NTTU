class NgayXinPhep {
  String id;
  String idSinhVien;
  String idGiangVien;
  String ngayXinPhep;
  String lyDo;

  NgayXinPhep({
    this.id ="",
    this.idSinhVien="",
    this.idGiangVien="",
    this.ngayXinPhep="",
    this.lyDo="",
  });

  factory NgayXinPhep.fromJson(Map<String, dynamic> json) {
    return NgayXinPhep(
      id: json['ID'].toString() ?? "",
      idSinhVien: json['ID_SinhVien'].toString() ?? "",
      idGiangVien: json['ID_GiangVien'].toString() ?? "",
      ngayXinPhep: json['NgayXinPhep']?? "",
      lyDo: json['LyDo'] ?? "",
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'ID_SinhVien': this.idSinhVien,
      'ID_GiangVien': this.idGiangVien,
      'NgayXinPhep': this.ngayXinPhep,
      'LyDo': this.lyDo,
    };
  }
}