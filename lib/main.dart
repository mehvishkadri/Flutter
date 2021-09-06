import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget
{
  @override
  State<StatefulWidget> createState(){
  return _MyAppState();
  }
}

  //@override
  //Widget build(BuildContext context) {
  class _MyAppState extends State<MyApp> {
    var _questions = const [
      {'questionText':'What is your favourite color? ', 'answers':[
      {'text': 'Black','score':10}, 
      {'text':'Red','score':5} ,
      {'text': 'Green', 'score': 3},
      {'text':'White', 'score':1}],
      },
      {
        'questionText': 'What is your favourite animal?',
        'answers': [
      {'text': 'Lion','score':10}, 
      {'text':'Fox','score':5} ,
      {'text': 'Dog', 'score': 3},
      {'text':'Snake', 'score':1}
         ], 
      },
      {
        'questionText': 'What is your favourite country',
        'answers': [
      {'text': 'India','score':10}, 
      {'text':'Canada','score':5} ,
      {'text': 'Africa', 'score': 3},
      {'text':'Nepal', 'score':1}],
      }
      
    ];

    var _questionIndex = 0;
    var _totalScore = 0;

    void _resetQuiz(){
      setState(() {
       var _questionIndex = 0;
       var _totalScore = 0;
        }
      );
     }
     void _answerQuestion(int score) {
       _totalScore = _totalScore + score;

       setState(() {
       _questionIndex= _questionIndex +1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length){
      print ('We have more questions!');
    } else {
      print('No more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: Text ('My first App'),
      ),
      body: _questionIndex < _questions.length 
      ? Quiz(answerQuestion: _answerQuestion, questionIndex: _questionIndex, questions: _questions) 
      : Result(_totalScore, _resetQuiz)
      ),
    );
  }
  }
    



