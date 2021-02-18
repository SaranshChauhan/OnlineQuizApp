import 'package:quizapp/utils/questions.dart';

class Quiz{

  List<Question> _questions; //To make Var Private we use the under Score(_) in front of Vars
  int _currentQuestionIndex = -1;
 int _score = 0;

 Quiz(this._questions){
   _questions.shuffle();
 }

//getter method
List<Question> get questions =>_questions;
int get score => _score; //Green colored "TEXT is GET function name"
int get length => _questions.length;
int get questionNumber => _currentQuestionIndex+1;

Question get nextQuestion{
_currentQuestionIndex++;
if(_currentQuestionIndex >= length) return  null;
return _questions[_currentQuestionIndex];
}
void answer(bool isCorrect){
  if(isCorrect) _score++;
}
}

