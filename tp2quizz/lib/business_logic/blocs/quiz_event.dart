import '../../data/models/question.dart';

abstract class QuizEvent {}

class LoadQuestions extends QuizEvent {}

class StartQuiz extends QuizEvent {
  final List<Question> questions;
  StartQuiz({required this.questions});
}

class SubmitAnswer extends QuizEvent {
  final bool isCorrect;
  SubmitAnswer({required this.isCorrect});
}

class RestartQuiz extends QuizEvent {}