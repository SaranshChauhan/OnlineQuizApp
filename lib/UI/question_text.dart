import 'package:flutter/material.dart';

class QuestionText extends StatefulWidget{
  final String _question;
  final int _questionNumber;
QuestionText(this._question,this._questionNumber);
State createState() => new QuestionTextState();
}

class QuestionTextState extends State<QuestionText> with SingleTickerProviderStateMixin{ //with single ticker provider we can  contol one animation

Animation<double> _fontSizeAnimation;
AnimationController _fontSizeAnimationController; //control our font

@override
void initState(){
  super.initState();
  _fontSizeAnimationController = new AnimationController(duration: new Duration(milliseconds: 500),vsync: this); //vsync handles animation that goes outside the screen
  _fontSizeAnimation = new CurvedAnimation(parent: _fontSizeAnimationController, curve: Curves.bounceOut);
  _fontSizeAnimation.addListener(() => this.setState((){})); 
  _fontSizeAnimationController.forward();
  
}

@override
  void dispose() {
    // free the animationcontroller to the device
    _fontSizeAnimationController.dispose();
    super.dispose();
  }

  //To update the Animation Every time
@override
  void didUpdateWidget(QuestionText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(oldWidget._question != widget._question){
      _fontSizeAnimationController.reset();
      _fontSizeAnimationController.forward();
    }
  }

@override
  Widget build(BuildContext context) {
    return new Material(
          color: Colors.white,
          child: new Padding(
            padding: new EdgeInsets.symmetric(vertical:20.0),
            child: new Center(
            child: new Text("Statement: " + widget._questionNumber.toString()+": " + widget._question,
            style: new TextStyle(fontSize: _fontSizeAnimation.value*15), //we've multiple with 15 bcz the font size i.e is tiny

            ),
            ),
          ),
        );
  }
}