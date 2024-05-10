import 'package:flutter/material.dart';

class QuizPostPage extends StatelessWidget {
  final String topicName;
  final double finalScore;
  const QuizPostPage({
    required this.topicName,
    required this.finalScore,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(topicName),
              Text("Score : $finalScore"),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: const Text("Back To Course Page"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
