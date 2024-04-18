import 'package:flutter/material.dart';
import 'package:notification_nttu/Screen/tinhnang/chatbot.dart';
import 'package:notification_nttu/Screen/tinhnang/GiangVienPage.dart';
import 'package:notification_nttu/Screen/tinhnang/xemDonXinPhep.dart';


void main() {
  runApp(MaterialApp(
    home: giangVienBotttom(),
  ));
}

class giangVienBotttom extends StatefulWidget {
  final int selectedIndex;

  giangVienBotttom({this.selectedIndex = 0});

  @override
  _giangVienBotttomState createState() => _giangVienBotttomState();
}

class _giangVienBotttomState extends State<giangVienBotttom> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  static List<Widget> _widgetOptions = <Widget>[
    GiangVienPage(),
    xemDonXinPhep(),
    ChatBot(
      currentLanguage: '',
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black,
        iconSize: 20,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Xem đơn xin phép",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Chat Bot",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
