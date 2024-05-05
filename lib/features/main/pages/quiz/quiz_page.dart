import 'package:flutter/material.dart';
import 'package:mobile/shared/themes/color.dart';
import 'package:mobile/shared/widgets/answer_card.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<bool> cardPressedStates = [false, false, false, false];
  int selectedAnswerIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: owlBase,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        // Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                  ),
                  const Expanded(
                    flex: 8,
                    child: Text(
                      "Web Development",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      "5/10",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              UnconstrainedBox(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 12,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(24),
                    ),
                    color: Color(0xffD9D9D9),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.bottomLeft,
                    widthFactor: 0.5,
                    child: Container(
                      decoration: const BoxDecoration(
                        // color: Colors.blue,
                        gradient: LinearGradient(
                            colors: [Color(0xff333A73), Color(0xff387ADE)]),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'a',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 90),
              const Text(
                "What does HTML stand for?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 30),
              AnswerCard(
                text: "Hyper Text Markup Language",
                isSelected: selectedAnswerIndex == 0,
                onPressed: (bool isSelected) {
                  setState(() {
                    if (isSelected) {
                      selectedAnswerIndex = 0;
                    } else {
                      selectedAnswerIndex = -1;
                    }
                  });
                },
              ),
              const SizedBox(height: 15),
              AnswerCard(
                text: "Hyper Text Markup Linguistic",
                isSelected: selectedAnswerIndex == 1,
                onPressed: (bool isSelected) {
                  setState(() {
                    if (isSelected) {
                      selectedAnswerIndex = 1;
                    } else {
                      selectedAnswerIndex = -1;
                    }
                  });
                },
              ),
              const SizedBox(height: 15),
              AnswerCard(
                text: "Hyper Text Markup Latina",
                isSelected: selectedAnswerIndex == 2,
                onPressed: (bool isSelected) {
                  setState(() {
                    if (isSelected) {
                      selectedAnswerIndex = 2;
                    } else {
                      selectedAnswerIndex = -1;
                    }
                  });
                },
              ),
              const SizedBox(height: 15),
              AnswerCard(
                text: "Hyper Text Markup Lorem",
                isSelected: selectedAnswerIndex == 3,
                onPressed: (bool isSelected) {
                  setState(() {
                    if (isSelected) {
                      selectedAnswerIndex = 3;
                    } else {
                      selectedAnswerIndex = -1;
                    }
                  });
                },
              ),
              const SizedBox(height: 90),
              InkWell(
                onTap: selectedAnswerIndex != -1
                    ? () {
                        print("tapped");
                      }
                    : null,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      selectedAnswerIndex == -1
                          ? const Color(0xff333A73).withOpacity(0.7)
                          : const Color(0xff333A73),
                      selectedAnswerIndex == -1
                          ? const Color(0xff387ADE).withOpacity(0.7)
                          : const Color(0xff387ADE)
                    ]),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Continue",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
