import 'package:flutter/material.dart';

class CalculadoraDeImc extends StatefulWidget {
  @override
  _CalculadoraDeImcState createState() => _CalculadoraDeImcState();
}

class _CalculadoraDeImcState extends State<CalculadoraDeImc> {
  String infoText = 'Informe seus dados';

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  void resetFields() {
    weightController.text = '';
    heightController.text = '';

    setState(() {
      infoText = 'Informe seus dados';
      formKey = GlobalKey<FormState>();
    });
  }

  void calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;

      double imc = weight / (height * height);

      if (imc < 18.6) {
        infoText = 'Abaixo do peso (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 18.6 && imc < 24.9) {
        infoText = 'Peso ideal (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 24.9 && imc < 29.9) {
        infoText = 'Levemente acima do peso (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 29.9 && imc < 34.9) {
        infoText = 'Obesidade grau I (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 34.9 && imc < 39.9) {
        infoText = 'Obesidade grau II (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 40) {
        infoText = 'Obesidade grau III (${imc.toStringAsPrecision(3)})';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calculadora de IMC'),
          centerTitle: true,
          backgroundColor: Color(0xff2d3673),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              padding: EdgeInsets.only(right: 15),
              onPressed: resetFields,
            )
          ],
        ),
        backgroundColor: Color(0xffd6d0d0),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.fromLTRB(30, 60, 30, 30),
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.person_outline,
                      size: 150,
                      color: Color(0xff2d3673),
                    ),
                    TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Insira seu peso';
                          }
                        },
                        keyboardType: TextInputType.number,
                        controller: weightController,
                        decoration: InputDecoration(
                            labelText: 'Peso (Kg)',
                            labelStyle: TextStyle(color: Color(0xff2d3673))),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          color: Color(0xff2d3673),
                        )),
                    TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Insira seu altura';
                          }
                        },
                        keyboardType: TextInputType.number,
                        controller: heightController,
                        decoration: InputDecoration(
                            labelText: 'Altura (cm)',
                            labelStyle: TextStyle(color: Color(0xff2d3673))),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          color: Color(0xff2d3673),
                        )),
                    Container(
                      height: 70,
                      width: 150,
                      padding: EdgeInsets.only(top: 10),
                      child: RaisedButton(
                          onPressed: () {
                            if (formKey.currentState.validate()) {
                              calculate();
                            }
                          },
                          child: Text('Calcular',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                          color: Color(0xff2d3673),
                          textColor: Colors.white,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10))),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        infoText,
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: Color(0xff2d3673), fontSize: 30),
                      ),
                    )
                  ],
                ),
              )),
        ));
  }
}
