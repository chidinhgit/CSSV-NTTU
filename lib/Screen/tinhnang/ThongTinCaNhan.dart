import 'package:flutter/material.dart';
import 'package:notification_nttu/Model/usermodel.dart';
import 'package:notification_nttu/shared_preferences.dart';
import '../../Model/sinhVienModel.dart';
import '../../Model/giangVienModel.dart';
import '../../API/giangvienAPI.dart';
import '../../API/sinhvienAPI.dart';
import '../../main.dart' as man;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); //Them sau

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thông tin cá nhân',
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const UserProfilePage(),
    );
  }
}

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final apigiangvien = GiangVienAPI();
  final apisinhvien = SinhVienAPI();
  final apiuserpreferences = UserPreferences();

  List<SinhVienModel> sinhvien = [];
  List<GiangVienModel> giangvien = [];
  UserModel usermodelApp = UserModel();

  @override
  void initState() {
    super.initState();
    initializeData();
    checkLoginStatus();
    print(sinhvien);
  }

  Future<void> initializeData() async {
    await checkLoginStatus();
    if (usermodelApp.isgiangvien == '1') {
      await getGiangVien_info(usermodelApp.id);
    } else {
      await getSinhVien_info(usermodelApp.id);
    }
  }

  Future<void> checkLoginStatus() async {
    final UserModel um = await UserPreferences.getUserData();
    setState(() {
      usermodelApp = um;
      if (usermodelApp.status != '1') {
        man.MyAppState();
      }
    });
  }

  // ignore: non_constant_identifier_names
  Future<void> getGiangVien_info(String id) async {
    if (usermodelApp.isgiangvien == '1') {
      final List<GiangVienModel> gv = await apigiangvien.getGiangVien(id);
      setState(() {
        giangvien = gv;
      });
    }
  }

  // ignore: non_constant_identifier_names
  Future<void> getSinhVien_info(String id) async {
    if (usermodelApp.isgiangvien == '0') {
      final List<SinhVienModel> sv = await apisinhvien.getSinhVien(id);
      setState(() {
        sinhvien = sv;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Thông tin cá nhân'), actions: [
        IconButton(
          icon: Tooltip(
            message: 'Thay đổi thông tin',
            child: Icon(
              Icons.edit,
              color: Colors.blue,
            ),
          ),
          iconSize: 30,
          onPressed: () {
            String hoTen = usermodelApp.hoten;
            String soDienThoai =
                sinhvien.isNotEmpty ? sinhvien[0].dienThoai : '';

            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Thay đổi thông tin'),
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Họ và tên',
                          ),
                          controller: TextEditingController(text: hoTen),
                          onChanged: (value) {
                            hoTen = value;
                          },
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Số điện thoại',
                          ),
                          controller: TextEditingController(text: soDienThoai),
                          onChanged: (value) {
                            soDienThoai = value;
                          },
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Đóng dialog
                      },
                      child: Text('Hủy'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Lấy dữ liệu mới từ các trường nhập
                        String newHoTen = hoTen;
                        String newSoDienThoai = soDienThoai;
                        // Sau khi cập nhật thông tin thành công
                        setState(() {
                          usermodelApp.hoten =
                              newHoTen; // Cập nhật giá trị tên mới
                          sinhvien[0].dienThoai = newSoDienThoai;
                        });

                        if (usermodelApp.isgiangvien == "0") {}
                        // Tạo một đối tượng SinhVienModel mới với dữ liệu đã cập nhật
                        SinhVienModel updatedSinhVien = SinhVienModel(
                            id: usermodelApp
                                .id, // Sử dụng id của sinh viên hiện tại
                            mssv: sinhvien[0].mssv,
                            idKhoa: sinhvien[0].idKhoa,
                            tenLop: sinhvien[0].tenLop,
                            hoTen: newHoTen,
                            dienThoai: newSoDienThoai,
                            matKhau: sinhvien[0].matKhau);

                        // Gọi hàm capnhatSinhVien để cập nhật thông tin sinh viên
                        apisinhvien
                            .capnhatSinhVien(updatedSinhVien)
                            .then((success) {
                          if (success) {
                            // Nếu cập nhật thành công, hiển thị thông báo hoặc thực hiện các hành động khác
                            // Ví dụ: Hiển thị thông báo thành công
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Thông báo'),
                                  content:
                                      Text('Cập nhật thông tin thành công.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const UserProfilePage()),
                                        ); // Đóng dialog
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            // Nếu cập nhật không thành công, hiển thị thông báo lỗi
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Lỗi'),
                                  content: Text(
                                      'Đã xảy ra lỗi khi cập nhật thông tin.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // Đóng dialog
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        }).catchError((error) {
                          // Nếu có lỗi xảy ra trong quá trình gọi hàm capnhatSinhVien
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Lỗi'),
                                content: Text('Đã xảy ra lỗi: $error'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Đóng dialog
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        });

                        // Đóng hộp thoại
                        Navigator.of(context).pop();
                      },
                      child: Text('Lưu'),
                    ),
                  ],
                );
              },
            );
          },
        ),
        IconButton(
          icon: Tooltip(
            message: 'Đổi mật khẩu',
            child: Icon(
              Icons.lock_person,
              color: Colors.blue,
            ),
          ),
          iconSize: 30,
          onPressed: () {
            String oldPassword = ''; // Mật khẩu cũ
            String newPassword = ''; // Mật khẩu mới
            String confirmPassword = ''; // Xác nhận mật khẩu mới
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Đổi mật khẩu'),
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Mật khẩu cũ',
                          ),
                          onChanged: (value) {
                            oldPassword = value;
                          },
                          obscureText: true, // Ẩn mật khẩu
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Mật khẩu mới',
                          ),
                          onChanged: (value) {
                            newPassword = value;
                          },
                          obscureText: true, // Ẩn mật khẩu
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Nhập lại mật khẩu mới',
                          ),
                          onChanged: (value) {
                            confirmPassword = value;
                          },
                          obscureText: true, // Ẩn mật khẩu
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UserProfilePage()),
                        ); // Đóng dialog
                      },
                      child: Text('Hủy'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        // Kiểm tra xem mật khẩu mới và xác nhận mật khẩu mới có khớp nhau không
                        if (newPassword != confirmPassword) {
                          // Nếu mật khẩu mới và xác nhận mật khẩu mới không khớp, hiển thị thông báo lỗi
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Lỗi'),
                                content: Text(
                                    'Mật khẩu mới và xác nhận mật khẩu không khớp nhau. Vui lòng nhập lại.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Đóng dialog
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          // Nếu mật khẩu mới và xác nhận mật khẩu mới khớp nhau, thực hiện cập nhật mật khẩu
                          try {
                            SinhVienModel updatedSinhVien = SinhVienModel(
                                id: usermodelApp
                                    .id, // Sử dụng id của sinh viên hiện tại
                                mssv: sinhvien[0].mssv,
                                idKhoa: sinhvien[0].idKhoa,
                                tenLop: sinhvien[0].tenLop,
                                hoTen: sinhvien[0].hoTen,
                                dienThoai: sinhvien[0].dienThoai,
                                matKhau: newPassword

                                // Cập nhật các trường thông tin khác nếu cần
                                );

                            apisinhvien
                                .capnhatSinhVien(updatedSinhVien)
                                .then((success) {
                              if (success) {
                                // Nếu cập nhật thành công, hiển thị thông báo hoặc thực hiện các hành động khác
                                // Ví dụ: Hiển thị thông báo thành công
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Thông báo'),
                                      content: Text(
                                          'Cập nhật thông tin thành công.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(); // Đóng dialog
                                          },
                                          child: Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else {
                                // Nếu cập nhật không thành công, hiển thị thông báo lỗi
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Lỗi'),
                                      content: Text(
                                          'Đã xảy ra lỗi khi cập nhật thông tin.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(); // Đóng dialog
                                          },
                                          child: Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            });
                          } catch (e) {
                            // Xử lý lỗi khi gọi API cập nhật mật khẩu
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Lỗi'),
                                  content: Text(
                                      'Đã xảy ra lỗi khi cập nhật mật khẩu. Vui lòng thử lại sau.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // Đóng dialog
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        }
                      },
                      child: Text('Lưu'),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ]),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avatar.jpg'),
                  radius: 50,
                ),
                SizedBox(height: 20),
                Text(
                  // ignore: unnecessary_string_interpolations
                  usermodelApp.hoten,
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          ListTile(
            leading: Text("Trạng thái:", style: TextStyle(fontSize: 16)),
            trailing: Text("Đang học", style: TextStyle(fontSize: 16)),
          ),
          Divider(height: 1, thickness: 1.5, indent: 18),
          Divider(height: 1, thickness: 1.5, indent: 18),
          ListTile(
            leading: Text("Ngày sinh:", style: TextStyle(fontSize: 16)),
            trailing: Text("01/01/2003", style: TextStyle(fontSize: 16)),
          ),
          Divider(height: 1, thickness: 1.5, indent: 18),
          ListTile(
            leading: Text(usermodelApp.isgiangvien == '1' ? "Mã GV:" : "MSSV:",
                style: TextStyle(fontSize: 16)),
            trailing: Text('${usermodelApp.username}',
                style: TextStyle(fontSize: 16)),
          ),
          Divider(height: 1, thickness: 1.5, indent: 18),
          ListTile(
            leading: Text("Lớp:", style: TextStyle(fontSize: 16)),
            trailing: Text("21DTH3A", style: TextStyle(fontSize: 16)),
          ),
          Divider(height: 1, thickness: 1.5, indent: 18),
          ListTile(
            leading: Text("Bậc đào tạo:", style: TextStyle(fontSize: 16)),
            trailing: Text("Đại học", style: TextStyle(fontSize: 16)),
          ),
          Divider(height: 1, thickness: 1.5, indent: 18),
          ListTile(
            leading: Text("Khoa:", style: TextStyle(fontSize: 16)),
            trailing:
                Text("Công nghệ thông tin", style: TextStyle(fontSize: 16)),
          ),
          Divider(height: 1, thickness: 1.5, indent: 18),
          ListTile(
            leading: Text("Chuyên ngành:", style: TextStyle(fontSize: 16)),
            trailing: Text("Trí tuệ nhân tạo", style: TextStyle(fontSize: 16)),
          ),
          Divider(height: 1, thickness: 1.5, indent: 18),
          ListTile(
            leading: Text("Địa chỉ:", style: TextStyle(fontSize: 16)),
            trailing: Text("Việt Nam", style: TextStyle(fontSize: 16)),
          ),
          Divider(height: 1, thickness: 1.5, indent: 18),
          ListTile(
            leading: Text("Số điện thoại:", style: TextStyle(fontSize: 16)),
            trailing: Text(
                usermodelApp.isgiangvien == '1'
                    ? (giangvien.isNotEmpty ? giangvien[0].dienThoai : ' ')
                    : (sinhvien.isNotEmpty
                        ? sinhvien[0].dienThoai
                        : usermodelApp.id),
                style: TextStyle(fontSize: 16)),
          ),
          Divider(height: 1, thickness: 1.5, indent: 18),
          ListTile(
            leading: Text("Nơi sinh:", style: TextStyle(fontSize: 16)),
            trailing: Text("Việt Nam", style: TextStyle(fontSize: 16)),
          ),
          Divider(height: 1, thickness: 1.5, indent: 18),
          SizedBox(height: 10),
          SizedBox(
            width: 370,
            child: ElevatedButton(
              onPressed: () async {
                await UserPreferences.clearUserData();
                //man.MyAppState();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => man
                          .MyApp()), // Thay FirstScreen() bằng màn hình đầu tiên của ứng dụng
                  (route) => false,
                );
                checkLoginStatus();
                // Xử lý khi nút được nhấn
              },
              child: Text('Đăng xuất'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Điều chỉnh bo viền
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
