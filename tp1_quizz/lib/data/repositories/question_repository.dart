import 'dart:async';
import '../models/question.dart';

class QuestionRepository {
  Future<List<Question>> fetchQuestions() async {
    return [
      Question(
        questionText: "La France a dû céder l'Alsace et la Moselle après la guerre de 1870-1871.",
        isCorrect: true,
        imagePath: "assets/question1.png",
      ),
      Question(
        questionText: "La Tour Eiffel est située à Lyon.",
        isCorrect: false,
        imagePath: "assets/question2.png",
      ),
      Question(
        questionText: "La monnaie officielle de la France est le dollar.",
        isCorrect: false,
        imagePath: "assets/question4.png",
      ),
      Question(
        questionText: "Paris est la capitale de la France.",
        isCorrect: true,
        imagePath: "assets/question3.png",
      ),
      Question(
        questionText: "Le Mont Blanc est le plus haut sommet d'Europe.",
        isCorrect: true,
        imagePath: "assets/question5.png",
      ),
      Question(
        questionText: "France a gagné la Coupe du Monde de football en 2018 ?",
        isCorrect: true,
        imagePath: "assets/question6.png",
      ),
      Question(
        questionText: "France a gagné l'Euro 2018 ?",
        isCorrect: false,
        imagePath: "assets/question7.png",
      ),
      Question(
        questionText: "La Seine traverse Paris.",
        isCorrect: true,
        imagePath: "assets/question8.png",
      ),
    ];
  }
}
