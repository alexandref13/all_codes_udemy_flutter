import 'package:flutter/material.dart';

import 'package:all_udemy_projects_in_one/src/components/home_widget_bottomtab.dart';
import 'package:all_udemy_projects_in_one/src/components/perfil_widget_bottomtab.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  static List<Widget> bottomNavigationList = <Widget>[
    HomeBottomTab(),
    PerfilBottomTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/udemyLogo.png',
            height: 200,
            width: 200,
          ),
          centerTitle: true,
          actions: <Widget>[
            Padding(
              child: Icon(
                Icons.school,
                color: Colors.black45,
                size: 35,
              ),
              padding: EdgeInsets.all(10),
            )
          ],
          backgroundColor: Color(0xffcc6d62),
        ),
        backgroundColor: Color(0xffd4d4d4),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.people_outline), title: Text('Perfil')),
          ],
          currentIndex: selectedIndex,
          onTap: onItemTapped,
        ),
        body: bottomNavigationList.elementAt(selectedIndex));
  }
}
