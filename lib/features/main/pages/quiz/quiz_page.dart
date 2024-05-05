import 'package:flutter/material.dart';
import 'package:mobile/features/main/pages/quiz/quiz_model.dart';
import 'package:mobile/shared/themes/color.dart';
import 'package:mobile/shared/widgets/answer_card.dart';

class QuizPage extends StatefulWidget {
  final int topciId = 1;
  final String topicName = "Web Dev";
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentPageQuiz = 1;
  List<bool> cardPressedStates = [false, false, false, false];
  int selectedAnswerIndex = -1;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();

    Quiz.getQuiz(widget.topciId).then((_) {
      setState(() {
        isLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return !isLoaded
        ? const SizedBox()
        : Scaffold(
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
                          flex: 1,
                          child: currentPageQuiz != 1
                              ? InkWell(
                                  onTap: () {
                                    setState(() {
                                      currentPageQuiz -= 1;
                                    });
                                  },
                                  child: const Icon(Icons.arrow_back_ios),
                                )
                              : const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.grey,
                                ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            widget.topicName,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            "$currentPageQuiz / ${Quiz.listQuiz.length}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
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
                          widthFactor: currentPageQuiz / Quiz.listQuiz.length,
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xff333A73),
                                Color(0xff387ADE)
                              ]),
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
                    const SizedBox(height: 60),
                    Text(
                      Quiz.listQuiz[currentPageQuiz - 1].questionQuiz,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 30),
                    AnswerCard(
                      text: Quiz.listQuiz[currentPageQuiz - 1].listAnswer[0],
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
                      text: Quiz.listQuiz[currentPageQuiz - 1].listAnswer[1],
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
                      text: Quiz.listQuiz[currentPageQuiz - 1].listAnswer[2],
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
                      text: Quiz.listQuiz[currentPageQuiz - 1].listAnswer[3],
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
                    const SizedBox(height: 40),
                    currentPageQuiz != Quiz.listQuiz.length
                        ? InkWell(
                            onTap: selectedAnswerIndex != -1
                                ? () {
                                    setState(() {
                                      currentPageQuiz += 1;
                                    });
                                  }
                                : null,
                            child: Container(
                              padding: const EdgeInsets.all(10),
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
                              child: const Text(
                                "Continue",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                        : InkWell(
                            onTap: selectedAnswerIndex != -1
                                ? () {
                                    setState(() {});
                                  }
                                : null,
                            child: Container(
                              padding: const EdgeInsets.all(10),
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
                              child: const Text(
                                "Finish",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
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
