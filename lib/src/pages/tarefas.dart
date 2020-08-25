import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Tarefas extends StatefulWidget {
  @override
  _TarefasState createState() => _TarefasState();
}

class _TarefasState extends State<Tarefas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff171f40),
        title:
            Text('Lista de tarefas', style: GoogleFonts.poppins(fontSize: 20)),
        centerTitle: true,
      ),
    );
  }
}
