import 'package:champ_app/util/hex_color.dart';
import 'package:champ_app/widget/placeholder.dart';
import 'package:champ_app/widget/search.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Search(),
    PlaceholderWidget(Colors.amber),
    PlaceholderWidget(Colors.blue),
    PlaceholderWidget(Colors.red),
    PlaceholderWidget(Colors.lightBlue),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        onTap: onTabTapped,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          buildBottomNavigationBarItem("Search",0, Icons.search),
          buildBottomNavigationBarItem("Activity",1,Icons.landscape),
          buildBottomNavigationBarItem("Profile",2, Icons.person),
          buildBottomNavigationBarItem("Challenges",3, Icons.flare),
          buildBottomNavigationBarItem("Meer",4, Icons.more_horiz),
        ],
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(String title, int index, IconData icon) =>  BottomNavigationBarItem(
          backgroundColor: HexColor("ffffff"),
          title: Text(
            title,
            style: TextStyle(fontSize: 15,  color: _currentIndex == index ? HexColor("4142d2")  : HexColor("353535")),
          ),
          icon: Icon(icon, size: 30, color: HexColor("353535")),
          activeIcon: Icon(
            icon,
            size: 35,
            color: HexColor("4142d2"),
          ),
        );

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}