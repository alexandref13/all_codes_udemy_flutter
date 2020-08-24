import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:all_udemy_projects_in_one/src/components/text_fields_conversor_de_moedas.dart';

const api = 'https://api.hgbrasil.com/finance?key=c92da1dd';

Future<Map> getData() async {
  http.Response response = await http.get(api);
  return json.decode(response.body);
}

class ConversorDeMoedas extends StatefulWidget {
  @override
  _ConversorDeMoedasState createState() => _ConversorDeMoedasState();
}

class _ConversorDeMoedasState extends State<ConversorDeMoedas> {
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();

  double dolar;
  double euros;

  void realChanged(String text) {
    if (text.isEmpty) {
      handleRefreshButton();
      return;
    } else {
      double real = double.parse(text);

      dolarController.text = (real / dolar).toStringAsFixed(2);
      euroController.text = (real / euros).toStringAsFixed(2);
    }
  }

  void dolarChanged(String text) {
    if (text.isEmpty) {
      handleRefreshButton();
      return;
    } else {
      double newDolar = double.parse(text);

      realController.text = (newDolar * this.dolar).toStringAsFixed(2);
      euroController.text =
          ((newDolar * this.dolar) / euros).toStringAsFixed(2);
    }
  }

  void euroChanged(String text) {
    if (text.isEmpty) {
      handleRefreshButton();
      return;
    } else {
      double euro = double.parse(text);

      realController.text = (euro * this.euros).toStringAsFixed(2);
      dolarController.text = (euro * this.euros / dolar).toStringAsFixed(2);
    }
  }

  void handleRefreshButton() {
    realController.text = '';
    dolarController.text = '';
    euroController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff171f40),
        appBar: AppBar(
          title: Text('Conversor de moedas'),
          backgroundColor: Color(0xffa67f00),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              padding: EdgeInsets.only(right: 20),
              onPressed: handleRefreshButton,
              icon: Icon(Icons.refresh),
            )
          ],
        ),
        body: FutureBuilder<Map>(
          future: getData(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                  child: Text(
                    'Carregando dados...',
                    style: TextStyle(fontSize: 25, color: Color(0xffa67f00)),
                    textAlign: TextAlign.center,
                  ),
                );
              default:
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'Erro ao carregar dados',
                      style: TextStyle(fontSize: 25, color: Color(0xffa67f00)),
                      textAlign: TextAlign.center,
                    ),
                  );
                } else {
                  dolar = snapshot.data['results']['currencies']['USD']['buy'];
                  euros = snapshot.data['results']['currencies']['EUR']['buy'];

                  return Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Icon(
                            Icons.monetization_on,
                            color: Color(0xffa67f00),
                            size: 125,
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: textFields(
                                'Reais', 'R\$', realController, realChanged)),
                        Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: textFields('Dolares', 'US\$',
                                dolarController, dolarChanged)),
                        Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: textFields(
                                'Euros', '\€', euroController, euroChanged)),
                      ],
                    ),
                  );
                }
            }
          },
        ));
  }
}
