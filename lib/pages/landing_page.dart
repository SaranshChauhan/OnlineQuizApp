import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './quiz_page.dart';

class LandingPage extends StatelessWidget{ //Static type of Widget
@override
Widget build(BuildContext context) {
  return new Material(
    color: Colors.redAccent, //All Are Properties of Material Widget such as child,Column,InkWell Etc
    child: new InkWell( //kind of button fancy touch on the screen 
    onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new QuizPage())),//navigation through the OnTap Function
    child: new Column( //Can have many Widgets
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      new Text("Lets Quiz",style: new TextStyle(color: Colors.white, fontSize:50.0, fontWeight: FontWeight.bold),),
      new Text("Tap to Start!",style: new TextStyle(color: Colors.white, fontSize:50.0, fontWeight: FontWeight.bold),)
    ],
    ),
    )
  );
}
}