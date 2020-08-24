import 'package:flutter/material.dart';

class Tarefas extends StatefulWidget {
  @override
  _TarefasState createState() => _TarefasState();
}

class _TarefasState extends State<Tarefas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de tarefas'),
        centerTitle: true,
        backgroundColor: Color(0xff171f40),
      ),
      body: Container(),
    );
  }
}
