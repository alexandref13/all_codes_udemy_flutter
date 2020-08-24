import 'package:flutter/material.dart';

class PerfilBottomTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 1, color: Colors.black))),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image(
                    image: NetworkImage('http://github.com/alexandref13.png'),
                    height: 100,
                    width: 100,
                  ),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'Alexandre Fernandes',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ),
                    Container(
                      width: 200,
                      child: Text(
                        '21 anos, tentando se aperfeiçoar no desenvolvimento em flutter',
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        )
      ],
    );
  }
}
