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
  bool isLoaded = false;
  bool isConfirm = false;
  List<int> selectedAnswerIndex = [];

  @override
  void initState() {
    super.initState();

    selectedAnswerIndex.addAll([-1, -1, -1, -1]);
    Quiz.getQuiz(widget.topciId).then((_) {
      setState(() {
        selectedAnswerIndex = List<int>.filled(Quiz.listQuiz.length, -1);
        isLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return !isLoaded
        ? const SizedBox()
        : isConfirm
            ? confirmDialog()
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
                              widthFactor:
                                  currentPageQuiz / Quiz.listQuiz.length,
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
                          text:
                              Quiz.listQuiz[currentPageQuiz - 1].listAnswer[0],
                          isSelected:
                              selectedAnswerIndex[currentPageQuiz - 1] == 0,
                          onPressed: (bool isSelected) {
                            setState(() {
                              if (isSelected) {
                                selectedAnswerIndex[currentPageQuiz - 1] = 0;
                              } else {
                                selectedAnswerIndex[currentPageQuiz - 1] = -1;
                              }
                            });
                          },
                        ),
                        const SizedBox(height: 15),
                        AnswerCard(
                          text:
                              Quiz.listQuiz[currentPageQuiz - 1].listAnswer[1],
                          isSelected:
                              selectedAnswerIndex[currentPageQuiz - 1] == 1,
                          onPressed: (bool isSelected) {
                            setState(() {
                              if (isSelected) {
                                selectedAnswerIndex[currentPageQuiz - 1] = 1;
                              } else {
                                selectedAnswerIndex[currentPageQuiz - 1] = -1;
                              }
                            });
                          },
                        ),
                        const SizedBox(height: 15),
                        AnswerCard(
                          text:
                              Quiz.listQuiz[currentPageQuiz - 1].listAnswer[2],
                          isSelected:
                              selectedAnswerIndex[currentPageQuiz - 1] == 2,
                          onPressed: (bool isSelected) {
                            setState(() {
                              if (isSelected) {
                                selectedAnswerIndex[currentPageQuiz - 1] = 2;
                              } else {
                                selectedAnswerIndex[currentPageQuiz - 1] = -1;
                              }
                            });
                          },
                        ),
                        const SizedBox(height: 15),
                        AnswerCard(
                          text:
                              Quiz.listQuiz[currentPageQuiz - 1].listAnswer[3],
                          isSelected:
                              selectedAnswerIndex[currentPageQuiz - 1] == 3,
                          onPressed: (bool isSelected) {
                            setState(() {
                              if (isSelected) {
                                selectedAnswerIndex[currentPageQuiz - 1] = 3;
                              } else {
                                selectedAnswerIndex[currentPageQuiz - 1] = -1;
                              }
                            });
                          },
                        ),
                        const SizedBox(height: 40),
                        currentPageQuiz != Quiz.listQuiz.length
                            ? InkWell(
                                onTap: () {
                                  setState(() {
                                    currentPageQuiz += 1;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
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
                                onTap: () {
                                  setState(() {
                                    isConfirm = true;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
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
                                    "Finish",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              );
  }

  Widget confirmDialog() {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 20,
          ),
          width: MediaQuery.of(context).size.width - 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              const Text(
                "Are you sure you want to submit your quiz ?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Once submitted, your answers cannot be changed. Confirm by clicking the ‘Submit’ button.",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: owlMidBlue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "Submit",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  setState(() {
                    isConfirm = false;
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "Cancel",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
