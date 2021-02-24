import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _escolhaOponente = AssetImage('images/padrao.png');

  var _resultado = 'Escolha uma opção abaixo';

  void _opcaoSelecionada(String escolhaUsuario){

    var opcoes = ['pedra', 'papel', 'tesoura'];
    var numero = new Random().nextInt(opcoes.length);
    var escolhaOponente = opcoes[numero];

    switch (escolhaOponente) {
      case 'pedra': setState(() {
              this._escolhaOponente = AssetImage('images/pedra.png');
            });
        break;

      case 'papel': setState(() {
              this._escolhaOponente = AssetImage('images/papel.png');
            });
        break;

      case 'tesoura': setState(() {
              this._escolhaOponente = AssetImage('images/tesoura.png');
            });
        break;
    }

    if(
      escolhaUsuario == 'pedra' && escolhaOponente == 'tesoura' ||
      escolhaUsuario == 'papel' && escolhaOponente == 'pedra' ||
      escolhaUsuario == 'tesoura' && escolhaOponente == 'papel'
    ){ 
      setState(() {
        this._resultado = 'Você venceu!';
            });
    } else if (
      escolhaOponente == 'pedra' && escolhaUsuario == 'tesoura' ||
      escolhaOponente == 'papel' && escolhaUsuario == 'pedra' ||
      escolhaOponente == 'tesoura' && escolhaUsuario == 'papel'
    ){
      setState(() {
        this._resultado = 'Você perdeu...';
            });
    } else {
      setState(() {
        this._resultado = 'Empate...';
            });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Jo Ken Po'),
      ),
      
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text('Escolha do adversário:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Image(image: this._escolhaOponente,),

          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(this._resultado, //Texto de resultado
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada('pedra'),
                child: Image.asset('images/pedra.png', height: 110),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada('papel'),
                child: Image.asset('images/papel.png', height: 110),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada('tesoura'),
                child: Image.asset('images/tesoura.png', height: 110),
              ),
            ],
          )
        ],
      ),
    );
  }
}