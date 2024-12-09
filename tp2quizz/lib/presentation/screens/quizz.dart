import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/blocs/quiz_bloc.dart';
import '../../business_logic/blocs/quiz_event.dart';
import '../../business_logic/blocs/quiz_state.dart';
import '../widgets/question_card.dart';
import 'score.dart';

class QuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quiz')),
      body: BlocBuilder<QuizBloc, QuizState>(
        builder: (context, state) {
          if (state is QuizLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is QuizLoaded) {
            return QuestionCard(state: state);
          } else if (state is QuizCompleted) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Votre score : ${state.score} / ${state.totalQuestions}',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.read<QuizBloc>().add(RestartQuiz());
                      Navigator.popUntil(context, ModalRoute.withName('/'));
                    },
                    child: Text("Rejouer"),
                  ),
                ],
              ),
            );
          } else if (state is QuizError) {
            return Center(child: Text(state.message));
          }
          return Center(child: Text('Unknown state'));
        },
      ),
    );
  }
}