import 'dart:math';

class RandomImageSelector {
  static String generateRandomImagePath(String content) {
    // Danh sách các tên hình ảnh
    List<String> imageNames = ['tBao1.png', 'tBao2.png', 'tBao3.png', 'tBao4.png'];

    // Lấy một số ngẫu nhiên từ 0 đến độ dài của danh sách hình ảnh
    int randomIndex = Random().nextInt(imageNames.length);

    // Lấy tên hình ảnh tương ứng với số ngẫu nhiên đã chọn
    String randomImageName = imageNames[randomIndex];

    // Trả về đường dẫn hình ảnh dựa trên tên hình ảnh và nội dung của thông báo
    return 'assets/images/tBaoKhoa/$randomImageName';
  }
}
