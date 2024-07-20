import 'package:flutter/material.dart';
import 'package:quiz_app/data/question_data.dart';
import 'package:quiz_app/models/result.dart';
import 'package:quiz_app/ui/widgets/result_tile.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({
    super.key,
    required this.answers,
  });

  final List<String> answers;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late int totalAnswers;
  late int totalCorrectAnswers;
  List<Result> results = [];

  @override
  void initState() {
    results = List.generate(
      widget.answers.length,
      (index) => Result(
        questionIndex: index,
        question: questionData[index].question,
        answer: widget.answers[index],
        correctAnswer: questionData[index].answers[0],
        isCorrect: widget.answers[index] == questionData[index].answers[0],
      ),
    );

    totalAnswers = widget.answers.length;
    totalCorrectAnswers = results
        .where(
          (element) => element.isCorrect == true,
        )
        .length;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Text(
                    'You answered $totalCorrectAnswers out of $totalAnswers questions correctly.',
                    textAlign: TextAlign.center,
                  ),
                  ...results.map(
                    (e) => ResultTile(result: e),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: TextButton.icon(
                onPressed: () {},
                label: const Text('Restart Quiz'),
                icon: const Icon(Icons.refresh),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
