import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/blocs/quiz_bloc.dart';
import '../../business_logic/blocs/quiz_event.dart';
import '../../business_logic/blocs/quiz_state.dart';

class QuestionCard extends StatelessWidget {
  final QuizLoaded state;

  const QuestionCard({required this.state, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentQuestion = state.questions[state.currentQuestionIndex];

    return SingleChildScrollView(
      child: Container(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height - AppBar().preferredSize.height - MediaQuery.of(context).padding.top,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                currentQuestion.questionText,
                style: TextStyle(fontSize: 22, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              if (currentQuestion.imagePath.isNotEmpty)
                Image.asset(
                  currentQuestion.imagePath,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _submitAnswer(context, true),
                child: Text("Vrai"),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => _submitAnswer(context, false),
                child: Text("Faux"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitAnswer(BuildContext context, bool userAnswer) {
    context.read<QuizBloc>().add(
      SubmitAnswer(isCorrect: userAnswer == state.questions[state.currentQuestionIndex].isCorrectAnswer),
    );
  }
}