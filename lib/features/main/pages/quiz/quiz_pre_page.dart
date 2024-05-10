import 'package:flutter/material.dart';

class QuizPrePage extends StatelessWidget {
  const QuizPrePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("Quiz Web Dev"),
            const Text("React Dev"),
            InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: const Text("Start Quiz"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
