import 'dart:ui';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Jo-Ken-Po')
        ),

        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 15),
                margin: EdgeInsets.only(bottom: 15),
                child: Text('Escolha do adversário:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  )
                ),
              ),

              SizedBox(
                width: 105,
                height: 105,
                child: FlatButton(
                  padding: EdgeInsets.all(16.0),
                  child: Image.asset('images/rock.png'),
                  shape: CircleBorder(
                    side: BorderSide(color: Colors.black54)
                  ),
                  onPressed: null,
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 15, bottom: 15),
                child: Text('Resultado aqui',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  )
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  
                  SizedBox(
                    width: 105,
                    height: 105,
                    child: FlatButton(
                      padding: EdgeInsets.all(16.0),
                      child: Image.asset('images/rock.png'),
                      shape: CircleBorder(
                        side: BorderSide(color: Colors.black54)
                      ),
                      onPressed: () {},
                    ),
                  ),

                  SizedBox(width: 10,),

                  SizedBox(
                    width: 105,
                    height: 105,
                    child: FlatButton(
                      padding: EdgeInsets.all(16.0),
                      child: Image.asset('images/paper.png'),
                      shape: CircleBorder(
                        side: BorderSide(color: Colors.black54)
                      ),
                      onPressed: () {},
                    ),
                  ),

                  SizedBox(width: 10,),

                  SizedBox(
                    width: 105,
                    height: 105,
                    child: FlatButton(
                      padding: EdgeInsets.all(16.0),
                      child: Image.asset('images/scissors.png'),
                      shape: CircleBorder(
                        side: BorderSide(color: Colors.black54)
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              )
            ]
          )
        )
      ),
    );
  }
}