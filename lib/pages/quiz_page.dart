import 'package:flutter/material.dart';
import 'package:quizapp/UI/answer_button.dart';
import 'package:quizapp/UI/question_text.dart';
import 'package:quizapp/UI/correct_wrong_overlay.dart';
import 'package:quizapp/utils/questions.dart';
import 'package:quizapp/utils/quiz.dart';
import './score_page.dart';

class QuizPage extends StatefulWidget{ //Mutable/Dynamic Widget 
@override
State createState() => new QuizPageState();

}

class QuizPageState extends State <QuizPage>{

Question currentQuestion;
Quiz quiz = new Quiz([
  new Question("Flatter uses Dart Languages",true),
  new Question("Is Flatter made by Facebook", false),
  new Question("Is Dart impossible to learn ", false),
  new Question("Do Every progammer need to learn Dart or Flutter", false),
  new Question("Can you make Apple Apps with flutter",true)
  ]);

String questionText;
int questionNumber;
bool isCorrect; //hold the current user answer
bool overlayVisible = false;
@override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }
 
 // to handle the answer
 void handleAnswer(bool answer){
 isCorrect = (currentQuestion.answer == answer); //If User answer is equal to the current answer
 quiz.answer(isCorrect); //just add the score by one if answer is correct
 this.setState((){
   overlayVisible = true;
 });
 } 

@override
Widget build(BuildContext context){
  return new Stack( //we put widget in this stack
  fit: StackFit.expand,
   children: <Widget>[
     new Column( //Container for our questions
      children: <Widget>[
      //() it shows empty function
        new AnswerButton(true,() => handleAnswer(true)), 
        new QuestionText(questionText,questionNumber),
        new AnswerButton(false,() => handleAnswer(false)),
      ],
     ),
    overlayVisible == true ? new CorrectWrongOverlay(
      isCorrect,
      
      (){
        if(quiz.length == questionNumber){
          //
          Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) =>new ScorePage(quiz.score, quiz.length)),(Route route)=>route == null);
          return;
        }
        currentQuestion = quiz.nextQuestion;//to update current question
        this.setState((){
        overlayVisible = false;
        questionText = currentQuestion.question;
        questionNumber = quiz.questionNumber;
        });
      }
    ) : new Container() // To hide the Overlay On screen
   ]
  );
}
}