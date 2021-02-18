import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final bool _answer;
  final VoidCallback
      _onTap; //its a typedef & signature(return type) for a function
  AnswerButton(this._answer, this._onTap); //constructor

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      //Will work as true button
      child: new Material(
        color: _answer == true
            ? Colors.greenAccent
            : Colors.redAccent, //short hand for if/Else Satement
        child: new InkWell(
          onTap: () => _onTap(),
          child: new Center(
            child: new Container(
              decoration: new BoxDecoration(
                  border: new Border.all(color: Colors.white, width: 5.0)),
              padding: new EdgeInsets.all(20.0),
              child: new Text(
                _answer == true ? "True" : "false",
                style: new TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
