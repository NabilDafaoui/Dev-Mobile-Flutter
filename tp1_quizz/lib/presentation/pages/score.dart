import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../data/providers/quiz_provider.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animation de félicitations
            Lottie.asset(
              "assets/congratulations.json",
              height: 200,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),

            // Affiche le score
            Text(
              "Votre score : ${quizProvider.score} / ${quizProvider.totalQuestions}",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),

            // Bouton pour rejouer
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              ),
              onPressed: () {
                quizProvider.resetQuiz();
                Navigator.pushReplacementNamed(context, '/');
              },
              child: const Text("Rejouer"),
            ),
          ],
        ),
      ),
    );
  }
}
