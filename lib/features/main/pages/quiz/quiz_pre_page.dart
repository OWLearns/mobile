import 'package:flutter/material.dart';
import 'package:mobile/features/main/pages/quiz/quiz_page.dart';
import 'package:mobile/shared/themes/color.dart';

class QuizPrePage extends StatelessWidget {
  final String topicId;
  final String topicName;
  const QuizPrePage({
    required this.topicId,
    required this.topicName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text("Quiz Web Dev"),
              const Text("React Dev"),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => QuizPage(
                        topicId: topicId,
                        topicName: topicName,
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: owlMidBlue,
                  ),
                  child: const Text("Start Quiz"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
