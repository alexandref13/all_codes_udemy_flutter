import 'dart:io';

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
                color: Colors.black,
                size: 35,
              ),
              padding: EdgeInsets.all(10),
            )
          ],
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          backgroundColor: Color(0xffd4d4d4),
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
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image(
                        image:
                            NetworkImage('http://github.com/alexandref13.png'),
                        height: 100,
                        width: 100,
                      ),
                    ),
                    Container(
                        width: 170,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                'Alexandre Fernandes',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Text(
                                    'Github: ',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    'alexandref13',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            )
                          ],
                        ))
                  ],
                ),
                decoration: BoxDecoration(
                    color: Color(0xffd4d4d4),
                    border: Border(
                        bottom: BorderSide(width: 1, color: Colors.black))),
              ),
              Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 15, top: 20),
                    child: ListTile(
                      title: Text(
                        'Contador de pessoas',
                        style: TextStyle(fontSize: 18),
                      ),
                      leading: Icon(
                        Icons.person,
                        color: Colors.black,
                        size: 28,
                      ),
                      onTap: (){
                        Navigator.pushNamed(context, '/people');
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 15),
                    child: ListTile(
                      title: Text(
                        'Calculadora de IMC',
                        style: TextStyle(fontSize: 18),
                      ),
                      leading: Icon(
                        Icons.line_weight,
                        color: Colors.black,
                        size: 28,
                      ),
                      onTap: (){
                        Navigator.pushNamed(context, '/imc');
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 15),
                    child: ListTile(
                      title: Text(
                        'Conversor de Moedas',
                        style: TextStyle(fontSize: 18),
                      ),
                      leading: Icon(
                        Icons.monetization_on,
                        color: Colors.black,
                        size: 28,
                      ),
                      onTap: (){
                        Navigator.pushNamed(context, '/moedas');
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        body: bottomNavigationList.elementAt(selectedIndex));
  }
}
