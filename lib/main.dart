import 'package:flutter/material.dart';
import 'package:notification_nttu/Model/usermodel.dart';
import 'package:notification_nttu/Screen/tinhnang/all.dart';
import 'package:notification_nttu/Model/sinhVienModel.dart'; // Import model sinh viên
import 'package:notification_nttu/Model/giangVienModel.dart'; // Import model giảng viên
import 'package:notification_nttu/loginSVAPI.dart'; // Import service đăng nhập sinh viên
import 'package:notification_nttu/loginGiangVienAPI.dart';
import 'shared_preferences.dart';
import 'Screen/tinhnang/GiangVienPage.dart'; // Import service đăng nhập giảng viên

void main() {
  runApp(
    const MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  String username = '';
  String password = '';
  bool isGiangVien = false;
  UserModel usermodel = new UserModel();
  bool _isObscure = true;

  Future<bool> login(String username, String password, bool isgiangvien) async {
    try {
      bool isLoggedIn = false;
      if (isgiangvien) {
        List<GiangVienModel> response =
            await LoginGiangVienAPI().login(username, password);
        // Xử lý phản hồi từ API cho giảng viên tại đây
        if (response.isNotEmpty) {
          isLoggedIn = true;
          // Lưu thông tin người dùng vào SharedPreferences
          await UserPreferences.saveUserData_GV(response[0]);
        }
      } else {
        List<SinhVienModel> response =
            await LoginSVAPI().login(username, password);
        // Xử lý phản hồi từ API cho sinh viên tại đây
        if (response.isNotEmpty) {
          isLoggedIn = true;
          // Lưu thông tin người dùng vào SharedPreferences
          await UserPreferences.saveUserData_SV(response[0]);
        }
      }

      if (isLoggedIn) {
        navigateToHome();
      } else {
        // Hiển thị thông báo lỗi
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Thông báo'),
              content: Text('Sai mật khẩu hoặc tên đăng nhập.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }

      return isLoggedIn;
    } catch (e) {
      // Xử lý lỗi nếu có
      print('Đăng nhập không thành công: $e');
      return false;
    }
  }

  void navigateToHome() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
  }

  void navigateToGiangVienPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GiangVienPage()),
    );
  }

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    final UserModel um = await UserPreferences.getUserData();
    setState(() {
      usermodel = um;
      if (usermodel != null) {
        if (usermodel.status == '1') {
          navigateToHome();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgroundgoc.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/logo.png',
                  height: 120.0,
                ),
                SizedBox(height: 16.0),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      username = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Mã số sinh viên',
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 16.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    hintText: 'Mật khẩu',
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 16.0),
                    suffixIcon: IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                CheckboxListTile(
                  title: Text(
                    "Dành cho giảng viên",
                    style: TextStyle(color: Colors.white),
                  ),
                  value: isGiangVien,
                  onChanged: (newValue) {
                    setState(() {
                      isGiangVien = newValue ?? false;
                    });
                  },
                ),
                ElevatedButton(
                  onPressed: () async {
                    bool isLoggedIn = false;
                    if (isGiangVien) {
                      isLoggedIn = await login(username, password, true);
                    } else {
                      isLoggedIn = await login(username, password, false);
                    }
                    if (isLoggedIn) {
                      navigateToHome();
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Thông báo'),
                            content: Text('Đăng nhập không thành công.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 0, 106, 255)),
                    foregroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 255, 255, 255)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    elevation: MaterialStateProperty.all<double>(4.0),
                    minimumSize: MaterialStateProperty.all<Size>(
                        Size(double.infinity, 48.0)),
                  ),
                  child: Text('ĐĂNG NHẬP'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
