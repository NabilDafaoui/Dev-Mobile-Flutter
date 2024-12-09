import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/blocs/quiz_bloc.dart';
import '../../business_logic/blocs/quiz_state.dart';
import '../widgets/question_card.dart';

class QuizzPage extends StatelessWidget {
  const QuizzPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<QuizBloc, QuizState>(
        builder: (context, state) {
          if (state is QuizLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is QuizLoaded) {
            return QuestionCard(state: state);
          } else if (state is QuizError) {
            return Center(child: Text('Erreur : ${state.message}'));
          }
          return const Center(child: Text("Aucun état reconnu."));
        },
      ),
    );
  }
}
