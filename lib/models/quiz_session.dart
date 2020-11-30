import 'package:flutter/foundation.dart';
import 'package:quiz/models/question.dart';

class QuizSession with ChangeNotifier {
  var _questions = [
    Question("2 + 2", ["1", "2", "4"], "4", "come on"),
    Question("Meaning of life?", ["God", "42", "Me"], "42", "H2G2"),
    Question("May the Force be with you", ["Star Wars", "Forest Gump", "American Pie"], "Star Wars", "Skywalker"),
  ];

  var _currentQuestionIndex = 0;

  var score = 0;

  var _questionsDone = 0;

  Question get currentQuestion => _questions[_currentQuestionIndex];

  void nextQuestion() {
    _currentQuestionIndex = (_currentQuestionIndex + 1) % _questions.length;
    _questionsDone++;
    notifyListeners();
  }

  bool checkAnswer(String answer) {
    var checkedAnswer = _questions[_currentQuestionIndex].isCorrectAnswer(answer);
    _questions[_currentQuestionIndex].isCorrectAnswer(answer) ? score += 1 : score = score;
    print(score);
    return checkedAnswer;
  }

  void getQuestionHint() {
    print(currentQuestion.hint);
  }

  bool allQuestionsCompleted() {
    return _questionsDone == _questions.length;
  }

  void resetGame() {
    _questionsDone = 0;
    _currentQuestionIndex = 0;
    score = 0;
    // nextQuestion(); with _currentQuestionIndex = -1; doesn't work
    notifyListeners();
  }

}
