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
                result.questionIndex.toString(),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Palette.text,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
