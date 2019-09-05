import 'dart:math';

import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String _variable;
  List<String> board = ['', '', '', '', '', '', '', '', ''];
  int stepsLeft = 9;
  bool turn = true;
  bool endGame = false;
  String endScreenText = 'Game Drawed';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: endGame == false
              ? Container(
                  child: (_variable == '' || _variable == null)
                      ? select()
                      : gameBoard(),
                )
              : Container(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      endScreenText,
                      style:
                          TextStyle(color: Theme.of(context).primaryColorDark),
                    ),
                    RaisedButton(
                      child: Text(
                        'Exit',
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ))),
    );
  }

  Widget select() {
    return Center(
      child: ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text('X'),
            onPressed: () {
              setState(() {
                _variable = 'X';
              });
            },
          ),
          RaisedButton(
            child: Text('O'),
            onPressed: () {
              setState(() {
                _variable = 'O';
              });
            },
          )
        ],
      ),
    );
  }

  Widget gameBoard() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            inputBox(index: 0, inBottom: true, inRight: true),
            inputBox(index: 1, inBottom: true, inRight: true),
            inputBox(index: 2, inBottom: true, inRight: false),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            inputBox(index: 3, inBottom: true, inRight: true),
            inputBox(index: 4, inBottom: true, inRight: true),
            inputBox(index: 5, inBottom: true, inRight: false),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            inputBox(index: 6, inRight: true),
            inputBox(index: 7, inRight: true),
            inputBox(index: 8, inRight: false),
          ],
        ),
      ],
    );
  }

  void logic() {
    Future.delayed(Duration(seconds: 3));
    if (board[0] == board[1] && board[1] == board[2] && board[0] != '') {
      endGame = true;
      if(board[0] == _variable){
        endScreenText = 'Player Won';
      }else{
        endScreenText = 'computer won';
      }
    }
    if (board[3] == board[4] && board[4] == board[5] && board[3] != '') {
      endGame = true;
      if(board[3] == _variable){
        endScreenText = 'Player Won';
      }else{
        endScreenText = 'computer won';
      }
    }
    if (board[6] == board[7] && board[7] == board[8] && board[6] != '') {
      endGame = true;
      if(board[6] == _variable){
        endScreenText = 'Player Won';
      }else{
        endScreenText = 'computer won';
      }
    }
    if (board[0] == board[3] && board[3] == board[6] && board[0] != '') {
      endGame = true;
      if(board[0] == _variable){
        endScreenText = 'Player Won';
      }else{
        endScreenText = 'computer won';
      }
    }
    if (board[1] == board[4] && board[4] == board[7] && board[1] != '') {
      endGame = true;
      if(board[1] == _variable){
        endScreenText = 'Player Won';
      }else{
        endScreenText = 'computer won';
      }
    }
    if (board[2] == board[5] && board[5] == board[8] && board[2] != '') {
      endGame = true;
      if(board[2] == _variable){
        endScreenText = 'Player Won';
      }else{
        endScreenText = 'computer won';
      }
    }
    if (board[0] == board[4] && board[4] == board[8] && board[0] != '') {
      endGame = true;
      if(board[0] == _variable){
        endScreenText = 'Player Won';
      }else{
        endScreenText = 'computer won';
      }
    }
    if (board[2] == board[4] && board[4] == board[6] && board[2] != '') {
      endGame = true;
      if(board[2] == _variable){
        endScreenText = 'Player Won';
      }else{
        endScreenText = 'computer won';
      }
    }
  }

  Widget inputBox(
      {@required int index,
      bool inLeft = false,
      bool inRight = false,
      bool inTop = false,
      bool inBottom = false}) {
    return InkWell(
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          border: Border(
            bottom: inBottom ? BorderSide() : BorderSide.none,
            top: inTop ? BorderSide() : BorderSide.none,
            right: inRight ? BorderSide() : BorderSide.none,
            left: inLeft ? BorderSide() : BorderSide.none,
          ),
        ),
        child: Center(
            child: Text(
          board[index],
          style: TextStyle(
            color: board[index] == _variable
                ? Theme.of(context).accentColor
                : Colors.amberAccent,
            fontSize: 30,
          ),
        )),
      ),
      onTap: () {
        if (board[index] == '' && turn == true) {
          setState(() {
            stepsLeft--;
            turn = false;
            if (stepsLeft == 0) {
              endGame = true;
            }
            board[index] = _variable;
            if (stepsLeft <= 5) {
              logic();
            }
            if (stepsLeft > 1) {
              computer();
            }
          });
        }
      },
    );
  }

  void computer() {
    int rndIndex;
    stepsLeft--;
    while (true) {
      rndIndex = 0 + Random().nextInt(8);
      if (board[rndIndex] == '') {
        setState(() {
          board[rndIndex] = _variable == 'X' ? 'O' : 'X';
          logic();
          turn = true;
        });
        break;
      }
    }
  }
}
