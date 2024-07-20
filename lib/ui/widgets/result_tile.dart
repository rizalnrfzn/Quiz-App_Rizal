import 'package:flutter/material.dart';
import 'package:quiz_app/models/result.dart';
import 'package:quiz_app/ui/palette.dart';

class ResultTile extends StatelessWidget {
  const ResultTile({super.key, required this.result});

  final Result result;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Palette.cardDark,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor:
                  result.isCorrect ? Palette.greenMocha : Palette.redMocha,
              child: Text(
                (result.questionIndex + 1).toString(),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Palette.text,
                    ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    result.question,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Your answer: ${result.answer}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Correct answer: ${result.correctAnswer}',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Palette.greenMocha,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
