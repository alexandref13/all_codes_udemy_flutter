import 'package:flutter/material.dart';

class ContadorDePessoas extends StatefulWidget {
  @override
  _ContadorDePessoasState createState() => _ContadorDePessoasState();
}

class _ContadorDePessoasState extends State<ContadorDePessoas> {
  int people = 0;
  String text = 'Pode entrar';

  @override
  Widget build(BuildContext context) {
    void peopleGettingIn() {
      setState(() {
        people++;
      });
    }

    void peopleGettingOut() {
      setState(() {
        people--;
      });
    }

    void peopleMoreThanBounds() {
      setState(() {
        text = 'Cheio';
      });
    }

    void peopleLessThanBounds() {
      setState(() {
        text = 'Pessoas negativas??? this not is possible';
      });
    }

    void peopleInTheBounds() {
      setState(() {
        text = 'Pode entrar';
      });
    }

    if (people < 0) {
      peopleLessThanBounds();
    } else if (people <= 10) {
      peopleInTheBounds();
    } else {
      peopleMoreThanBounds();
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Contador de pessoas',
          ),
          centerTitle: true,
          backgroundColor: Color(0xff8257e5),
        ),
        body: Stack(
          children: <Widget>[
            // Image.asset(
            //   'assets/images/give-classes-background.png',
            //   fit: BoxFit.cover,
            //   height: 1000,
            // ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    'Pessoas: $people',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                      child: FlatButton(
                        child: Text(
                          '+1',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: peopleGettingIn,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                      child: FlatButton(
                        child: Text(
                          '-1',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: peopleGettingOut,
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Text(
                    '$text',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                        fontSize: 30),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
