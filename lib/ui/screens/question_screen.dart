import 'package:flutter/material.dart';
import 'package:quiz_app/data/question_data.dart';
import 'package:quiz_app/ui/widgets/answer_button.dart';
import 'package:quiz_app/ui/screens/result_screen.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int questionIndex = 0;

  List<String> answers = [];

  void selectAnswer(String answer) {
    if (questionIndex >= questionData.length - 1) {
      answers.add(answer);
      questionIndex++;

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            answers: answers,
          ),
        ),
      );
    } else {
      setState(() {
        answers.add(answer);
        questionIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                questionData[questionIndex].question,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ...questionData[questionIndex].getShuffledAnswers().map(
                (answer) {
                  return AnswerButton(
                    onPressed: () => selectAnswer(answer),
                    text: answer,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
