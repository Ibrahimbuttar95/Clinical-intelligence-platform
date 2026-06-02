import 'package:flutter/material.dart';

class RiskCard
    extends StatelessWidget {

  final String level;

  final int score;

  final String advice;

  const RiskCard({
    super.key,
    required this.level,
    required this.score,
    required this.advice,
  });

  @override
  Widget build(
      BuildContext context) {

    return Card(

      child: Padding(
        padding:
            const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Text(
              "Risk Level: $level",
            ),

            Text(
              "Score: $score",
            ),

            const SizedBox(
              height: 10,
            ),

            Text(
              advice,
            ),
          ],
        ),
      ),
    );
  }
}
