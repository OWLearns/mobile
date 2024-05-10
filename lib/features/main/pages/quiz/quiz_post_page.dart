import 'package:flutter/material.dart';

class QuizPostPage extends StatelessWidget {
  const QuizPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("Quiz Web Dev"),
            const Text("React Dev"),
            const Text("Nilai : 98"),
            InkWell(
              onTap: () {},
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
    );
  }
}
