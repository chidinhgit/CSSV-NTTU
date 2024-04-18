import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:notification_nttu/Model/kehoach.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trắc nghiệm nghề nghiệp',
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: keHoach(),
    );
  }
}

class keHoach extends StatefulWidget {
  const keHoach({Key? key}) : super(key: key);

  @override
  _keHoachState createState() => _keHoachState();
}

class _keHoachState extends State<keHoach> {
  var _titleController;
  var _contextController;
  var _startDateController;
  var _endDateController;
  late List<Kehoach> _plans;
  late List<bool> _donePlans;

  void data() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Kehoach plan = Kehoach.fromString(
        _titleController.text,
        _contextController.text,
        _startDateController.text,
        _endDateController.text);

    String? tasks = prefs.getString('key');
    List list = (tasks == null) ? [] : json.decode(tasks);
    print(list);
    list.add(json.encode(plan.getMap()));
    print(list);
    prefs.setString('key', json.encode(list));

    _titleController.text = '';
    _contextController.text = '';
    _startDateController.text = '';
    _endDateController.text = '';
    Navigator.of(context).pop();
    _getPlans();
  } //Dữ liệu nhập

  void _getPlans() async {
    _plans = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tasks = prefs.getString('key');
    List list = (tasks == null) ? [] : json.decode(tasks);
    for (dynamic d in list) {
      _plans.add(Kehoach.fromMap(json.decode(d)));
    }

    print(_plans);
    _donePlans = List.generate(_plans.length, (index) => false);
    setState(() {});
  } //Lấy danh sách kế hoạch

  void updatePendingTasksList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Kehoach> pendingList = [];
    for (var i = 0; i < _plans.length; i++)
      if (!_donePlans[i]) pendingList.add(_plans[i]);

    var pendingListEncoded = List.generate(
        pendingList.length, (i) => json.encode(pendingList[i].getMap()));

    prefs.setString('key', json.encode(pendingListEncoded));

    _getPlans();
  } //Kế hoạch hoàn thành

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _contextController = TextEditingController();
    _startDateController = TextEditingController();
    _endDateController = TextEditingController();
    _getPlans();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contextController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Kế hoạch cá nhân',
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.white,
              ),
              onPressed: updatePendingTasksList,
            ), /*Nút hoàn thành kế hoạch, chỉ cần check box một kế hoạch nào đó
            và nhấn nút lưu ở trên cùng bên phải, 
            kế hoạch được check box sẽ biến mất*/

            /*
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.white,
              ),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString('key', json.encode([]));

                _getPlans();
              },
            ), //Nút xóa hết kế hoạch */
          ],
        ),
        body: (_plans.isEmpty)
            ? Center(
                child: Text(
                  'Bạn chưa lên kế hoạch.',
                  style: TextStyle(fontSize: 18),
                ),
              )
            : SingleChildScrollView(
                //Vùng chứa danh sách kế hoạch
                child: Column(
                  children: _plans
                      .map((e) => Container(
                          padding: EdgeInsets.all(10),
                          width: double.infinity,
                          child: Column(
                            children: [
                              Container(
                                  padding: EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 236, 236, 236),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Align(
                                            //Tiêu đề
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              e.title,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                          ),
                                          Checkbox(
                                              activeColor: Colors.blue,
                                              value:
                                                  _donePlans[_plans.indexOf(e)],
                                              key: GlobalKey(),
                                              onChanged: (val) {
                                                setState(() {
                                                  _donePlans[
                                                      _plans.indexOf(e)] = val!;
                                                });
                                              }),
                                        ],
                                      ),
                                      Divider(
                                        indent: 10,
                                        endIndent: 15,
                                        color: Colors.black,
                                        thickness: 1.2,
                                      ),
                                      Align(
                                        //Nội dung
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          e.context,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16),
                                        ),
                                      ),
                                      Divider(
                                        indent: 10,
                                        endIndent: 15,
                                        color: Colors.black,
                                        thickness: 1.2,
                                      ),
                                      Align(
                                        //Ngày bắt đầu
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Ngày bắt đầu: " + e.startTime,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14),
                                        ),
                                      ),
                                      Align(
                                        //Ngày kết thúc
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Ngày kết thúc: " + e.endTime,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14),
                                        ),
                                      ),
                                      SizedBox(height: 10)
                                    ],
                                  ))
                            ],
                          )))
                      .toList(),
                ),
              ),
        floatingActionButton: FloatingActionButton(
          //Nút thêm kế hoạch
          onPressed: () => showModalBottomSheet(
              context: context,
              builder: (BuildContext context) => Container(
                  padding: EdgeInsets.all(8),
                  width: double.infinity,
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 2),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Thêm kế hoạch',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Divider(indent: 5, endIndent: 5, thickness: 1),
                        Container(
                          child: TextField(
                            controller: _titleController,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue)),
                                suffixIcon: IconButton(
                                  onPressed: _titleController.clear,
                                  icon: Icon(Icons.clear),
                                ),
                                hintText: "Nhập tiêu đề",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                )),
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          child: TextField(
                            controller: _contextController,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue)),
                                suffixIcon: IconButton(
                                  onPressed: _contextController.clear,
                                  icon: Icon(Icons.clear),
                                ),
                                hintText: "Nhập nội dung",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                )),
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          child: TextField(
                            onTap: () {
                              _selectDate1();
                            },
                            readOnly: true,
                            controller: _startDateController,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue)),
                                prefixIcon: Icon(Icons.calendar_today),
                                hintText: "Ngày bắt đầu",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                )),
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          child: TextField(
                            onTap: () {
                              _selectDate2();
                            },
                            readOnly: true,
                            controller: _endDateController,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue)),
                                prefixIcon: Icon(Icons.calendar_today),
                                hintText: "Ngày kết thúc",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                )),
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          child: ElevatedButton(
                              child: Text('Thêm'),
                              onPressed: () {
                                if (_titleController.text == '' ||
                                    _contextController.text == '' ||
                                    _startDateController.text == '' ||
                                    _endDateController.text == '') {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Thông báo'),
                                        content: Text('Không được nhập thiếu.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(
                                                  context); // Close the dialog
                                            },
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else {
                                  data();
                                }
                              }),
                        )
                      ],
                    ),
                  ))),
          child: Icon(Icons.add, color: Colors.white),
          backgroundColor: Colors.blue,
        ));
  }

  Future<void> _selectDate1() async {
    //Bảng chọn ngày cho ngày bắt đầu
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2024),
        lastDate: DateTime(2100));
    if (_picked != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(_picked);
      _startDateController.text = formattedDate.toString().split(" ")[0];
    }
  }

  Future<void> _selectDate2() async {
    //Bảng chọn ngày cho ngày kết thúc
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2024),
        lastDate: DateTime(2100));
    if (_picked != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(_picked);
      _endDateController.text = formattedDate.toString().split(" ")[0];
    }
  }
}
