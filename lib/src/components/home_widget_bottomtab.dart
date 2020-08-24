import 'package:flutter/material.dart';

class HomeBottomTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Center(
          child: Text(
            'Exemplo para estudo do uso do flutter, um programa com todos os programas feitos no curso da Udemy',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
