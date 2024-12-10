import 'package:flutter/material.dart';
import '../models/question.dart';
import '../repositories/question_repository.dart';

class QuizProvider extends ChangeNotifier {
  int _questionIndex = 0;
  int _score = 0;
  final QuestionRepository _repository = QuestionRepository();
  List<Question> _questions = [];

  QuizProvider() {
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    _questions = await _repository.fetchQuestions();
    notifyListeners();
  }

  int get totalQuestions => _questions.length;
  int get score => _score;
  bool get isLastQuestion => _questionIndex >= _questions.length - 1;
  Question get currentQuestion => _questions[_questionIndex];

  String getCurrentImage() {
    return currentQuestion.imagePath.isNotEmpty ? currentQuestion.imagePath : "";
  }

  void checkAnswer(bool userChoice) {
    if (userChoice == currentQuestion.isCorrect) {
      _score++;
    }
    if (!isLastQuestion) {
      _questionIndex++;
      notifyListeners();
    }
  }

  void resetQuiz() {
    _questionIndex = 0;
    _score = 0;
    notifyListeners();
  }
}
