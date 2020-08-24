import 'package:all_udemy_projects_in_one/src/pages/conversor_de_moedas.dart';
import 'package:flutter/material.dart';

import 'package:all_udemy_projects_in_one/src/pages/home_page.dart';
import 'package:all_udemy_projects_in_one/src/pages/contador_de_pessoas.dart';
import 'package:all_udemy_projects_in_one/src/pages/calculadora_de_imc.dart';

void main(){
  runApp(MaterialApp(
    routes: {
      '/': (context) => HomePage(),
      '/people': (context) => ContadorDePessoas(),
      '/imc': (context) => CalculadoraDeImc(),
      '/moedas': (context) => ConversorDeMoedas(),
    },
  ));
}