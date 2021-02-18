import 'package:flutter/material.dart';
import './landing_page.dart';

class ScorePage extends StatelessWidget{  // static page so no need to create the State

final int score;
final int _totalQuestion;
ScorePage(this.score,this._totalQuestion);
@override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.blueAccent,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("Your Score Buddy :",style: new TextStyle(color: Colors.white,fontSize:50.0,fontWeight: FontWeight.bold),),
          new Text(score.toString()+"/"+_totalQuestion.toString(),style: new TextStyle(color: Colors.white,fontSize:50.0,fontWeight: FontWeight.bold),),
          new IconButton(
            icon: new Icon(Icons.arrow_right),
            color: Colors.white,
            iconSize: 50.0,
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context)=>new LandingPage()), (Route route)=>route==null),
          )
        ]
      ),
    );
  }
}