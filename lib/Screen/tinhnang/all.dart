import 'package:flutter/material.dart';
import 'package:notification_nttu/Screen/tinhnang/chatbot.dart';
import 'package:notification_nttu/Screen/tinhnang/home.dart';
import 'package:notification_nttu/Screen/tinhnang/donXinPhep.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  final int selectedIndex;

  Home({this.selectedIndex = 0});

  @override
  _HomeContainerState createState() => _HomeContainerState();
}

class _HomeContainerState extends State<Home> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  static List<Widget> _widgetOptions = <Widget>[
    MyHomePage(),
    DonXinPhep(),
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
            label: "Xin phép",
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
