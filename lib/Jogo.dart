import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _escolhaOponente = AssetImage('images/default.png');

  var _resultado = 'Escolha uma das opções abaixo';

  void opcaoSelecionada(String escolhaUsuario){

    var opcoes = ['pedra', 'papel', 'tesoura'];

    var numeroOpcao = new Random().nextInt(opcoes.length);

    var escolhaOponente = opcoes[numeroOpcao];

    switch (escolhaOponente) {
      case 'pedra':
        setState(() {
          _escolhaOponente = AssetImage('images/rock.png');
                });
        break;
        case 'papel':
        setState(() {
          _escolhaOponente = AssetImage('images/paper.png');
                });
        break;
        case 'tesoura':
        setState(() {
          _escolhaOponente = AssetImage('images/scissors.png');
                });
        break;
    }

    if( 
      escolhaUsuario == 'pedra' &&  escolhaOponente == 'tesoura' ||
      escolhaUsuario == 'papel' &&  escolhaOponente == 'pedra' ||
      escolhaUsuario == 'tesoura' &&  escolhaOponente == 'papel'
    ) {
      this._resultado = 'Você venceu!';
    } else if(
      escolhaOponente == 'pedra' &&  escolhaUsuario == 'tesoura' ||
      escolhaOponente == 'papel' &&  escolhaUsuario == 'pedra' ||
      escolhaOponente == 'tesoura' &&  escolhaUsuario == 'papel'
    ) {
      this._resultado = 'Você perdeu...' ;
    }
      else {
      this._resultado = 'Empatou!';
      }

  }

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
                  child: Image(image: this._escolhaOponente,),
                  shape: CircleBorder(
                    side: BorderSide(color: Colors.black54)
                  ),
                  onPressed: null,
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 15, bottom: 15),
                child: Text(_resultado,
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
                      onPressed: () => opcaoSelecionada('pedra'),
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
                      onPressed:  () => opcaoSelecionada('papel'),
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
                      onPressed:  () => opcaoSelecionada('tesoura'),
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