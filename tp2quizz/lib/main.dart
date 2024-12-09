import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'business_logic/blocs/quiz_bloc.dart';
import 'data/repositories/question_repository.dart';
import '../../presentation/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final QuestionRepository questionRepository = QuestionRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      home: BlocProvider(
        create: (context) => QuizBloc(questionRepository),
        child: HomePage(),
      ),
    );
  }
}