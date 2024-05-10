import 'dart:convert';

import 'package:http/http.dart' as http;

class Quiz {
  final String questionQuiz;
  final List listAnswer;
  final int correctAnswer;

  static List<Quiz> listQuiz = [];

  Quiz({
    required this.questionQuiz,
    required this.listAnswer,
    required this.correctAnswer,
  });

  static getQuiz(String topicId) async {
    listQuiz = [];

    final response = await http.get(
      Uri.parse("https://nodejsdeployowl.et.r.appspot.com/getQuiz/51"),
    );

    final bodyResponse = await jsonDecode(response.body)['data'];

    bodyResponse.map((dataQuiz) {
      listQuiz.add(
        Quiz(
          questionQuiz: dataQuiz['question'],
          listAnswer: dataQuiz['multiple_choice'],
          correctAnswer: dataQuiz['answer'],
        ),
      );
    }).toList();
  }
}
