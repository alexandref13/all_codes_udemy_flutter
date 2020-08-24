import 'package:flutter/material.dart';

import 'package:all_udemy_projects_in_one/src/pages/home_page.dart';

void main(){
  runApp(MaterialApp(
    routes: {
      '/': (context) => HomePage(),
    },
  ));
}