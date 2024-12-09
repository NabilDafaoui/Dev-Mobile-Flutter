import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/blocs/quiz_bloc.dart';
import '../../business_logic/blocs/quiz_event.dart';
import 'quizz.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              context.read<QuizBloc>().add(LoadQuestions());
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                    value: BlocProvider.of<QuizBloc>(context),
                    child: QuizPage(),
                  ),
                ),
              );
            },
            child: Text('Commencer le Quiz'),
          ),
        ),
      ),
    );
  }
}