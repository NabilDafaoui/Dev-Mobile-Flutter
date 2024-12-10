import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'data/providers/quiz_provider.dart';
import 'business_logic/blocs/quiz_bloc.dart';
import 'business_logic/blocs/quiz_event.dart';
import 'data/repositories/question_repository.dart';
import 'presentation/pages/quizz.dart';
import 'presentation/pages/score.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final questionRepository = QuestionRepository();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QuizProvider()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => QuizBloc(questionRepository)
              ..add(LoadQuestions()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Quiz App',
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const QuizzPage(),
            '/score': (context) => const ScorePage(),
          },
        ),
      ),
    );
  }
}
