import 'package:flutter/material.dart';
import 'package:mobile/shared/themes/color.dart';

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
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: owlBase,
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Quiz Selesai",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "$topicName Quiz",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "Score: ${finalScore.floor()}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 15),
                finalScore > 70
                    ? Text(
                        "Selamat, Anda Telah Menyelasaikan $topicName Quiz!!",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      )
                    : Text(
                        "Sayang sekali anda belum berhasil menyelesaikan $topicName Quiz, coba lagi ya!",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                const SizedBox(height: 30),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: owlMidBlue,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text(
                      "Back To Course Page",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
