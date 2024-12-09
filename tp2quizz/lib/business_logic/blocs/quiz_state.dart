import '../../data/models/question.dart';

abstract class QuizState {}

class QuizInitial extends QuizState {}

class QuizLoading extends QuizState {}

class QuizLoaded extends QuizState {
  final List<Question> questions;
  final int currentQuestionIndex;
  final int score;

  QuizLoaded({
    required this.questions,
    this.currentQuestionIndex = 0,
    this.score = 0,
  });
}

class QuizCompleted extends QuizState {
  final int score;
  final int totalQuestions;

  QuizCompleted({
    required this.score,
    required this.totalQuestions,
  });
}

class QuizError extends QuizState {
  final String message;
  QuizError({required this.message});
}